//
//  LatestNewViewModel.swift
//  Assignment 19
//
//  Created by Giorgi Gakhokidze on 30.10.24.
//

import Foundation
import UIKit


class LatestNewViewModel {
    
    var news = [Article]()
    
    var currentPage = 1
    private var itemsPerPage = 10
    private var isFetching = false
    
    private let url = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=0351945b8f3e4afea8301d67a67eb947"
    
    var numberOfNews: Int {
        news.count
    }
    
    var newsChanged: (() -> Void)?
    
    init() {
        fetchNewsData(page: currentPage)
    }
    
    func fetchNewsData(page: Int) {
        let paginationURL = "\(url)&page=\(currentPage)&pageSize=\(itemsPerPage)"
        
        NetworkService().fetchData(urlString: paginationURL) { [weak self] (result: Result<NewsResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let newResponse):
                    self?.news.append(contentsOf: newResponse.articles)
                    self?.currentPage += 1
                    self?.newsChanged?()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
