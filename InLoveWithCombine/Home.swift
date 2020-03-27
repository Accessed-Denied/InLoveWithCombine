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
    private var homeViewModel = HomeViewModel()
    
    //Reloading the comments data
    private var comments = [Comment](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate = self
        homeViewModel.fetchComments()
        // Do any additional setup after loading the view.
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

extension Home: HomeViewModelDelegate{
    func didReceiveCommentsResponse(response: [Comment]?, error: String?) {
        if response != nil{
            comments = response!
        }
        else{
           print(error!)
        }
    }
    
}

