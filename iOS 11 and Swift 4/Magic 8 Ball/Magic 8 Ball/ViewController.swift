//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Minsoo Matthew Shin on 2018-03-10.
//  Copyright © 2018 Minsoo Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var magicBall1: UIImageView!
    
    var randomBallIndex = 0
    let magicBallImages = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBallImage()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func askButtonPressed(_ sender: Any) {
        updateBallImage()
    }
    
    func updateBallImage(){
        randomBallIndex = Int(arc4random_uniform(5))
        magicBall1.image = UIImage(named: magicBallImages[randomBallIndex])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateBallImage()
    }
    


}

