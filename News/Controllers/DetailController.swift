//
//  DetailController.swift
//  News
//
//  Created by michail on 11/14/19.
//  Copyright © 2019 Michail Aksyonav. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    
    var news: News!
    
    
    @IBOutlet weak var detailTitleText: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailDescriptionText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //installValue()
        
       
        }
    
    /*func installValue(){
        
       
        if let detailText = news.title {
            detailTitleText.text = detailText
        }
          // guard detailDescriptionText.text == news.description else { return }
         NetworkManager.fetchImage(imageUrl: news.urlToImage!) { [weak self] (image) in
                    DispatchQueue.main.async {
                        self?.detailImage.image = image
            }
        }
    }
 */
    
  
    
    @IBAction func readMore(_ sender: Any) {
        
        if let url = URL(string: news.url!) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
    
    
