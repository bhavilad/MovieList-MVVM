//
//  MainViewModel.swift
//  MovieList-MVVM
//
//  Created by Bhavi Mistry on 26/04/2024.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var dataSource: TrendingMoviesModel?
    var cellDataSource: Observable<[Movie]> = Observable(nil)
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func getMovies() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                
                self?.dataSource = data
                self?.mapCellData()
                
            case .failure(let error):
                
                print("error = \(error)")
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results ?? []
    }
}
