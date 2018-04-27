//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var playerScore : Int = 0
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if (sender.tag == 1) {
            pickedAnswer = true
        } else if (sender.tag == 2){
            pickedAnswer = false
        }
        checkAnswer()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(playerScore)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
      
    }
    

    func nextQuestion() {
        if (questionNumber <= 12){
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "Great job! You finished the Quiz!", message: "Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            let quitAction = UIAlertAction(title: "Cancel", style: .default, handler: { (UIAlertAction) in
                self.quit()
            })
        
            alert.addAction(restartAction)
            alert.addAction(quitAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if (correctAnswer == pickedAnswer){
            
            ProgressHUD.showSuccess("Correct")
            playerScore += 1
            
        }
        else {
            ProgressHUD.showError("Incorrect")
            
        }
        updateUI()
        questionNumber += 1
        nextQuestion()
        
    }
    
    
    func startOver() {
        questionNumber = 0
        playerScore = 0
        nextQuestion()
       
    }
    
    func quit(){
        questionLabel.text = "Your score is: \(playerScore)"
    }
    

    
}
