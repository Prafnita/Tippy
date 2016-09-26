//
//  ViewController.swift
//  Tippy
//
//  Created by Sunita Nakhate on 9/25/16.
//  Copyright © 2016 Sunita Nakhate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipAmountLabel.text = "$0.00"
        totalAmountLabel.text = "$0.00"
        
        billAmountField.keyboardType = UIKeyboardType.decimalPad
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTipAmount(_ sender: AnyObject) {
        
        let billAmt = Double(billAmountField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.20]
        
        let tipAmt = billAmt * tipPercentages[tipPercentageControl.selectedSegmentIndex]
        
        let totalAmt = billAmt + tipAmt
        
        tipAmountLabel.text = String.init(format: "$%.2f", tipAmt)
        totalAmountLabel.text = String.init(format: "$%.2f", totalAmt)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var defaults = UserDefaults.standard
        var tipDefaultValue = defaults.integer(forKey: "defaultTipControl")
        
        
        tipPercentageControl.selectedSegmentIndex = tipDefaultValue
        calculateTipAmount(animated as AnyObject)
        // Optionally initialize the property to a desired starting value
        
    }
}

