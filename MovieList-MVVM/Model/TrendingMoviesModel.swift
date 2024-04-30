//
//  TrendingMoviesModel.swift
//  MovieList-MVVM
//
//  Created by Bhavi Mistry on 29/04/2024.
//

import Foundation

struct TrendingMoviesModel: Codable {
    
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
}
// MARK: - Result
struct Movie: Codable {
    let backdropPath: String
    let id: Int
    let originalName: String?
    let overview, posterPath: String
    let mediaType: MediaType
    let adult: Bool
    let name: String?
    let originalLanguage: OriginalLanguage
    let genreIDS: [Int]
    let popularity: Double
    let firstAirDate: String?
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [String]?
    let originalTitle, title, releaseDate: String?
    let video: Bool?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case adult, name
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
        case originalTitle = "original_title"
        case title
        case releaseDate = "release_date"
        case video
    }
    
    var movieName: String {
        return name ?? title ?? ""
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case ja = "ja"
    case ko = "ko"
}
