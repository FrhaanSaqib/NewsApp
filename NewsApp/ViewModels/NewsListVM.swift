//
//  NewsListVM.swift
//  NewsApp
//
//  Created by Farhan Saqib on 18/07/2023.
//

import Foundation


//Protocols exposing this ViewModel
protocol NewsListViewModelDelegate {
    //Request will either be containing true or false flag
    //indicating API call request success or failure.
    func didReceiveNewsResponse(responseSuccess: Bool)
}

class NewsListVM{
    //MARK: Variables
    var delegate: NewsListViewModelDelegate?
    var newsList: [News] = []
    
    init() {}
    
    func fetchNews(){
        guard let url = URL.init(string: Constants.newsUrl) else{
            debugPrint("Error Converting String \(Constants.newsUrl) to URL")
            return
        }
        
        WebService().fetchNews(url: url) { data in
            return try! JSONDecoder().decode(Articles.self, from: data)
        } completion: { result in
            switch result {
            case .success(let articles):
                if let newsList = articles?.articles{
                    DispatchQueue.main.async{ [weak self] in
                        self?.newsList = newsList
                        self?.delegate?.didReceiveNewsResponse(responseSuccess: true)
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.didReceiveNewsResponse(responseSuccess: false)
                }
                debugPrint(error)
            }
        }

        
    }
    
    
}
