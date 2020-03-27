//
//  MoviesUseCase.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation
import PromiseKit

class MoviesUseCase {
    func execute() -> Promise<[Movie]> {
        let repository = MoviesRepository()
        return repository.fetchMovies()
    }
}
