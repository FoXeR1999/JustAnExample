//
//  NetworkController.swift
//  Tap_Jack
//
//  Created by Justin Herzog on 1/17/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation

struct NetworkController {
    
    static func performNetworkRequest(for url: URL, completion: @escaping (Data?, Error?) -> Void) {
        
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }
        dataTask.resume()
    }
}
