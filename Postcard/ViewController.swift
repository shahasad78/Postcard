//
//  ViewController.swift
//  Postcard
//
//  Created by Richard Martinez on 11/22/14.
//  Copyright (c) 2014 Shotty Shack Games. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var enterNameTextField: UITextField!
    @IBOutlet weak var enterMessageTextField: UITextField!
    @IBOutlet weak var mailButton: UIButton!
    
   
    @IBAction func sendMailButtonPressed(sender: UIButton) {
        //  Set Message Label Properties
        // --------------------------------------------------------
        messageLabel.text = enterMessageTextField.text
        messageLabel.textColor = UIColor.redColor()
        messageLabel.hidden = false
        // Set Sender Label properties
        // --------------------------------------------------------
        senderLabel.text = "From: \(enterNameTextField.text)"
        senderLabel.textColor = UIColor.blueColor()
        senderLabel.hidden = false
        // Schedule a timer to hide the Message and Sender labels
        // --------------------------------------------------------
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "hideLabels", userInfo: nil, repeats: false)
        
        //  Set Mail Button Properties
        // --------------------------------------------------------
        toggleSendMail()
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "toggleSendMail", userInfo: nil, repeats: false)
        enterNameTextField.text = ""
        enterMessageTextField.text = ""
        enterMessageTextField.resignFirstResponder()
        enterNameTextField.resignFirstResponder()
    }
    
    func hideLabels() {
        messageLabel.hidden = true
        senderLabel.hidden = true
    }
    
    
    func toggleSendMail() {
        mailButton.enabled = !mailButton.enabled
        if (mailButton.enabled) {
            mailButton.setTitle("Send Mail", forState: UIControlState.Normal)
            mailButton.backgroundColor = mailButtonBGColor
        }
        else {
            mailButton.setTitle("Mail Sent", forState: UIControlState.Normal)
            mailButton.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.8)
        }
    }
    
    var mailButtonBGColor: UIColor = UIColor(red: 0.8, green: 0.3, blue: 0.0, alpha: 1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mailButtonBGColor = mailButton.backgroundColor!
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

