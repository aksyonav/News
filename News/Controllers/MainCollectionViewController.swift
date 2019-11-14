//
//  MainCollectionViewController.swift
//  News
//
//  Created by michail on 11/14/19.
//  Copyright © 2019 Michail Aksyonav. All rights reserved.
//

import UIKit



class MainCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    var newsAPI: NewsAPI?
    let networkManager = NetworkManager()
    let url = "https://newsapi.org/v2/top-headlines?country=ru&category=business&apiKey=35f0df98c7ef4076968ea31964c95c34"
    
    
    
    
     @IBOutlet weak var collectionVC: UICollectionView!
    
   
    
    // MARK: - UIMethods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
      fecthData()

    }

    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsAPI?.articles?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    
        guard let articles = newsAPI?.articles?[indexPath.item] else { return cell }
        guard let imageUrl = articles.urlToImage else { return cell}
        
        cell.config(imageUrl: imageUrl, music: articles)
     
        
        return cell
    }

   /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detailShow" else {return}
        
        guard let indexPath = collectionVC.indexPathsForSelectedItems else { return }
       guard let articles = newsAPI?.articles?[indexPath.item] else { return }
        guard let destination = segue.destination as? DetailController else { return }
        destination.news = articles
        destination.detailTitleText = articles
    }
   */


    func fecthData() {
        
        networkManager.fetchRequest(url: url) { (result) in
            switch result {
            case .success(let newsAPI):
                self.newsAPI = newsAPI
                DispatchQueue.main.async {
                      self.collectionVC.reloadData()
                }
              
            case .failure(let error):
                print("Fecth error: \(error)")
            }
            
        }

        
        
    }

}


