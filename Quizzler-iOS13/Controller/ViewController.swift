//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUI()
        
    }

    @IBAction func checkAnswer(_ sender: UIButton) {
            
        let userAnswer = sender.currentTitle!
       
        let answer = quizBrain.checkAnswer(userAnswer)
        
        if answer == true {
            
            sender.backgroundColor = UIColor.green
        }
        else {
            
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.repeatQuiz()
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        
            

    }
    
   @objc func updateUI () {
        
       let question = self.quizBrain.question()
       self.questionLabel.text = question
       
       self.scoreLabel.text = "Score: \(self.quizBrain.getScore())"
       trueButton.backgroundColor = UIColor.clear
       falseButton.backgroundColor = UIColor.clear
       
       //for progress of the user
       let progress = self.quizBrain.progress()
       progressBar.progress = progress
        
    }
    
}

