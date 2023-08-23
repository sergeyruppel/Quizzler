//
//  ViewController.swift
//  Quizzler
//
//  Created by Sergey Ruppel on 10.08.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet private weak var trueButton: UIButton!
    @IBOutlet private weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizLogic = QuizLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
                
        let actualAnswer = quiz[questionNumber].answer
        
        if let userAnswer = sender.currentTitle {
            quizLogic.checkAnswer(userAnswer)
            
        }

        if sender.currentTitle == actualAnswer {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        if questionNumber < (quiz.count - 1) {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    private func setupUI() {
        trueButton.layer.cornerRadius = trueButton.frame.width * 0.05
        trueButton.layer.borderWidth = 3.0
        trueButton.layer.borderColor = UIColor.systemIndigo.cgColor
        falseButton.layer.cornerRadius = falseButton.frame.width * 0.05
        falseButton.layer.borderWidth = 3.0
        falseButton.layer.borderColor = UIColor.systemIndigo.cgColor
    }
    
    @objc private func updateUI() {
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
}
