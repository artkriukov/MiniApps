//
//  ViewController.swift
//  Dicee
//
//  Created by Artem Kriukov on 16.01.2025.
//

import UIKit

class ViewController: UIViewController {

    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "diceeLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let diceeOneImageView: UIImageView = {
        let diceeOneImageView = UIImageView()
        diceeOneImageView.image = UIImage(named: "dice1")
        diceeOneImageView.translatesAutoresizingMaskIntoConstraints = false
        return diceeOneImageView
    }()
    
    let diceeTwoImageView: UIImageView = {
        let diceeOneImageView = UIImageView()
        diceeOneImageView.image = UIImage(named: "dice2")
        diceeOneImageView.translatesAutoresizingMaskIntoConstraints = false
        return diceeOneImageView
    }()
    
    lazy var diceeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Roll", for: .normal)
        button.layer.cornerRadius = 12
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 142/255, green: 41/255, blue: 37/255, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.addTarget(self, action: #selector(didTapRollButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        view.addSubview(logoImageView)
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        view.addSubview(diceeOneImageView)
        diceeOneImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        diceeOneImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        
        view.addSubview(diceeTwoImageView)
        diceeTwoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        diceeTwoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        view.addSubview(diceeButton)
        diceeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        diceeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        diceeButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        diceeButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    @objc func didTapRollButton() {
        let dicees = [
            UIImage(named: "dice1"),
            UIImage(named: "dice2"),
            UIImage(named: "dice3"),
            UIImage(named: "dice4"),
            UIImage(named: "dice5"),
            UIImage(named: "dice6"),
        ].compactMap { $0 }

        diceeOneImageView.image = dicees.randomElement()
        diceeTwoImageView.image = dicees.randomElement()
        
    }

}

