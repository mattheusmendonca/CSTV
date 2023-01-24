//
//  MatchDetailsViewController.swift
//  CSTV
//
//  Created by Mac Lavid on 22/01/23.
//

import UIKit

class MatchDetailsViewController: UIViewController, ViewModelBindable {
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var firstTeamImageView: UIImageView!
    @IBOutlet weak var secondTeamImageView: UIImageView!
    @IBOutlet weak var firstTeamNameLabel: UILabel!
    @IBOutlet weak var secondTeamNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var teamsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var vsLabel: UILabel!
    
    var viewModel: MatchDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupElements()
        self.setupTableView()
    }
    
    func bindViewModel() {
        self.viewModel?.teams.addAndNotify(observer: self, observerBlock: { [weak self] teams in
            self?.teamsTableView.reloadData()
            self?.teamsTableView.refreshControl?.endRefreshing()
        })
        self.viewModel?.finishLoading.addAndNotify(observer: self, observerBlock: { [weak self] stop in
            self?.stopAnimating(stop: stop)
        })
    }
    
    
    func setupTableView() {
        self.teamsTableView.register(UINib(nibName: "MatchDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "matchDetailsCell")
    }
    
    func setupDate(date: Date) {
        let dateString = DateFormatter.dateString(initialDate: Date(), endDate: date)
        self.timeLabel.text = dateString
    }
    
    func setupElements() {
        guard let match = self.viewModel?.match.value else { return }
        self.leagueNameLabel.text = match.league.name
        
        if match.status == "running" {
            self.timeLabel.text = "AGORA"
        } else if let date = match.date {
            self.setupDate(date: date)
        }
        
        self.timeLabel.font = UIFont.init(name: "Roboto-Regular", size: 12)
        self.leagueNameLabel.font = UIFont.init(name: "Roboto-Regular", size: 18)
        self.vsLabel.font = UIFont.init(name: "Roboto-Regular", size: 12)
        self.firstTeamNameLabel.font = UIFont.init(name: "Roboto-Regular", size: 10)
        self.secondTeamNameLabel.font = UIFont.init(name: "Roboto-Regular", size: 10)
    }
    
    func setupMatchDetailsInfo() {
        guard let teams =  self.viewModel?.teams.value else { return }
        
        self.firstTeamImageView.kf.setImage(with: teams[0].imageUrl)
        self.secondTeamImageView.kf.setImage(with: teams[1].imageUrl)
        self.firstTeamNameLabel.text = teams[0].name
        self.secondTeamNameLabel.text = teams[1].name
    }
    
    func stopAnimating(stop: Bool){
        if stop {
            self.setupMatchDetailsInfo()
            self.activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.viewModel?.goBack()
    }
}

extension MatchDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let teams = self.viewModel?.teams.value else { return 0 }
        if teams.count == 2 {
            return 5
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let teams = self.viewModel?.teams.value else { return UITableViewCell() }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "matchDetailsCell", for: indexPath) as? MatchDetailsTableViewCell {
           
            cell.setupCell(teamOne: teams[0], teamTwo: teams[1], index: indexPath.row)
            return cell
        }
        return UITableViewCell()
    }
}
