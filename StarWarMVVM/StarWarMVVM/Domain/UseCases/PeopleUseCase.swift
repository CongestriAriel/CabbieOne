//
//  PeopleUseCase.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation
import PromiseKit

class PeopleUseCase {

    func execute(movieId: Int) -> Promise<[People]> {
        let repository = PeopleRepository.shared
        return repository.fetchPeople(movieId: movieId)
    }
}
