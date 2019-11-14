//
//  CollectionViewCell.swift
//  News
//
//  Created by michail on 11/14/19.
//  Copyright © 2019 Michail Aksyonav. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
   
    
    @IBOutlet weak var newsImage: UIImageView! {
        didSet {
                   newsImage.layer.cornerRadius = 5
                   newsImage.layer.masksToBounds = true
               }
    }
  
    
    @IBOutlet weak var newsText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func config(imageUrl: String, music: News) {
           
        self.newsText.text = music.title
           
           NetworkManager.fetchImage(imageUrl: imageUrl) { image in
               DispatchQueue.main.async {
                   self.newsImage.image = image
               }
           }
       }
    
    
}
