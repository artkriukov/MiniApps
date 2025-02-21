//
//  WelcomeViewController.swift
//  FlashChat
//
//  Created by Artem Kriukov on 21.02.2025.
//

import UIKit

protocol WelcomeViewDelegate: AnyObject {
    func buttonsTapped()
}

final class WelcomeViewController: UIViewController, WelcomeViewDelegate {
    // MARK: - Private Properties
    
    private let welcomeView = WelcomeView()
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = welcomeView
        welcomeView.delegate = self
    }

    internal func buttonsTapped() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}

