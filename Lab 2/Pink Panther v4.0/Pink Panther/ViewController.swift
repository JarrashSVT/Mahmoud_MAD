//
//  ViewController.swift
//  Pink Panther
//
//  Created by Mahmoud Aljarrash on 9/17/17.
//  Copyright © 2017 Mahmoud Aljarrash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var cartoorImage: UIImageView!
    
    @IBOutlet weak var characterNameLabel: UILabel!
    
    @IBOutlet weak var characterSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var capitalizationSwitch: UISwitch!
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    
    
    
    @IBAction func characterChanged(_ sender: UISegmentedControl)
    {
        updateImage()
        updateCaps()
    }
    
    @IBAction func updateCapitalizationStatus(_ sender: UISwitch)
    {
        updateCaps()
    }
    
   
    @IBAction func changeFontSize(_ sender: UISlider)
    {
        let fontSize = sender.value
        fontSizeLabel.text = String(format: "%.0f", fontSize)
        
        let fontSizeCGFloat = CGFloat(fontSize)
        characterNameLabel.font = UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
    
    
    func updateImage()
    {
        if characterSegmentedControl.selectedSegmentIndex == 0
        {
            characterNameLabel.text = "Pink Panther"
            characterNameLabel.textColor = UIColor(red: 0.9098, green: 0.4431, blue: 0.6824, alpha: 1.0)
            cartoorImage.image = UIImage(named: "Pink-Panther")
        }
        else
        {
            characterNameLabel.text = "The White Guy"
            characterNameLabel.textColor = UIColor(red: 0.3569, green: 0.498, blue: 0.9176, alpha: 1.0) /* #5b7fea */
            cartoorImage.image = UIImage(named: "Bignose")
            
        }

    }
    
    func updateCaps()
    {
        if capitalizationSwitch.isOn
        {
            characterNameLabel.text = characterNameLabel.text?.uppercased()
        }
        else
        {
            characterNameLabel.text = characterNameLabel.text?.lowercased()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

