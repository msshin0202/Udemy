//
//  ViewController.swift
//  Auto Layout Calculator
//
//  Created by Minsoo Matthew Shin on 2018-03-27.
//  Copyright © 2018 Minsoo Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numOnScreen: UILabel!
    var performingCalc : Bool = false
    var currNum : String = ""
    var currOperation : String = ""
    var input : String = ""
    var output : String = ""
    var finishNumInput : Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numOnScreen.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func numberPressed(_ sender: UIButton) {
        
        if (numOnScreen.text == "0"){
            currNum = String(sender.tag)
            numOnScreen.text = currNum
        } else if (currOperation == ""){
            currNum = currNum + String(sender.tag)
            numOnScreen.text = currNum
        } else if (performingCalc){
            currNum = currNum + String(sender.tag)
            numOnScreen.text = currNum
            print("input before perform: \(input)")
            print("output before perform: \(output)")
            performOperation()
            input = output
        }
        
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        switch sender.tag {
        case 10:
            currOperation = "/"
        case 11:
            currOperation = "x"
        case 12:
            currOperation = "-"
        case 13:
            currOperation = "+"
        case 14:
            currOperation = "="
            performOperation()
            return
        default:
             return
        }
        if (!performingCalc){
            performingCalc = true
            input = numOnScreen.text!
            currNum = ""
        } else {
            numOnScreen.text = output
            input = output
            currNum = ""
            if (performingCalc){
                performOperation()
            }
        }
    }
    
    func performOperation() {
        if (currOperation == "/"){
            output = String(Double(input)! / Double(numOnScreen.text!)!)
            print("input in perform operation: \(input)")
            print("output in perform operation: \(output)")
        }
        if (currOperation == "x"){
            output = String(Double(input)! * Double(numOnScreen.text!)!)
        }
        if (currOperation == "-"){
            output = String(Double(input)! - Double(numOnScreen.text!)!)
        }
        if (currOperation == "+"){
            output = String(Double(input)! + Double(numOnScreen.text!)!)
        }
        if (currOperation == "="){
            numOnScreen.text = output
            input = output
        }
    }
    
    @IBAction func otherButtons(_ sender: UIButton) {
        if (sender.tag == 20){
            numOnScreen.text = "0"
            currNum = ""
            currOperation = ""
            input = ""
            output = ""
            performingCalc = false
        }
        
    }
    
}

