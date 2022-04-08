//
//  TableViewController.swift
//  SampleApp
//
//  Created by Ivan Ivanov on 18.02.22.
//

import UIKit

protocol TableViewControllerDelegate: AnyObject {
    func sendData(text: String, color: UIColor)
}

class TableViewController: UIViewController {
    
    let array = ["Ivan", "ChavdarovChavdarovChavdarovChavdarov", "IvanovIvanovIvanovIvanovIvanovIvanovIvanovIvanovIvanovIvanovIvanovIvanovIvanovIvanovIvanovIvanovIvanovIvanov"]
    
    weak var sendDelegate: TableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
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

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = array[indexPath.row]
        content.secondaryText = "test"
        cell.contentConfiguration = content
        
        
        return cell
    }
    
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationViewController = mainStoryboard.instantiateViewController(withIdentifier: "DestinationViewController") as! DestinationViewController
        
        sendDelegate = destinationViewController
        sendDelegate?.sendData(text: array[indexPath.row], color: .cyan)
        
        navigationController?.pushViewController(destinationViewController, animated: true)
        
    }
}
