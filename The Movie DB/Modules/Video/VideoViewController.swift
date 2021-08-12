//
//  VideoViewController.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 11/08/21.
//

import UIKit
import WebKit

protocol VideoView: AnyObject {
    
    func loadVideo(key: String)
    
}

class VideoViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var id: Int?
    var presenter: VideoPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.getVideo(idMovie: id!)
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension VideoViewController: VideoView{
    
    func loadVideo(key: String) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/" + key) else {
            return
        }
        
        webView.load(URLRequest(url: youtubeURL))
    }
    

    
    
}
