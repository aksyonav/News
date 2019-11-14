//
//  NewsAPI.swift
//  News
//
//  Created by michail on 11/14/19.
//  Copyright © 2019 Michail Aksyonav. All rights reserved.
//

import UIKit

struct NewsAPI: Codable {
    
    let articles: [News]?
}

struct News: Codable {
    
    let name: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    
}
