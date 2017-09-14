//
//  ViewController.swift
//  cuteBabies-v4.0
//
//  Created by Mahmoud Aljarrash on 9/12/17.
//  Copyright © 2017 Mahmoud Aljarrash. All rights reserved.
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pink_heart_32_32")!)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    var imageIndex = 0
    let images = [UIImage(named: "IMG_0013"),
                  UIImage(named: "IMG_0014"),
                  UIImage(named: "IMG_0017"),
                  UIImage(named: "IMG_0023"),
                  UIImage(named: "IMG_0024")]
    
    let captions = ["IMG_0013",
                    "IMG_0014",
                    "IMG_0017",
                    "IMG_0023",
                    "IMG_0024"]
    

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var theImage: UIImageView!
    
    @IBAction func btnClicked(_ sender: UIButton)
    {
        
        if sender.tag == 1
        {
            if imageIndex <= (images.count - 2)
            {
                print("less")
                imageIndex += 1
            }
            else
            {
                print("greater or eq")
                imageIndex = 0
            }
            print(imageIndex)
            theImage.image = images[imageIndex]
            captionLabel.text = "Caption: \(captions[imageIndex])"
            
        }
        else
        {
            if imageIndex == 0
            {
                print("less")
                imageIndex = (images.count - 1)
                
            }
            else
            {
                print("greater or eq")
                imageIndex -= 1
                
            }
            print(imageIndex)
            theImage.image = images[imageIndex]
            captionLabel.text = "Caption: \(captions[imageIndex])"
        }
    }
}


//<a href="https://icons8.com/icon/8604/Romper-Filled">Romper filled icon credits</a>
