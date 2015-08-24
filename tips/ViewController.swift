//
//  ViewController.swift
//  tips
//
//  Created by gwychan on 8/23/15.
//  Copyright (c) 2015 gwychan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var headCountSlider: UISlider!
    @IBOutlet weak var headCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        totalLabel.text = "$0.00"
        tipLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

        
    }



    @IBAction func onEditingBegin(sender: UITextField) {
        billField.text = "$"
        totalLabel.text = "$0.00"
        tipLabel.text = "$0.00"
        headCountLabel.text = "1"
        headCountSlider.value = 1
        headCountSlider.hidden = true
        

        
    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var selectedTip = tipPercentages[tipControl.selectedSegmentIndex]
     
        var billAmount = NSString(string: dropFirst(billField.text)).doubleValue
        var tip = billAmount * selectedTip
        
        var headCount = Int(headCountSlider.value)
        var total = (billAmount + tip)/Double(headCount)
       
        headCountLabel.text = "\(headCount)"
        tipLabel.text = String(format: "Tip $%.2f", tip )
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        headCountSlider.hidden = false
    }


    @IBAction func onValuedChanged(sender: UISegmentedControl) {
        view.endEditing(true)
        headCountSlider.hidden = false
        
    }

}

