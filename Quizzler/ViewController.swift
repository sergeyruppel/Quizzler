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

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        questionLabel.text = "Four + Two is equal to Six"
    }
    
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
    }
    
    
    
    
    private func setupUI() {
        trueButton.layer.cornerRadius = trueButton.frame.width * 0.05
        trueButton.layer.borderWidth = 4.0
        trueButton.layer.borderColor = UIColor.systemTeal.cgColor
        falseButton.layer.cornerRadius = falseButton.frame.width * 0.05
        falseButton.layer.borderWidth = 4.0
        falseButton.layer.borderColor = UIColor.systemTeal.cgColor
    }
}
