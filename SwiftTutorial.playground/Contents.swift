class TipCalculator{
    //properties in Swift
    let total:Double
    let taxPercent:Double
    let subtotal:Double

   //creating an initializer. You can have more than one initializer in Seift, but they must take in different parameters.
    init(total:Double, taxPercent:Double){
        self.total=total;
        self.taxPercent=taxPercent;
        self.subtotal=total/(1+taxPercent);
    }
    //after -> is the return type
    func calculateTipwithTaxPercent(tipPercent: Double)->Double{
        return subtotal*tipPercent;
    }
    
  /*  func printPossibleTips(){
        print("15%: \(calculateTipwithTaxPercent(0.15))")
        print("20%: \(calculateTipwithTaxPercent(0.20))")
        print("25%: \(calculateTipwithTaxPercent(0.25))")
        
    }*/
    
   /* func printPossibleTips(){
       let possibleTips=[0.15,0.20,0.25];
        for possibleTip in possibleTips{
            print("\(possibleTip*100)% \(calculateTipwithTaxPercent(possibleTip))")
     
        }
           }
*/
    //Dictionary Formatting (key is the int and the value is the double)
    func returnPossibleTips()->[Int:Double]{
        let possibleTips=[0.15,0.20,0.25]
        
        //create an empty dictionary
        var retval=[Int:Double]();
        for possibleTip in possibleTips{
            let intPct=Int(possibleTip*100);
            //set an item in a dictionary
            retval[intPct]=calculateTipwithTaxPercent(possibleTip);
        }
        return retval;
        
    }
    
    
}

let tipCalc=TipCalculator(total: 33.25, taxPercent: 0.06);
//tipCalc.printPossibleTips();
tipCalc.returnPossibleTips();