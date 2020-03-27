//
//  PeopleListViewModel.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 27/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation

protocol PeopleListViewModelInput {
    func viewDidLoad()
}

protocol PeopleListViewModelOutput {
    var items: Observable<[PeopleListItemViewModel]> { get }
    var isSearching: Observable<Bool> { get }
    var screenTitle: String { get }
}

final class PeopleListViewModel: PeopleListViewModelOutput, PeopleListViewModelInput {
    

    private var useCase: PeopleUseCase = PeopleUseCase()
    private var movieId: Int!
    var router: PeopleListRouter!
    var people = [People]()
    var items: Observable<[PeopleListItemViewModel]> = Observable([])
    var isSearching: Observable<Bool> = Observable(false)
    var screenTitle: String {
        return "Characters"
    }

    init(movieId: Int) {
        self.movieId = movieId
    }

    func viewDidLoad() {
        fetchMovies()
    }

    private func fetchMovies() {
        isSearching.value = true
        useCase.execute( movieId: movieId).done { (people) in
            self.people += people
            self.items.value += people.map(PeopleListItemViewModel.init)
        }.ensure {
            self.isSearching.value = false
        }.catch { (error) in
//          must handle Error
        }
    }
}
