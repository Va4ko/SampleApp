//
//  SecondViewController.swift
//  SampleApp
//
//  Created by Ivan Ivanov on 17.02.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let biometricIDAuth = BiometricIDAuth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults().set("Vachko", forKey: "pass")
        setBackground(named: "login")
        
        authenticate()
        
    }
    
    private func authenticate() {
        biometricIDAuth.canEvaluate { (canEvaluate, _, canEvaluateError) in
            guard canEvaluate else {
                // Face ID/Touch ID may not be available or configured
                return
            }
        }
        
        biometricIDAuth.evaluate { [weak self] (success, error) in
            guard success else {
                // Face ID/Touch ID may not be configured
                
                popAlert(presentingViewController: self!, message: "Sorry! We cant detect your identity!", onComplete: {
                })
                
                return
            }
            
            self!.showVC()
            
        }
    }
    
    func showVC(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarController")
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        sceneDelegate.window?.rootViewController = tabBarController
        
        
    }
    
}

