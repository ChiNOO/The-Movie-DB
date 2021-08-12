//
//  ReusableTableViewDataSource.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 08/08/21.
//

import UIKit
import ViewAnimator
import RealmSwift

protocol ReusableTableViewDelegate {
   func onMovieClick(movie: MovieModel)
}

class ReusableTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    
    
    var items: List<MovieModel> = List<MovieModel>()
    var tableView: UITableView?
    var delegate: ReusableTableViewDelegate?
    var nibName: String?
    private let animations = AnimationType.from(direction: .bottom, offset: 30.0)

    
    init(tableView: UITableView, delegate: ReusableTableViewDelegate, nibName: String, cellName: String) {
        super.init()
        self.tableView = tableView
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.delegate = delegate
        self.nibName = nibName
        
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellName)
        tableView.backgroundColor = UIColor.clear
    }
    
    
    func update(items: List<MovieModel>){
        self.items.removeAll()
        self.items = items
        self.tableView?.reloadData()
        self.tableView!.performBatchUpdates({
            UIView.animate(views: self.tableView!.visibleCells,
                           animations: [animations], completion: {
            })
        }, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        switch self.nibName {
        case ItemName.MovieItem:
            cell = MovieItem.initCell(tableView: tableView, indexPath: indexPath, movie: items[indexPath.row] )
        default:
            cell = UITableViewCell()
        }
        
        return cell!
    }
    
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch self.nibName {
        
        case ItemName.MovieItem:
            let item = items[indexPath.row]
            self.delegate!.onMovieClick(movie: item)
        default:
            return
        }
    }
    
}
