//
//  ListOfMatchesViewController.swift
//  CSTV
//
//  Created by Mac Lavid on 17/01/23.
//

import UIKit

class ListOfMatchesViewController: UIViewController, ViewModelBindable {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorMatches: UIActivityIndicatorView!
    @IBOutlet weak var matchesLabel: UILabel!
    
    var viewModel: ListOfMatchesViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupElements()
        self.refreshMatches()
        self.tableView.register(UINib(nibName: "ListOfMatchesTableViewCell", bundle: nil), forCellReuseIdentifier: "listOfMatchesCell")
    }
    
    func bindViewModel() {
        self.viewModel?.listMatches.addAndNotify(observer: self, observerBlock: { [weak self] _ in
            self?.tableView.reloadData()
            self?.tableView.refreshControl?.endRefreshing()
        })
        self.viewModel?.finishLoading.addAndNotify(observer: self, observerBlock: { [weak self] stop in
            self?.stopLoading(stop: stop)
        })
    }
    
    func setupElements() {
        self.matchesLabel.font = UIFont.init(name: "Roboto-Regular", size: 32)

    }
    
    func refreshMatches() {
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
    }
    
    func stopLoading(stop: Bool) {
        if stop {
            activityIndicatorMatches.stopAnimating()
        }
    }
    
    @objc private func refresh() {
        self.viewModel?.refreshListOfMatches()
    }
}

extension ListOfMatchesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.listMatches.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let match = self.viewModel?.listMatches.value[indexPath.row] else { return UITableViewCell() }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "listOfMatchesCell", for: indexPath) as? ListOfMatchesTableViewCell {
            cell.setupListOfMatches(match: match)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewModel?.pagination(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let match = self.viewModel?.listMatches.value[indexPath.row] else { return }
        self.viewModel?.goToMatchesDetails(match: match)
    }
}
