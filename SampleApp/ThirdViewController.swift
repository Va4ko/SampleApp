//
//  ThirdViewController.swift
//  SampleApp
//
//  Created by Ivan Ivanov on 18.02.22.
//

import UIKit
import Combine

protocol FourthViewControllerDelegate: AnyObject {
    func sendData(text: String)
}

class ThirdViewController: UIViewController {
    
    let viewModel = ThirdViewControllerViewModel()
    @IBOutlet weak var firstPicker: UIPickerView!
    @IBOutlet weak var secondPicker: UIPickerView!
    @IBOutlet weak var goBtn: UIButton!
    @IBAction func goBtnTapped(_ sender: Any) {
        if selectedBrand != "--- Select brand ---" && selectedBrand != "" && selectedModel != "--- Select model ---" && selectedModel != "" {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let fourthViewController = mainStoryboard.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
            
            fourthViewController.title = "Vehicle"
            
            sendDelegate = fourthViewController
            sendDelegate?.sendData(text: "Your selected vehicle is \(selectedBrand) \(selectedModel)")
            
            navigationController?.pushViewController(fourthViewController, animated: true)
            
            print("Your selected vehicle is \n\(selectedBrand) \(selectedModel)")
        } else {
            popAlert(presentingViewController: self, message: "Please select brand and model of your vehicle") {
                
            }
        }
    }
    
    var observer: AnyCancellable?
    
    weak var sendDelegate: FourthViewControllerDelegate?
    
    private var vehicles: Vehicles?
    private var vehiclesArray: [String: Any] = [:]
    private var brands: [String] = ["--- Select brand ---"]
    private var models: [String] = []
    private var selectedBrand: String = ""
    private var selectedModel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstPicker.alpha = 0.0
        secondPicker.alpha = 0.0
        goBtn.alpha = 0.0
        
        
        //        observer = viewModel.getData().sink(receiveCompletion: { _ in
        //            //            print("Error")
        //        }, receiveValue: { [weak self] value in
        //            self?.vehicles = value
        //            self?.vehiclesArray = (self?.vehicles!.dictionary)!
        //            self?.brands = (self?.vehiclesArray.keys.sorted(by: { $0 < $1 }))!
        //            self?.brands.insert("--- Select brand ---", at: 0)
        ////            self?.firstPicker.reloadAllComponents()
        //        })
        
        observer = viewModel.getData()
            .sink { completion in
                switch completion {
                    case .finished:
                        print("Finished")
                        
                        DispatchQueue.main.async {
                            self.firstPicker.reloadAllComponents()
                            self.firstPicker.alpha = 1.0
                        }
                    case .failure(let error):
                        print("Error \(error)")
                }
                
            } receiveValue: { [weak self] value in
                self?.vehicles = value
                self?.vehiclesArray = (self?.vehicles!.dictionary)!
                //            self?.brands = (self?.vehiclesArray.keys.sorted(by: { $0 < $1 }))!
                self?.brands.append(contentsOf: (self?.vehiclesArray.keys.sorted(by: { $0 < $1 }))!)
                //            self?.brands.insert("--- Select brand ---", at: 0)
            }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
}

extension ThirdViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            selectedBrand = brands[row]
            if row != 0 {
                //                models = vehiclesArray["\(selectedBrand)"] as! [String]
                models = ["--- Select model ---"]
                models.append(contentsOf: vehiclesArray["\(selectedBrand)"] as! [String])
                //                models.insert("--- Select model ---", at: 0)
                secondPicker.alpha = 1.0
                secondPicker.reloadAllComponents()
                secondPicker.selectRow(0, inComponent: 0, animated: true)
                selectedModel = ""
            } else {
                selectedModel = ""
                models = ["--- Select model ---"]
                secondPicker.alpha = 0.0
                goBtn.alpha = 0.0
            }
            
        } else if pickerView.tag == 2 {
            if row != 0 {
                goBtn.alpha = 1.0
                selectedModel = models[row]
            } else {
                goBtn.alpha = 0.0
                selectedModel = ""
            }
        }
    }
}

extension ThirdViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return self.vehiclesArray.count
        } else if pickerView.tag == 2 {
            return self.models.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return brands[row]
        } else if pickerView.tag == 2 {
            return models[row]
        }
        return ""
    }
}
