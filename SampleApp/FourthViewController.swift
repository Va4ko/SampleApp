//
//  FourthViewController.swift
//  SampleApp
//
//  Created by Ivan Ivanov on 1.03.22.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = text
        
        getAndUnzip()
        
        progressBar.setProgress(0.0, animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    func getAndUnzip() {
        ODRManager.shared.requestBundle(tag: "Bundle", progressView: progressBar) {
            DispatchQueue.main.async {
                popAlert(presentingViewController: self, message: "UNZIP Done", onComplete: {
                    
                })
            }
            
        } onFailure: { (error: Error?) in
            if let error = error {
                DispatchQueue.main.async {
                    popAlert(presentingViewController: self, message: error.localizedDescription, onComplete: {
                        
                    })
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension FourthViewController: FourthViewControllerDelegate {
    func sendData(text: String) {
        self.text = text
    }
}
