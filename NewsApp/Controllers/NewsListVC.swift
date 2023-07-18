//
//  NewsListVC.swift
//  NewsApp
//
//  Created by Farhan Saqib on 16/07/2023.
//

import UIKit

class NewsListVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tblNews: UITableView!
    
    //MARK: Variables
    private var viewModel: NewsListVM!
    
    //MARK: LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Supporting Methods
    private func setupView(){
        //ViewModel Initialization
        setupViewModel()
        //Setup TableView
        setupTableView()
    }
    
    private func setupViewModel(){
        viewModel = NewsListVM()
        viewModel.delegate = self
        viewModel.fetchNews()
    }
    
    private func setupTableView(){
        tblNews.register(UINib(nibName: Constants.cellNews, bundle: Bundle.main), forCellReuseIdentifier: Constants.cellNews)
    }
    
}

//MARK: ViewModel Delegates
extension NewsListVC: NewsListViewModelDelegate{
    func didReceiveNewsResponse(responseSuccess: Bool) {
        if responseSuccess{
            self.tblNews.reloadData()
        }else{
            //Show Any Error Dialogue or related stuff.
        }
    }
}

//MARK: TableView DataSource & Delegate
extension NewsListVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellNews, for: indexPath) as? NewsCell else{
            debugPrint("Error dequeuing cell \(Constants.cellNews)")
            return UITableViewCell()
        }
        cell.updateCell(viewModel.newsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.openWebView(viewModel.newsList[indexPath.row].url ?? "")
    }
    
}
