//
//  MovieListViewModel.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation

protocol MoviesListViewModelInput {
    func viewDidLoad()
    func didSelect(at indexPath: IndexPath)
}

protocol MoviesListViewModelOutput {
    var items: Observable<[MovieListItemViewModel]> { get }
    var isSearching: Observable<Bool> { get }
    var screenTitle: String { get }
}

final class MovieListViewModel: MoviesListViewModelOutput, MoviesListViewModelInput {
    private var useCase: MoviesUseCase = MoviesUseCase()
    private var movies = [Movie]()
    var router: MovieListRouter!
    var items: Observable<[MovieListItemViewModel]> = Observable([])
    var isSearching: Observable<Bool> = Observable(false)
    var screenTitle: String {
        return "Movies"
    }
    
    func viewDidLoad() {
        isSearching.value = true
        fetchMovies()
    }
    
    func didSelect(at indexPath: IndexPath) {
        router.goToPeopleList(movieId: movies[indexPath.row].id)
    }

    private func fetchMovies() {
        isSearching.value = true
        useCase.execute().done { (movies) in
            self.movies = movies
            self.items.value += movies.map(MovieListItemViewModel.init)
        }.ensure {
            self.isSearching.value = false
        }.catch { (error) in
//          must handle Error
        }
    }
}
