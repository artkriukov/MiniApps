//
//  WelcomeViewController.swift
//  FlashChat
//
//  Created by Artem Kriukov on 21.02.2025.
//

import UIKit

final class WelcomeViewController: UIViewController {

    // MARK: - Private Properties
    
    private let welcomeView = WelcomeView()
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = welcomeView
    }


}

