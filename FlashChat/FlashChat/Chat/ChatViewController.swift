//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Artem Kriukov on 21.02.2025.
//

import UIKit

class ChatViewController: UIViewController {

    private let chatView = ChatView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = chatView
        title = K.appName
    }
    

}


