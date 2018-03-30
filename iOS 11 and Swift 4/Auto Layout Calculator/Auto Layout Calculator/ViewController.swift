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
    var numCumulator : String = ""
    var resultCumulator : String = ""
    var performingCalc : Bool = false
    var previousNum : String = ""
    
    
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
            numOnScreen.text = String(sender.tag)
        } else {
            numOnScreen.text = numOnScreen.text! + String(sender.tag)
        }
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        if (isFirstOperation()) {
            previousNum = numOnScreen.text!
            
            return
        }
        else if (sender.tag == 10 && performingCalc == true){
            resultCumulator = String(Int(previousNum)! / Int(numOnScreen.text!)!)
            numOnScreen.text = resultCumulator
            previousNum = resultCumulator
            return
        }

        
        
    }
    
    func isFirstOperation() -> Bool {
        if (performingCalc == true) {
            return true
        } else {
            performingCalc = true
            return false
        }
    }
   
    
    
    
    @IBAction func otherButtons(_ sender: UIButton) {
        
    }
    
    
}

