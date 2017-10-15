//
//  updateQuotationViewController.swift
//  Best Quotation
//
//  Created by Mahmoud Aljarrash on 10/12/17.
//  Copyright © 2017 Mahmoud Aljarrash. All rights reserved.
//

import UIKit

class updateQuotationViewController: UIViewController {

    @IBOutlet weak var qoutationTxt: UITextField!
    @IBOutlet weak var byTxt: UITextField!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any)
    {
        qoutationTxt.resignFirstResponder()
        byTxt.resignFirstResponder()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "mainVcSeque"
        {
            let vc = segue.destination as! ViewController
            
            if qoutationTxt.text!.isEmpty == false
            {
                vc.theQuotation.qoutation = qoutationTxt.text!
            }
            
            if byTxt.text!.isEmpty == false
            {
                vc.theQuotation.by = "By " + byTxt.text!
            }
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
