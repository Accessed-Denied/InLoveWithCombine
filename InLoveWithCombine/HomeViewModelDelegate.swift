//
//  CommentsDelegate.swift
//  InLoveWithCombine
//
//  Created by Rohit Saini on 27/03/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate{
    func didReceiveCommentsResponse(response: [Comment]?,error: String?)
}
