//
//  MovieDetailViewController.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 10/08/21.
//

import UIKit
import Kingfisher
import youtube_ios_player_helper

protocol MovieDetailView: AnyObject {
    
  
    
}

class MovieDetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var wallPaperImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var watchVideoButton: UIButton!
    @IBOutlet weak var popLabel: UILabel!
    @IBOutlet weak var topRatedLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var presenter: MovieDetailPresenter!
    var movie: MovieModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView(){
        if let backImageUrl = URL(string: UrlConnection.imagesPath + movie!.poster_path){
            backImage.kf.setImage(with: backImageUrl)
        }
        
        if let wallPapper = URL(string: UrlConnection.imagesPath +   movie!.backdrop_path){
            wallPaperImage.kf.setImage(with: wallPapper)
        }
        
        titleLabel.text = movie!.title
        descriptionTextView.text = movie!.overview
        popLabel.text = movie!.popularity.description
        topRatedLabel.text = movie!.vote_average.description
        dateLabel.text = movie!.release_date
        watchVideoButton.layer.cornerRadius = watchVideoButton.layer.frame.height / 2
        watchVideoButton.updateLayerProperties()
        
    }
    

    // MARK: - Navigation
    @IBAction func onWatchVideoClick(_ sender: Any) {
        presenter.showVideo(idMovie: movie!.id)
    }
    

}

extension MovieDetailViewController: MovieDetailView{
    
}
