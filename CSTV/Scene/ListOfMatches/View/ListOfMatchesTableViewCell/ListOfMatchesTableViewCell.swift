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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.firsTeamNameLabel.text?.removeAll()
        self.secondTeamNameLabel.text?.removeAll()
        self.leagueNameLabel.text?.removeAll()
        self.firstTeamImageView.image = nil
        self.secondTeamImageView.image = nil
        self.leagueImageView.image = nil
    }
    
    func setupElements() {
        
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
    }
}
