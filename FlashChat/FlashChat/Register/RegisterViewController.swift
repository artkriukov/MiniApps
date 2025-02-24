//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Artem Kriukov on 21.02.2025.
//

import UIKit



final class RegisterViewController: UIViewController {

    private let registerView = RegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = registerView
    }
}
