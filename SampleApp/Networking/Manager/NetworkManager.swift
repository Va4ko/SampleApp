//
//  NetworkManager.swift
//  SampleApp
//
//  Created by Ivan Ivanov on 22.02.22.
//

import Foundation

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}

struct NetworkManager {
    static let environment : NetworkEnvironment = .production
    static let MovieAPIKey = "a05f5ccb5d5066f7454e7feee8bf1f6d"
//    eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMDVmNWNjYjVkNTA2NmY3NDU0ZTdmZWVlOGJmMWY2ZCIsInN1YiI6IjYyMTRjZGQ1MWEzMjQ4MDA2YWJjNDMxYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VLL4un37F35NXhkyKDsz4EjDBhW7awV--6mPP0ejDqU
    let router = Router<MovieApi>()
    
    func getNewMovies(page: Int, completion: @escaping (_ movie: [Movie]?,_ error: String?)->()){
        router.request(.newMovies(page: page)) { data, response, error in
            
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(MovieApiResponse.self, from: responseData)
                        completion(apiResponse.movies,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
