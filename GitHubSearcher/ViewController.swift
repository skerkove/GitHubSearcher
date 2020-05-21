//
//  ViewController.swift
//  GitHubSearcher
//
//  Created by Scott Kerkove on 5/21/20.
//  Copyright © 2020 Scott Kerkove. All rights reserved.
//

import UIKit
import SDWebImage

protocol ChangeEndpointDelegate {
    func searchUpdate(urlString: String)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var vM = ViewModel()
    @IBOutlet weak var userTableView: UITableView!
    var changeEndpointDelegate : ChangeEndpointDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GitHub User Search"
        let searchBar = UISearchController(searchResultsController: nil)
        searchBar.searchResultsUpdater = self
        searchBar.searchBar.placeholder = "Type here to search..."
        navigationItem.searchController = searchBar
        
        userTableView.delegate = self
        userTableView.dataSource = self
        
        
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //change with array result
        return vM.userSearchArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        let model = vM.userSearchArray[indexPath.row]
        cell.textLabel?.text = model.login
        cell.imageView?.sd_setImage(with: URL(string: model.avatar_url), placeholderImage: UIImage(named: "placeholder") )
         
        return cell
        
    }

}


extension ViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text?.lowercased() else { return }
           print(text)
//
        self.vM.searchFor(username: text) { (_) in
            DispatchQueue.main.async {
                self.userTableView.reloadData()
            }
        }
    }
}

