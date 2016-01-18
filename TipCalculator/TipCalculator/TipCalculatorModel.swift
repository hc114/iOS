//A full prototype
//***for optional protocols and methods***
import Foundation
//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Main Account on 9/15/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct: Double) -> (tipAmt:(Double),total:(Double)) {
        let tipAmt=subtotal * tipPct;
        let total=subtotal+tipAmt;
        return(tipAmt,total);
    }
    
    func returnPossibleTips() -> [Int: (tipAmt:Double,total:Double)] {
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        var retval = [Int: (tipAmt:Double,total:Double)]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
        
    }
    
}

/*let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
tipCalc.returnPossibleTips()*/

// 1
import UIKit
// 2
class TestDataSource : NSObject, UITableViewDataSource {
    
    /*1 of 2 you have to implement. Asks you how many rows are in each section of the table view*/
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int)->Int{
        return sortedKeys.count
    }
    
    /*2 of 2 */
    //1
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 2
        let cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        
        // 3
        let tipPct = sortedKeys[indexPath.row]
        // 4
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        // 5
        cell.textLabel?.text = "\(tipPct)%:"
        cell.detailTextLabel?.text = String(format:"Tip: $%0.2f, Total: $%0.2f", tipAmt, total)
        return cell
    }
    
    // 3
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTips = Dictionary<Int, (tipAmt:Double, total:Double)>()
    var sortedKeys:[Int] = []
    
    // 4
    override init() {
        possibleTips = tipCalc.returnPossibleTips()
        sortedKeys = Array(possibleTips.keys).sort()
        super.init()
    }
    //Making this class conform to the UITableViewDataSource
    
    
}

/*
1. In order to use UIKit classes like UITableView, you first need to import the UIKit framework. If you get an error on this line, bring up the File Inspector (View\Utilities\Show File Inspector) and set the Platform to iOS.
2. One of the requirements of implementing UITableViewDataSource is that your class extends NSObject (either directly or through intermediate classes).
3. Here you initialize the tip calculator, and make an empty array for the possible tips and sorted keys. Note that you are keeping possibleTips and sortedKeys as variables (not constants) because in the actual app you’ll want these to be able to change over time.
4. In init, you set up the two variables with initial values. Note that you need to mark this initializer with override because you are overriding the init method from NSObject.
*/

