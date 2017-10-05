//
//  ViewController.swift
//  CIDR App
//
//  Created by Mahmoud Aljarrash on 10/4/17.
//  Copyright © 2017 Mahmoud Aljarrash. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var cidrTxt: UITextField!

    let cidrPicker = UIPickerView()
    
    let cidrValues: [Int] = Array(1...31)
    var selectedCidr: String?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return String(cidrValues[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return cidrValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedCidr = String(cidrValues[row])
        cidrTxt.text = selectedCidr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cidrPicker.delegate = self
        cidrPicker.dataSource = self
        
        //binding textfield to picker
        cidrTxt.inputView = cidrPicker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    


}

