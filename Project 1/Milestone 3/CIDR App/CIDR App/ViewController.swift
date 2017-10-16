//
//  ViewController.swift
//  CIDR App
//
//  Created by Mahmoud Aljarrash on 10/4/17.
//  Copyright © 2017 Mahmoud Aljarrash. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    

    @IBOutlet weak var cidrTxt: UITextField!
    @IBOutlet weak var ipAddressTxt: UITextField!
 

    let cidrPicker = UIPickerView()
    var myNetwork = NetworkInfo()
    let cidrValues: [Int] = Array(8...30)
    var selectedCidr: String?
    
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue)
    {
        
    }
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
    
    @IBAction func onTapGestureRecognized(_ sender: Any)
    {
        ipAddressTxt.resignFirstResponder()
        cidrTxt.resignFirstResponder()

    }
    
    @IBAction func calculateBtnClicked(_ sender: UIButton)
    {
        let userEnteredIpAddressStr = ipAddressTxt.text
        print("userEnteredIpAddress", userEnteredIpAddressStr!)
        
        
        // checking if the entered IP address is valid and that the cidr is set
        if isValidIpAddress(ipAddressToValidate: userEnteredIpAddressStr!) && selectedCidr != nil
        {
            // create an instance of NetworkInfo
            print("valid IP")
            myNetwork = NetworkInfo(ipAddress: userEnteredIpAddressStr!, cidr: selectedCidr!)

        }
        else
        {
            // display error message
            print("Invalid IP")
            wrongOrMissingValuesAlert()
        }
    
    }
    
    /*
     * Usage: Check if an IP address is in correct format
     * Input: String
     * Output: Bool
    */
    func isValidIpAddress(ipAddressToValidate: String) -> Bool
    {
        var sin = sockaddr_in()
        
        if ipAddressToValidate.withCString({ cstring in inet_pton(AF_INET, cstring, &sin.sin_addr)}) == 1
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    /*
     * Usage: Display an error message
     * Input: N/A
     * Output: Void
     */
    func wrongOrMissingValuesAlert()
    {
        //create a UIAlertController object
        let alert=UIAlertController(title: "Warning", message: "Invalid IP Address OR Invalid CIDR", preferredStyle:
            UIAlertControllerStyle.alert)
       
        let okAction = UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        //present alert
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "networkInfoSegue"
        {
            let networkInfoVC = segue.destination as! NetworkInfoViewController
            
            // checking if the entered IP address is valid and that the cidr is set
            if selectedCidr != nil && myNetwork.ipAddress != nil && isValidIpAddress(ipAddressToValidate: myNetwork.ipAddress!)
            {
                networkInfoVC.networkDetails = myNetwork.ipAddress! + " \\ " + selectedCidr!
                networkInfoVC.subnetMaskIpAddress = myNetwork.maskIpAddress!
                networkInfoVC.networkIpAddress = myNetwork.networkIpAddress!
                networkInfoVC.broadcastIpAddress = myNetwork.broadcastIpAddress!
                networkInfoVC.numOfSubnets = String(myNetwork.numOfSubnets)
                networkInfoVC.numOfHosts = String(myNetwork.numOfHosts)
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        // clear the IP address text field
        if ipAddressTxt.text == "Enter an IP Address"
        {
            ipAddressTxt.text = ""
        }
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cidrPicker.delegate = self
        cidrPicker.dataSource = self
       
        ipAddressTxt.delegate = self
        //binding textfield to picker
        cidrTxt.inputView = cidrPicker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /*
 <a href="https://icons8.com/icon/50090/Web-Address">Web address icon credits</a>

    */
    


}

