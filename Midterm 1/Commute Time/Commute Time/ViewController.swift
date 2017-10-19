//
//  ViewController.swift
//  Commute Time
//
//  Created by Mahmoud Aljarrash on 10/19/17.
//  Copyright © 2017 Mahmoud Aljarrash. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var milesTxt: UITextField!
    
    @IBOutlet weak var gasValueLabel: UILabel!
    @IBOutlet weak var monthlySwitch: UISwitch!
    @IBOutlet weak var gasToPurchaseLabel: UILabel!
    @IBOutlet weak var commuteTimeLabel: UILabel!
    @IBOutlet weak var vehicleImage: UIImageView!
    @IBOutlet weak var vehicleTypeSegment: UISegmentedControl!
    
    override func viewDidLoad()
    {
        
        milesTxt.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func vehicleChanged(_ sender: UISegmentedControl)
    {
        chooseVehilce()
    }
    @IBAction func switchChanged(_ sender: UISwitch)
    {
        chooseVehilce()
    }
    @IBAction func silderChanged(_ sender: UISlider)
    {
        let gas = sender.value
        gasValueLabel.text = String(roundff(gas, toNearest: 0.01)) + " Gallons"
       // roundf(<#T##Float#>)
        //let fontSizeCGFloat = CGFloat(fontSize)
        //cobraNameLabel.font = UIFont.systemFont(ofSize: fontSizeCGFloat)

    }
  
    
    @IBAction func commuteBtnClicked(_ sender: UIButton)
    {
        /*let commuteTime = Float(milesTxt.text!)!/20
        
        let gasRequired = Float(milesTxt.text!)!/24
        
        var monthly: Float = 1.0
        
        if monthlySwitch.isOn
        {
            monthly = 20.0
        }
        
        commuteTimeLabel.text = String(commuteTime * 60 * monthly) + " min"
        
        gasToPurchaseLabel.text = String(roundf(gasRequired * monthly)) + " gallons"*/
        
       // calculateCommutTime(speed: 20, gas: 24 , isBike: false)
        
        chooseVehilce()
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any)
    {
        milesTxt.resignFirstResponder()
    }
    
    func chooseVehilce()
    {
        if vehicleTypeSegment.selectedSegmentIndex == 0
        {
            vehicleImage.image = UIImage(named: "car_icon")
            calculateCommutTime(speed: 20, gas: 24, isBike: false)
        }
        else if vehicleTypeSegment.selectedSegmentIndex == 1
        {
            vehicleImage.image = UIImage(named: "bus_icon")
            calculateCommutTime(speed: 10, gas: 0, isBike: false)
        }
        else
        {
            vehicleImage.image = UIImage(named: "bike_icon")
            calculateCommutTime(speed: 12, gas: 0, isBike: true)
        }
    }
    
    func calculateCommutTime(speed: Float, gas: Float, isBike: Bool)
    {
        let bikeDelay: Float = 0.1667
        var commuteTime = Float(milesTxt.text!)!/speed
        if isBike
        {
            commuteTime = commuteTime + bikeDelay
        }
        
        
        var gasRequired: Float = 0.0
        
        if gas != 0.0
        {
            gasRequired = Float(milesTxt.text!)!/gas
        }
        
        
        var monthly: Float = 1.0
        
        if monthlySwitch.isOn
        {
            monthly = 20.0
            //wrongOrMissingValuesAlert(value: "test")
        }
        
        commuteTimeLabel.text = String(commuteTime * 60 * monthly) + " min"
        
        gasToPurchaseLabel.text = String(roundf(gasRequired * monthly)) + " gal"

    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if Float(milesTxt.text!)! > 50.0
        {
            wrongOrMissingValuesAlert(value: "You're Commuting over 50 miles!!")
        }
    }
    func wrongOrMissingValuesAlert(value: String)
    {
        //create a UIAlertController object
        let alert=UIAlertController(title: "Warning", message: "\(value)", preferredStyle:
            UIAlertControllerStyle.alert)
                //alert.addAction(cancelAction)
        let okAction = UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        //present alert
        present(alert, animated: true, completion: nil)
    }
    
    
    func roundff(_ value: Float, toNearest: Float) -> Float {
        return round(value / toNearest) * toNearest
    }

}

