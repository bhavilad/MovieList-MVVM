//
//  APICaller.swift
//  MovieList-MVVM
//
//  Created by Bhavi Mistry on 29/04/2024.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case parseError
}

class APICaller {
    
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMoviesModel, NetworkError>) -> Void) {
        
        let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(NetworkError.urlError))
            return
        }
                
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(NetworkError.parseError))
            }
     
        }.resume()
        
    }
}
