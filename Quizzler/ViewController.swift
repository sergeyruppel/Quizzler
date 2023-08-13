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
    
    let quiz = ["Four + Two is equal to Six.",
                "Five - Three is greater than One.",
                "Three + Eight is less than Ten."]
    var questionNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        questionNumber += 1
        updateUI()
    }
    
    private func setupUI() {
        trueButton.layer.cornerRadius = trueButton.frame.width * 0.05
        trueButton.layer.borderWidth = 3.0
        trueButton.layer.borderColor = UIColor.systemIndigo.cgColor
        falseButton.layer.cornerRadius = falseButton.frame.width * 0.05
        falseButton.layer.borderWidth = 3.0
        falseButton.layer.borderColor = UIColor.systemIndigo.cgColor
    }
    
    private func updateUI() {
        questionLabel.text = quiz[questionNumber]
    }
}
