//
//  ViewController.swift
//  SearchBar
//
//  Created by Mac on 01/06/23.
//

import UIKit

class ViewController: UIViewController{
    var nameArray : [String] = ["Rohan","Sachin","Shubham","Yuavaraj","Aniket","Ravindra","Akolkar"]
    var filterDataArray : [String] = []
    let serchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var SerachBarTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableViewCellRegistration()
        SerachBarTableView.delegate = self
        SerachBarTableView.dataSource = self
        searchBar.delegate = self
        filterDataArray = nameArray
    
    }
    func searchTableViewCellRegistration(){
        let uiNibName = UINib(nibName: "SearchTableViewCell", bundle: nil)
        self.SerachBarTableView.register(uiNibName, forCellReuseIdentifier: "SearchTableViewCell")
    }
  
    

}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.00
    }
}


extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        filterDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchTableViewCell = self.SerachBarTableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath)as! SearchTableViewCell
        searchTableViewCell.nameLabel.text = filterDataArray[indexPath.row]
        searchTableViewCell.layer.borderColor = UIColor.black.cgColor
        searchTableViewCell.layer.borderWidth = 4
        return searchTableViewCell
    }
    
    }
extension ViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            filterDataArray = nameArray.filter{($0.contains (searchText))}
            SerachBarTableView.reloadData()
            
        }
        else{
            print("Kindly Enter Search Text First")
            filterDataArray = nameArray
            SerachBarTableView.reloadData()
            
        }
        
        
        
        
    }
}

