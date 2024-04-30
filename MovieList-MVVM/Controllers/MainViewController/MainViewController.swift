//
//  MainViewController.swift
//  MovieList-MVVM
//
//  Created by Bhavi Mistry on 25/04/2024.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: MainViewModel = MainViewModel()
    var cellDataSource: [Movie] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    private func setupUI() {
        self.title = "Main screen"
        
        setupTableView()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self,
                  let isLoading = isLoading else {
                return
            }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
            
            viewModel.cellDataSource.bind { [weak self] movies in
                guard let self = self,
                      let movies = movies else {
                    return
                }
                self.cellDataSource = movies
                self.reloadTableView()
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getMovies()
    }
}
