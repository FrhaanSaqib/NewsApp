//
//  News.swift
//  NewsApp
//
//  Created by Farhan Saqib on 16/07/2023.
//

import Foundation

struct Source: Codable {
    var id: String = ""
    var name: String = ""
}

struct News: Codable {
    var source: Source = Source()
    var author: String = ""
    var title: String = ""
    var description: String = ""
    var url: String = ""
    var urlToImage: String = ""
    var publishedAt: String = ""
}
