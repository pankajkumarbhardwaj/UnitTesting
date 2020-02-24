//
//  MockSession.swift
//  DogYears
//
//  Created by zmobile on 16/01/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation

class MockSession:URLSessionProtocol {
    func dataTask(with request: URLRequest, complitionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        complitionHandler(Data(), nil, nil)
        return MockDataTask()
    }
    
    
}
