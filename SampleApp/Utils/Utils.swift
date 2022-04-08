//
//  Utils.swift
//  SampleApp
//
//  Created by Ivan Ivanov on 1.03.22.
//

import Foundation
import UIKit

func popAlert(presentingViewController: UIViewController, message: String, onComplete: @escaping () -> Void) {
    let alert = UIAlertController(title: "Attention", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        alert.dismiss(animated: true, completion: {
            onComplete()
        })
    }))
    presentingViewController.present(alert, animated: true, completion: {})
}
