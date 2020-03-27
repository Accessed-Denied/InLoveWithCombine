//
//  APIManager.swift
//  InLoveWithCombine
//
//  Created by Rohit Saini on 26/03/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import Foundation
import Combine

class APIMaanager{
    private let endPoint = "https://jsonplaceholder.typicode.com/comments"
    
    var commentPublisher: AnyPublisher<[Comment],Error>{
        let url = URL(string: endPoint)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: [Comment].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
    }
}
