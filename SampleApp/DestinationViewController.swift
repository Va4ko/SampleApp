//
//  DestinationViewController.swift
//  SampleApp
//
//  Created by Ivan Ivanov on 18.02.22.
//

import UIKit

class DestinationViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var text: String = ""
    
    var networkManager: NetworkManager!
    
    //    init(networkManager: NetworkManager) {
    //        super.init(nibName: nil, bundle: nil)
    //        self.networkManager = networkManager
    //    }
    //
    //    required init?(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.networkManager = NetworkManager()
        
        networkManager.getNewMovies(page: 1) { movie, error in
            //            print(movie?.first?.title)
        }
        
        label.text = text
        animate()
        // Do any additional setup after loading the view.
    }
    
    func animate() {
        UIView.animate(withDuration: 1, delay: 0) {
            //            self.label.frame.size.width += 20
            //            self.label.frame.size.height += 20
            //            self.label.frame.origin.y += 40
            self.label.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
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

extension DestinationViewController: TableViewControllerDelegate {
    func sendData(text: String, color: UIColor) {
        self.text = text
        self.view.backgroundColor = color
    }
}
