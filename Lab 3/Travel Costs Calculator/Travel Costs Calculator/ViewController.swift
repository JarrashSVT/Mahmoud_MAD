//
//  ViewController.swift
//  Travel Costs Calculator
//
//  Created by Mahmoud Aljarrash on 9/26/17.
//  Copyright © 2017 Mahmoud Aljarrash. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
      //Labels
    @IBOutlet weak var resultLabel: UILabel!
    
    //TextFields
    @IBOutlet weak var distanceTxt: UITextField!
    
    @IBOutlet weak var fuelPriceTxt: UITextField!
    @IBOutlet weak var numOfPersonsTxt: UITextField!
    @IBOutlet weak var consumptionRateTxt: UITextField!
    @IBOutlet weak var fixedCostTxt: UITextField!
    
    @IBOutlet weak var roundTripSwitch: UISwitch!
    
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue)
    {

    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any)
    {
        distanceTxt.resignFirstResponder()
        fuelPriceTxt.resignFirstResponder()
        numOfPersonsTxt.resignFirstResponder()
        consumptionRateTxt.resignFirstResponder()
        fixedCostTxt.resignFirstResponder()
    }
    @IBAction func calculateBtnClicked(_ sender: UIButton)
    {
        //format results as currency
        let currencyFormat = NumberFormatter()
        //set the number format
        currencyFormat.numberStyle = NumberFormatter.Style.currency
        
        resultLabel.text = currencyFormat.string(from: (NSNumber(value: calculate())))!

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculate() -> Float
    {
        var distance: Float = 0
        if (distanceTxt.text!.isEmpty || Float(distanceTxt.text!)! <= 0.0)
        {
            wrongOrMissingValuesAlert(value: "distance")
        }
        else
        {
            distance = Float(distanceTxt.text!)!
        }
        
        var fuelPrice: Float = 0
        if (fuelPriceTxt.text!.isEmpty || Float(fuelPriceTxt.text!)! <= 0.0)
        {
            wrongOrMissingValuesAlert(value: "Fuel Price")
        }
        else
        {
            fuelPrice = Float(fuelPriceTxt.text!)!
        }
        
        var numOfPersons: Float = 1
        if(numOfPersonsTxt.text!.isEmpty || Int(floor(Double(numOfPersonsTxt.text!)!)) < 1)
        {
            wrongOrMissingValuesAlert(value: "Number Of Persons")
        }
        else
        {
            numOfPersons = Float(floor(Double(numOfPersonsTxt.text!)!))
        }
        
        
        var consumptionRate: Float = 0.0
        if(consumptionRateTxt.text!.isEmpty || Float(consumptionRateTxt.text!)! <= 0.0)
        {
            wrongOrMissingValuesAlert(value: "Consumption Rate")
        }
        else
        {
            consumptionRate = Float(consumptionRateTxt.text!)!
            print(consumptionRate)
            
            consumptionRate = 1 / consumptionRate
            print(consumptionRate)
        }
        
        var fixedRate: Float = 0.0
        if(fixedCostTxt.text!.isEmpty || Float(consumptionRateTxt.text!)! <= 0.0 )
        {
            wrongOrMissingValuesAlert(value: "Fixed Rate")
        }
        else
        {
            fixedRate = Float(fixedCostTxt.text!)!
            
        }
        
        var roundTrip: Float = 1
        if roundTripSwitch.isOn
        {
            roundTrip = 2
        }
        
        let costPerPerson = (distance * fuelPrice * consumptionRate * roundTrip) + fixedRate
        
        return costPerPerson/numOfPersons
    }

    

    func wrongOrMissingValuesAlert(value: String)
    {
        //create a UIAlertController object
        let alert=UIAlertController(title: "Warning", message: "The \(value) must be greater than 0", preferredStyle:
            UIAlertControllerStyle.alert)
        //create a UIAlertAction object for the button
       // let cancelAction = UIAlertAction(title: "Cancel",
                                        // style:UIAlertActionStyle.cancel, handler: nil)
        //add the alert action to the alert object
        //alert.addAction(cancelAction)
        let okAction = UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        //present alert
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "resultView"
        {
            let resultVC = segue.destination as! ResultViewController
        
            resultVC.theResult = resultLabel.text!
        }
    }

}

