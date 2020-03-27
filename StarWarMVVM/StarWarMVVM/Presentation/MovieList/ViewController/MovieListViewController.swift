//
//  MovieListViewController.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import UIKit

class MovieListViewController: BaseViewController {

    var viewModel: MovieListViewModel!

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.screenTitle
        bind()
        setUp()
        viewModel.viewDidLoad()
    }

    private func bind() {
        viewModel.isSearching.observe(on: self) { [unowned self] (isSearching) in self.shouldShowLoadingView(isSearching) }
        viewModel.items.observe(on: self) { [unowned self] (_) in
            self.tableView.reloadData()
        }
    }

    private func setUp() {
        tableView.register(UINib(nibName: MovieTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    private func shouldShowLoadingView(_ should: Bool) {
        if should {
            showLoadingView()
        } else {
            hideLoadingView()
        }
    }
}
extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else {
            fatalError("Could not load cell named MovieTableViewCell.identifier")
        }
        cell.fill(with: viewModel.items.value[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(at: indexPath)
    }
}
