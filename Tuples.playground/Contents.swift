//Unnamed Tuple
//let tipAndTotal = [4.00,25.19]
let tipAndTotal:(Double,Double)=(4.00,25.19);

//to access elements in a Tuple, you have two options. To access it by index, or decomposing it by name
tipAndTotal.0;
tipAndTotal.1;

let (theTipAmt,theTipTot)=tipAndTotal;
theTipAmt;
theTipTot;

//Named Tuples
let tipAndTotalNamed=(tipAmt:4.00,tipTot:25.19);
tipAndTotalNamed.tipAmt;
tipAndTotalNamed.tipTot;

//Returning Tuples
let total=21.19;
let taxPct=0.06;
let subTotal=total/(taxPct+1)
func calculateTipWitTaxPct(tipPct:Double)->(tipAmt:Double,total:Double){
    let tipAmt=subTotal*tipPct;
    let finalTotal=subTotal+tipAmt;
    return (tipAmt,finalTotal);
}

calculateTipWitTaxPct(0.20);
