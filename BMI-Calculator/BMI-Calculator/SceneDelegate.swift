//
//  SceneDelegate.swift
//  BMI-Calculator
//
//  Created by Artem Kriukov on 22.01.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windiwScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windiwScene)
        window?.rootViewController = CalculateViewController()
        window?.makeKeyAndVisible()
    }

   
}

