//
//  Home.swift
//  InLoveWithCombine
//
//  Created by Rohit Saini on 26/03/20.
//  Copyright © 2020 Accessed Denied. All rights reserved.
//

import UIKit
import Combine

class Home: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var commentSubscriber: AnyCancellable?
    private var comments = [Comment](){
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchComments()
        // Do any additional setup after loading the view.
    }
    
    private func fetchComments(){
        commentSubscriber = APIMaanager().commentPublisher.sink(receiveCompletion: { _ in
        }, receiveValue: {[weak self] (allComments)  in
            self?.comments = allComments
        })
    }

}

extension Home: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = "\(comments[indexPath.row].name) added comment: \(comments[indexPath.row].body)"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
