//
//  MovieDetails.swift
//  tmdb
//
//  Created by wahid tariq on 17/09/21.
//

import Foundation

struct MovieDetails: Codable {

    let results: [Result]
}
struct Result: Codable {
    
   var original_title: String?
   var video: Bool?
    var overview: String?
    var release_date: String?
    var title: String?
   var poster_path: String?
}


