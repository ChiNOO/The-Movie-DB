//
//  MovieItem.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 08/08/21.
//

import UIKit
import Kingfisher

class MovieItem{
    
    static func initCell(tableView: UITableView, indexPath: IndexPath, movie: MovieModel) -> UITableViewCell{
        
        
        let cell : MovieItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieItemTableViewCell
        
        cell.titleLabel.text = movie.title
        cell.descriptionTextView.text = movie.overview
        cell.popLabel.text = movie.popularity.description
        cell.topRatedLabel.text = movie.vote_average.description
        cell.releaseDateLabel.text = movie.release_date
        
        if let backImage = URL(string: UrlConnection.imagesPath + movie.backdrop_path){
            cell.backImage.kf.setImage(with: backImage)
        }
        
        if let wallPapper = URL(string: UrlConnection.imagesPath + movie.poster_path){
            cell.wallPapperImage.kf.setImage(with: wallPapper)
        }
        
        return cell
    }
    
}
