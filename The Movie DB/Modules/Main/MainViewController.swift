//
//  MainViewController.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 05/08/21.
//

import UIKit
import RealmSwift

protocol MainView: AnyObject {
    func loadMovies(result: List<MovieModel>)
    func error(description: String)
}

class MainViewController: UIViewController, ReusableTableViewDelegate, UITextFieldDelegate, UISearchBarDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    

    var presenter: MainPresenter!
    var reusableTableView: ReusableTableViewDataSource?
    var movies: List<MovieModel> = List<MovieModel>()
    var type: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
      
    }
    
    func updateView(){
        searchBar.searchTextField.delegate = self
        searchBar.delegate = self
        reusableTableView = ReusableTableViewDataSource(tableView: self.tableView, delegate: self, nibName: ItemName.MovieItem, cellName: "cell")
        tableView.dataSource = reusableTableView
        tableView.delegate = reusableTableView
        tableView.reloadData()
        reusableTableView?.update(items: movies)
        self.presenter.getMovies(type: type)
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
       /* if let searchText = textField.text, !searchText.isEmpty {
            
            let toSearch = searchText.lowercased()
            
            self.byListListFiltered = self.byListList.filter({
                
                ($0.nameCommerce.lowercased().contains(toSearch))
            })
            reusableByListTableView?.update(items: byListListFiltered)
        } else {
            self.byListListFiltered.removeAll()
            reusableByListTableView?.update(items: byListList)
        }*/
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.presenter.getMovies(type: type)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty{
            self.presenter.getMoviesSearch(search: textField.text!)
        }
        
        return true
    }
    
    
    
    // MARK: - Navigation
    func onMovieClick(movie: MovieModel) {
        presenter.showDetail(movie: movie)
    }
}

extension MainViewController: MainView{
    func loadMovies(result: List<MovieModel>) {
        reusableTableView?.update(items: result)
    }
    
    func error(description: String) {
        print(description)
    }
    
    
}
