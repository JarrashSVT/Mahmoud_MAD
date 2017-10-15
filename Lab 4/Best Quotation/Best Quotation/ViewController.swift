//
//  ViewController.swift
//  Best Quotation
//
//  Created by Mahmoud Aljarrash on 10/12/17.
//  Copyright © 2017 Mahmoud Aljarrash. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    var theQuotation = Quotes()
    
    let filename = "quotes.plist"
    
    @IBOutlet weak var quotationtTxtView: UITextView!
    @IBOutlet weak var byLabel: UILabel!
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue)
    {
        quotationtTxtView.text = theQuotation.qoutation
        byLabel.text = theQuotation.by
    }
    
    func docFilePath(_ filename: String) -> String?{
        //locate the documents directory
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString //document directory
        //creates the full path to our data file
        print(dir.appendingPathComponent(filename))
        return dir.appendingPathComponent(filename)
    }

    override func viewDidLoad()
    
    {
        let filePath = docFilePath(filename)
        
       
        if FileManager.default.fileExists(atPath: filePath!)
        {
            
            let path = filePath
            let dataDictionary = NSDictionary(contentsOfFile: path!) as! [String:String]

            if dataDictionary.keys.contains("quotation")
            {
                theQuotation.qoutation = dataDictionary["quotation"]
                quotationtTxtView.text = theQuotation.qoutation
            }

            if dataDictionary.keys.contains("by")
            {
                theQuotation.by = dataDictionary["by"]
                byLabel.text = theQuotation.by
            }
        }
        
        //application instance
        let app = UIApplication.shared
        
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
        func applicationWillResignActive(_ notification: Notification)
        {
        let filePath = docFilePath(filename)
        let data = NSMutableDictionary()
        //adds
        if theQuotation.qoutation != nil
        {
            data.setValue(theQuotation.qoutation, forKey: "quotation")
            
        }
        if theQuotation.by != nil
        {
            data.setValue(theQuotation.by, forKey: "by")
        }
        //write the contents of the array to our plist file
        data.write(toFile: filePath!, atomically: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

