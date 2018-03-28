//
//  ViewController.swift
//  Auto Layout Calculator
//
//  Created by Minsoo Matthew Shin on 2018-03-27.
//  Copyright © 2018 Minsoo Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var answerWindow: UILabel!
    var currentNum : String = "0"
    var firstArg : String = ""
    var secondArg : String = ""
    var operationArg : String = ""
    var countParam : Int = 0
    var currResult : Int = 0
    var numOperatorPressed : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerWindow.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func numberPressed(_ sender: UIButton) {
        displayNum(sender.tag)
    }
    
    func displayNum(_ tagNum : Int){
        if (currentNum == "0"){
            currentNum = "\(tagNum)"
        } else {
            currentNum += "\(tagNum)"
        }
        if (countParam == 1){
            secondArg = currentNum
        }
        answerWindow.text = currentNum
    
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        if (numOperatorPressed > 1) { // do nothing
            
        } else if (sender.tag == 10) { // divide button pressed
            operationArg = "÷"
            performOperations()
        } else if (sender.tag == 11){ // multiply button pressed
            operationArg = "x"
            performOperations()
        } else if (sender.tag == 12){ // subtract button pressed
            operationArg = "-"
            performOperations()
        } else if (sender.tag == 13){ // addition button pressed
            operationArg = "+"
            performOperations()
        } else if (sender.tag == 14){ // equal button pressed
            calculate()
            countParam = 0
            operationArg = ""
        }
        numOperatorPressed += 1
        
    }
    
    func calculate(){
        if (operationArg == "÷"){
            currResult = Int(firstArg)! / Int(secondArg)!
        } else if (operationArg == "x"){
            currResult = Int(firstArg)! * Int(secondArg)!
        } else if (operationArg == "-"){
            currResult = Int(firstArg)! - Int(secondArg)!
        } else if (operationArg == "+"){
            currResult = Int(firstArg)! + Int(secondArg)!
        }
        answerWindow.text = "\(currResult)"
        numOperatorPressed = 0
    }
    
    func performOperations(){
        if (countParam == 0){
            firstArg = answerWindow.text!
            countParam = 1
            clearCurrNum()
        } else {
            calculate()
            firstArg = "\(currResult)"
            countParam = 0
            clearCurrNum()
        }
    }
    
    func clearCurrNum() {
        currentNum = "0"
    }
    
    func clearCalc(){
        currentNum = "0"
        firstArg = ""
        secondArg = ""
        operationArg = ""
        countParam = 0
        currResult = 0
        answerWindow.text = "0"
    }
    
    
    
    @IBAction func otherButtons(_ sender: UIButton) {
        if (sender.tag == 20){
            clearCalc()
        }
    }
    
    
}

