//
//  infoViewController.swift
//  Commute Time
//
//  Created by Mahmoud Aljarrash on 10/19/17.
//  Copyright © 2017 Mahmoud Aljarrash. All rights reserved.
//

import UIKit

class infoViewController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any)
    {
        //milesTxt.resignFirstResponder()
        nameTxt.resignFirstResponder()
        emailTxt.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "unsegue"
        {
            let vc = segue.destination as! ViewController
            
            vc.name = nameTxt.text
            vc.email = emailTxt.text
            
            //resultVC.theResult = resultLabel.text!
        }
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
