//
//  MoviesRepository.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation
import PromiseKit

class MoviesRepository {

    func fetchMovies() -> Promise<[Movie]> {
        return Promise { seal in
            APIManager.request(withRouteable: MoviesSearch()).done { (data) in
                do {
                    let response =  try JSONDecoder().decode(MoviesDTOResponse.self, from: data)
                    var returnable: [Movie] = []
                    response.moviesDTO.forEach { (movieDTO) in
                        returnable.append(movieDTO.mapToDomain())
                    }
                    seal.fulfill(returnable)
                } catch {
                    seal.reject(error)
                }
            }.catch { (error) in
                seal.reject(error)
            }
        }
    }
}
