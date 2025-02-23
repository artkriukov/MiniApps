//
//  ViewController.swift
//  EggTimer
//
//  Created by Artem Kriukov on 21.01.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // MARK: - UI
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 0
        element.distribution = .fillEqually
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.text = "How do you like your eggs?"
        element.textAlignment = .center
        element.font = .systemFont(ofSize: 25)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var eggsStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 20
        element.distribution = .fillEqually
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let softEgg = UIImageView(name: "soft_egg")
    private let softButton = UIButton(text: "Soft")
    
    private let mediumEgg = UIImageView(name: "medium_egg")
    private let mediumButton = UIButton(text: "Medium")
    
    private let hardEgg = UIImageView(name: "hard_egg")
    private let hardButton = UIButton(text: "Hard")
    
    private lazy var timerView: UIView = {
        let element = UIView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var progressView: UIProgressView = {
        let element = UIProgressView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Private Properties
    
    private let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
    private var totalTime = 0
    private var secondPassed = 0
    private var timer = Timer()
    private var player: AVAudioPlayer? = nil
    private let nameSoundTimer = "alarm_sound"
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setupConstraints()
    }
    // MARK: - Buisness Logic
    private func playSound(_ soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }
        
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    
    @objc func eggsButtonsTapped(_ sender: UIButton) {
        timer.invalidate()
        progressView.setProgress(0, animated: true)
        secondPassed = 0
        
        let hardness = sender.titleLabel?.text ?? "error"
        
        titleLabel.text = "Cooking \(hardness) Egg"
        
        totalTime = eggTimes[hardness] ?? 0
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            let procentageProgress = Float(secondPassed) / Float(totalTime)
            print(procentageProgress)
            progressView.setProgress(procentageProgress, animated: true)
        } else {
            playSound(nameSoundTimer)
            timer.invalidate()
            progressView.setProgress(1, animated: true)
            titleLabel.text = "Done!"
        }
    }
}

// MARK: - Extension
extension ViewController {
    private func setViews () {
        view.backgroundColor = .systemCyan
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(eggsStackView)
        mainStackView.addArrangedSubview(timerView)
        
        eggsStackView.addArrangedSubview(softEgg)
        eggsStackView.addArrangedSubview(mediumEgg)
        eggsStackView.addArrangedSubview(hardEgg)
        
        softEgg.addSubview(softButton)
        mediumEgg.addSubview(mediumButton)
        hardEgg.addSubview(hardButton)
        
        softButton.addTarget(self, action: #selector(eggsButtonsTapped), for: .touchUpInside)
        mediumButton.addTarget(self, action: #selector(eggsButtonsTapped), for: .touchUpInside)
        hardButton.addTarget(self, action: #selector(eggsButtonsTapped), for: .touchUpInside)
        
        timerView.addSubview(progressView)
    }
    
    private func setupConstraints () {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            
            progressView.centerYAnchor.constraint(equalTo: timerView.centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: timerView.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: timerView.trailingAnchor),
            
            softButton.topAnchor.constraint(equalTo: softEgg.topAnchor),
            softButton.bottomAnchor.constraint(equalTo: softEgg.bottomAnchor),
            softButton.leadingAnchor.constraint(equalTo: softEgg.leadingAnchor),
            softButton.trailingAnchor.constraint(equalTo: softEgg.trailingAnchor),
            
            mediumButton.topAnchor.constraint(equalTo: mediumEgg.topAnchor),
            mediumButton.bottomAnchor.constraint(equalTo: mediumEgg.bottomAnchor),
            mediumButton.leadingAnchor.constraint(equalTo: mediumEgg.leadingAnchor),
            mediumButton.trailingAnchor.constraint(equalTo: mediumEgg.trailingAnchor),
            
            hardButton.topAnchor.constraint(equalTo: hardEgg.topAnchor),
            hardButton.bottomAnchor.constraint(equalTo: hardEgg.bottomAnchor),
            hardButton.leadingAnchor.constraint(equalTo: hardEgg.leadingAnchor),
            hardButton.trailingAnchor.constraint(equalTo: hardEgg.trailingAnchor),
        ])
    }
}

extension UIButton {
    convenience init(text: String) {
        self.init(type: .system)
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 18, weight: .black)
        self.tintColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIImageView {
    convenience init(name: String){
        self.init()
        self.image = UIImage(named: name)
        self.contentMode = .scaleAspectFit
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

