//
//  PeopleRepository.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation
import PromiseKit

class PeopleRepository {

    static var shared = PeopleRepository()
    private var fetchedPeople = [People]()

    func fetchPeople(movieId: Int) -> Promise<[People]> {
        if !fetchedPeople.isEmpty {
            return Promise.value(filterPeople(people: fetchedPeople, movieId: movieId))
        }

        var routeables = [Routeable]()
        for id in 1...9{
            routeables.append(PeopleSearch(page: id))
        }
        return Promise { seal in
            APIManager.executeMultipleRequest(withRouteables: routeables).done { (dataArray) in
                var returnable = [People]()
                dataArray.forEach { (data) in
                    do {
                        let response = try JSONDecoder().decode(PeopleDTOResponse.self, from: data)
                        response.peopleDTO?.forEach({ (peopleDTO) in
                            returnable.append(peopleDTO.mapToDomain())
                        })
                    } catch {
                        seal.reject(error)
                    }
                }
                self.fetchedPeople = returnable
                seal.fulfill(self.filterPeople(people: returnable, movieId: movieId))
            }.catch { (error) in
                seal.reject(error)
            }
        }
    }

    private func filterPeople(people: [People], movieId: Int) -> [People] {
        return people.filter { (people) -> Bool in
            return people.films.contains(movieId)
        }

    }
}
    
