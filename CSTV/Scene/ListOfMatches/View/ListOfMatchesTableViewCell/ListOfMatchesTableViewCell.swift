//
//  ListOfMatchesTableViewCell.swift
//  CSTV
//
//  Created by Mac Lavid on 17/01/23.
//

import UIKit
import Kingfisher

class ListOfMatchesTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var firsTeamNameLabel: UILabel!
    @IBOutlet weak var secondTeamNameLabel: UILabel!
    @IBOutlet weak var firstTeamImageView: UIImageView!
    @IBOutlet weak var secondTeamImageView: UIImageView!
    @IBOutlet weak var vsLabel: UILabel!
    @IBOutlet weak var leagueImageView: UIImageView!
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var timeLabelView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupElements()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.firsTeamNameLabel.text?.removeAll()
        self.secondTeamNameLabel.text?.removeAll()
        self.leagueNameLabel.text?.removeAll()
        self.timeLabel.text?.removeAll()
        self.firstTeamImageView.image = nil
        self.secondTeamImageView.image = nil
        self.leagueImageView.image = nil
    }
    
    func setupElements() {
        self.timeLabelView.layer.cornerRadius = 16
        self.containerView.layer.cornerRadius = 16
        
        self.timeLabelView.layer.masksToBounds = true
        self.timeLabelView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
        
        self.timeLabel.font = UIFont.init(name: "Roboto-Regular", size: 8)
        self.firsTeamNameLabel.font = UIFont.init(name: "Roboto-Regular", size: 10)
        self.secondTeamNameLabel.font = UIFont.init(name: "Roboto-Regular", size: 10)
        self.leagueNameLabel.font = UIFont.init(name: "Roboto-Regular", size: 8)
        self.vsLabel.font = UIFont.init(name: "Roboto-Regular", size: 12)
    }
    
    func setupDate(date: Date) {
        let dateString = DateFormatter.dateString(initialDate: Date(), endDate: date)
        self.timeLabel.text = dateString
    }

    func setupListOfMatches(match: Matches) {
        guard match.adversary.count == 2 else { return }
        
        let firstTeam = match.adversary[0].adversary
        let secondTeam = match.adversary[1].adversary
        
        self.firsTeamNameLabel.text = firstTeam.name
        self.secondTeamNameLabel.text = secondTeam.name
        self.leagueNameLabel.text = match.league.name
        self.firstTeamImageView.kf.setImage(with: firstTeam.imageUrl)
        self.secondTeamImageView.kf.setImage(with: secondTeam.imageUrl)
        self.leagueImageView.kf.setImage(with: match.league.imageUrl)
        
        if match.status == "running" {
            self.timeLabel.text = "AGORA"
            self.timeLabelView.backgroundColor = UIColor.red
        } else if let date = match.date {
            self.timeLabelView.backgroundColor = UIColor(named: "DivisionColor")
            self.setupDate(date: date)
        }
    }
}
