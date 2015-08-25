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
    
    @IBOutlet weak var animatedView: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        totalLabel.text = "$0.00"
        tipLabel.text = "Tip $0.00"
        billField.text = "$"
        self.animatedView.alpha = 0
        self.tipControl.alpha = 0
        self.tipLabel.alpha = 0
        
        println(billField.frame.origin)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

        
    }



    @IBAction func onEditingBegin(sender: UITextField) {
        billField.text = "$\(dropFirst(billField.text))"
//        totalLabel.text = "$0.00"
//        tipLabel.text = "Tip $0.00"
        headCountLabel.text = "1@"
        headCountSlider.value = 1
        headCountSlider.hidden = true
        
        if count(billField.text) <= 1 {
            self.billField.frame.origin.y = 94
        }


        
    }

    @IBAction func onEditingEnd(sender: AnyObject) {
        if count(billField.text) <= 1 {
            self.billField.frame.origin.y = 144
        }
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.15, 0.18, 0.20]
        var selectedTip = tipPercentages[tipControl.selectedSegmentIndex]
 
        
        UIView.animateWithDuration(0.5, animations: {
            self.animatedView.alpha = 1
            self.tipControl.alpha = 1
            self.tipLabel.alpha = 1
        })
        
        if count(billField.text) == 1 {
            self.billField.frame.origin.y += 50
            self.animatedView.alpha = 0
            self.tipControl.alpha = 0
            self.tipLabel.alpha = 0
            view.endEditing(true)
            
        } else if count(billField.text) > 1 {

            var billAmount = NSString(string: dropFirst(billField.text)).doubleValue
            var tip = billAmount * selectedTip
            var headCount = Int(headCountSlider.value)
            var total = (billAmount + tip)/Double(headCount)
            
            headCountLabel.text = "\(headCount)@"
            tipLabel.text = String(format: "Tip $%.2f", tip )
            totalLabel.text = String(format: "$%.2f", total)
        }
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

