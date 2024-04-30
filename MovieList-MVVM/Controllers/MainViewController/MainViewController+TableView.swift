//
//  MainViewController+TableView.swift
//  MovieList-MVVM
//
//  Created by Bhavi Mistry on 26/04/2024.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .clear
        registerCell()
    }
    
    private func registerCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.cellDataSource[indexPath.row].movieName
        return cell
    }

}
