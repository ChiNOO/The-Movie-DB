//
//  UIView+extension.swift
//  The Movie DB
//
//  Created by Christian Vargas Saavedra on 08/08/21.
//

import UIKit
import Foundation


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
   
}

extension UIButton{
    
    func updateLayerProperties() {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5.0
        self.layer.masksToBounds = false
    }
    
}
