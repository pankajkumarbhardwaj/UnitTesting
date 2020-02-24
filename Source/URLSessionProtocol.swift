//
//  URLSessionProtocol.swift
//  DogYears
//
//  Created by zmobile on 16/01/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation
import UIKit

protocol URLSessionProtocol {
    
    func dataTask(with request:URLRequest, complitionHandler: @escaping (Data?,URLResponse?,Error?) -> Void) -> URLSessionDataTaskProtocol
}

extension URLSession:URLSessionProtocol {
    func dataTask(with withRequest: URLRequest, complitionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        let task = dataTask(with: withRequest, completionHandler: complitionHandler) as  URLSessionDataTask
        return task as URLSessionDataTaskProtocol
    }
}


extension URLSessionDataTask:URLSessionDataTaskProtocol {
    
}
