//
//  EndPointType.swift
//  SampleApp
//
//  Created by Ivan Ivanov on 22.02.22.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}


