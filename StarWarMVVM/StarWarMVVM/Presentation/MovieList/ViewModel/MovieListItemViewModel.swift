//
//  MovieListItemViewModel.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation

struct MovieListItemViewModel {
    
    let title: String
    let releaseDate: String
    let director: String

    public init(movie: Movie) {
        self.title = movie.title ?? "No Info"
        self.director = movie.director ?? "No Info"
        let releaseDateString = movie.releaseDate ?? "No Info"
        self.releaseDate = "Release date: \(releaseDateString)"
    }
}

