//
//  MovieItemTableViewCell.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 08/08/21.
//

import UIKit

class MovieItemTableViewCell: UITableViewCell {

    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var wallPapperImage: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var popLabel: UILabel!
    @IBOutlet weak var topRatedLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
