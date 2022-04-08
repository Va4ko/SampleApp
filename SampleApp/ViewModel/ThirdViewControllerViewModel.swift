//
//  ThirdViewControllerViewModel.swift
//  SampleApp
//
//  Created by Ivan Ivanov on 28.02.22.
//

import Foundation
import Combine

class ThirdViewControllerViewModel {
    
    let url = URL(string: "https://vehiclediary.000webhostapp.com/VehicleModels.json")
    
    enum FailureReason: Error {
        case sessionFailed(error: URLError)
        case decodingFailed
        case badURL
        case other(Error)
    }
    
    func getData() -> AnyPublisher<Vehicles, FailureReason> {
        guard let url = url else {
            return Fail(error: .badURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: Vehicles.self, decoder: JSONDecoder())
            .mapError ({ error in
                switch error {
                    case is Swift.DecodingError:
                        return .decodingFailed
                    case let urlError as URLError:
                        return .sessionFailed(error: urlError)
                    default:
                        return .other(error)
                }
            })
            .eraseToAnyPublisher()
    }
    
    
    
    
    
//        func getData() {
//            let url = URL(string: "https://vehiclediary.000webhostapp.com/VehicleModels.json")
//            let task = URLSession.shared.dataTask(with: url!) { data, _, error in
//                if error != nil {
//                    print("Please check your network connection.")
//                    return
//                }
//    
//                guard let responseData = data else {
//                    print("Please check your network connection. ")
//                    return
//                }
//
//                do {
//                    let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
//                    self.vehicles = jsonData as! [String: Any]
//                    let orderedVehicles = self.vehicles.sorted(by: { $0.0 < $1.0 })
//                    print(orderedVehicles)
//                }catch {
//                    print("Error in parsing json file")
//                }
//
//            }
//            task.resume()
//        }
}
