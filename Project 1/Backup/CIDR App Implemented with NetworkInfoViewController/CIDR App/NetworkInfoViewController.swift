//
//  NetworkInfoViewController.swift
//  CIDR App
//
//  Created by Mahmoud Aljarrash on 10/11/17.
//  Copyright © 2017 Mahmoud Aljarrash. All rights reserved.
//

import UIKit

class NetworkInfoViewController: UIViewController
{

    var networkDetails = String()
    var subnetMaskIpAddress = String()
    var broadcastIpAddress = String()
    var networkIpAddress = String()
    var numOfHosts = String()
    var numOfSubnets = String()
    
    @IBOutlet weak var subnetMaskIpAddressLabel: UILabel!
    @IBOutlet weak var networkDetailsLabel: UILabel!
    @IBOutlet weak var broadcastIpAddressLabel: UILabel!
    @IBOutlet weak var networkIpAddressLabel: UILabel!
    @IBOutlet weak var numOfHostsLabel: UILabel!
    @IBOutlet weak var numOfSubnetsLabel: UILabel!
    
    
    override func viewDidLoad()
    {
        networkDetailsLabel.text = networkDetails
        subnetMaskIpAddressLabel.text = subnetMaskIpAddress
        broadcastIpAddressLabel.text = broadcastIpAddress
        networkIpAddressLabel.text = networkIpAddress
        numOfHostsLabel.text = numOfHosts
        numOfSubnetsLabel.text = numOfSubnets
        
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
