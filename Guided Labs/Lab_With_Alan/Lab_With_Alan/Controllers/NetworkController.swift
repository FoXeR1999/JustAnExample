//
//  NetworkController.swift
//  Lab_With_Alan
//
//  Created by Justin Herzog on 1/14/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation

class NetworkController {
    static func performNetworkRequest(for url: URL, completion: ((Data?, Error?) -> Void)? = nil) {
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let completion = completion {
                completion(data, error)
            }
        }
        dataTask.resume()
    }
}


