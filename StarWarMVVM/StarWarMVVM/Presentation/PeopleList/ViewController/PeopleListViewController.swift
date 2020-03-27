//
//  PeopleListViewController.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 27/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import UIKit

class PeopleListViewController: BaseViewController {
    
    var viewModel: PeopleListViewModel!

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
        tableView.register(UINib(nibName: PeopleListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PeopleListTableViewCell.identifier)
    }
    private func shouldShowLoadingView(_ should: Bool) {
        if should {
            showLoadingView()
        } else {
            hideLoadingView()
        }
    }
}
extension PeopleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PeopleListTableViewCell.identifier, for: indexPath) as? PeopleListTableViewCell else {
            fatalError("Could not load cell named MovieTableViewCell.identifier")
        }
        cell.fill(with: viewModel.items.value[indexPath.row])
        return cell
    }
}
