//
//  SceneDelegate.swift
//  MetricExample
//
//  Created by Daniil Subbotin on 15.09.2020.
//  Copyright © 2020 Redmadrobot. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let vc = UINavigationController(rootViewController: LoginViewController())
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}
