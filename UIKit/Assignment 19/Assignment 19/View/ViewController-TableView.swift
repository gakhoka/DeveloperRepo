//
//  TableView - protocols.swift
//  Assignment 19
//
//  Created by Giorgi Gakhokidze on 30.10.24.
//

import Foundation
import UIKit


extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = viewModel.news[indexPath.row]
        let vc = NewsDetailViewController()
        vc.configureWith(selectedRow)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfNews
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LatestNewsCell", for: indexPath) as? LatestNewsCell {
            let selectedNews = viewModel.news[indexPath.row]
            cell.configure(news: selectedNews)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.numberOfNews - 1 {
            viewModel.fetchNewsData(page: viewModel.currentPage)
        }
    }
}
