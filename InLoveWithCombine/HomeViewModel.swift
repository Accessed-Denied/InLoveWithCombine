//
//  HomeViewModel.swift
//  InLoveWithCombine
//
//  Created by Rohit Saini on 27/03/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import Foundation
import Combine
class HomeViewModel {
    var delegate: HomeViewModelDelegate?
    private var commentSubscriber: AnyCancellable?
    
    func fetchComments(){
        commentSubscriber = APIMaanager().commentPublisher.sink(receiveCompletion: { (error) in
            self.delegate?.didReceiveCommentsResponse(response: nil,error: "\(error)")
        }, receiveValue: { (allComments)  in
            self.delegate?.didReceiveCommentsResponse(response: allComments, error: nil)
        })
    }
}
