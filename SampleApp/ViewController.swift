//
//  ViewController.swift
//  SampleApp
//
//  Created by Ivan Ivanov on 16.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func firstBtnTapped(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tableViewController = mainStoryboard.instantiateViewController(withIdentifier: "TableViewController")
        navigationController?.pushViewController(tableViewController, animated: true)
    }
    
    @IBAction func secondBtnTapped(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let thirdViewController = mainStoryboard.instantiateViewController(withIdentifier: "ThirdViewController")
        thirdViewController.view.backgroundColor = .darkGray
        thirdViewController.title = "Third"
        navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        guard let pass = UserDefaults().string(forKey: "pass") else { return }
        
        label.text = "You are successfully \nlogged in! \nYour pass is: \(pass)"
        
    }
    
}

