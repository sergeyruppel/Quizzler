//
//  ViewController.swift
//  Quizzler
//
//  Created by Sergey Ruppel on 10.08.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - @IBOutlets

    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet private weak var trueButton: UIButton!
    @IBOutlet private weak var falseButton: UIButton!
    
    // MARK: - Properties

    var quizLogic = QuizLogic()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }
    
    // MARK: - @IBActions

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userGotItRight = quizLogic.checkAnswer(sender.currentTitle!)
        sender.backgroundColor = userGotItRight ? .green : .red
        quizLogic.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    // MARK: - Methods

    private func setupUI() {
        setupUIButton(trueButton)
        setupUIButton(falseButton)
    }
    
    @objc private func updateUI() {
        questionNumberLabel.text = "Question Number: \(quizLogic.questionNumber + 1)"
        scoreLabel.text = "Score: \(quizLogic.score)"
        questionLabel.text = quizLogic.getQuestionText()
        progressBar.progress = quizLogic.getProgress()
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
    
    private func setupUIButton(_ button: UIButton) {
        button.layer.cornerRadius = button.frame.width * 0.05
        button.layer.borderWidth = 3.0
        button.layer.borderColor = UIColor.systemIndigo.cgColor
    }
}
