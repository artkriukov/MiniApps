//
//  ViewController.swift
//  Quizzler
//
//  Created by Artem Kriukov on 05.02.2025.
//

import UIKit

class ViewController: UIViewController {

    let mainStackView = UIStackView(axis: .vertical)
    let questionLabel = UILabel(text: "Question")
    let trueButton = UIButton(text: "True")
    let falseButton = UIButton(text: "False")
    let progressBar = UIProgressView(progress: 0.5)
    let backgroundImage = UIImageView(image: Constants.backroundImage)
    
    private var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        
        trueButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        falseButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        
        setViews()
        setupConstraints()
        
        updateUI()
    }
    
    @objc func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let currentQuestionNumber = quizBrain.question[quizBrain.questionNumber]
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.questionNumber += 1
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        if quizBrain.questionNumber < quizBrain.question.count {
            questionLabel.text = quizBrain.getQuestionText()
            progressBar.progress = quizBrain.getProgress()
            clearBackroundButton()
        } else {
            quizBrain.questionNumber = 0
            questionLabel.text = quizBrain.getQuestionText()
            progressBar.progress = quizBrain.getProgress()
            clearBackroundButton()
        }
    }

    func clearBackroundButton() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
}

