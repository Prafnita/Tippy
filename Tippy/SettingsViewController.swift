//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Sunita Nakhate on 9/25/16.
//  Copyright © 2016 Sunita Nakhate. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControlField: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tipValue = defaults.integer(forKey: "defaultTipControl")
        
        defaultTipControlField.selectedSegmentIndex = tipValue
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveTipDefault(_ sender: AnyObject) {
        defaults.set(defaultTipControlField.selectedSegmentIndex, forKey: "defaultTipControl")
        defaults.synchronize()
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
