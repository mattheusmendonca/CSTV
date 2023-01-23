//
//  MatchDetailsTableViewCell.swift
//  CSTV
//
//  Created by Mac Lavid on 22/01/23.
//

import UIKit

class MatchDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var playerTwoPictureImageView: UIImageView!
    @IBOutlet weak var playerTwoNameLabel: UILabel!
    @IBOutlet weak var playerTwoNicknameLabel: UILabel!
    @IBOutlet weak var playerTwoContainerView: UIView!
    @IBOutlet weak var playerOnePictureImageView: UIImageView!
    @IBOutlet weak var playerOneNameLabel: UILabel!
    @IBOutlet weak var playerOneNicknameLabel: UILabel!
    @IBOutlet weak var playerOneContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.playerOneNameLabel.text?.removeAll()
        self.playerOneNicknameLabel.text?.removeAll()
        self.playerTwoNameLabel.text?.removeAll()
        self.playerTwoNicknameLabel.text?.removeAll()
        self.playerOnePictureImageView.image = nil
        self.playerTwoPictureImageView.image = nil
    }
    
    func setupElements() {
        
    }
    
    func setupCell(teamOne: TeamsDetails, teamTwo: TeamsDetails, index: Int) {
        if let firstNamePlayerOne = teamOne.players[index].firstName, let lastNamePlayerOne = teamOne.players[index].lastName {
            self.playerOneNameLabel.text = "\(firstNamePlayerOne) \(lastNamePlayerOne)"
        }
        
        if let firstNamePlayerTwo = teamTwo.players[index].firstName, let lastNamePlayerTwo = teamTwo.players[index].lastName {
            self.playerOneNameLabel.text = "\(firstNamePlayerTwo) \(lastNamePlayerTwo)"
        }
        
        self.playerOneNicknameLabel.text = teamOne.players[index].nickname
        self.playerTwoNicknameLabel.text = teamTwo.players[index].nickname
        
        if let playerOneImageUrl = teamOne.players[index].imageUrl {
            self.playerOnePictureImageView.kf.setImage(with: playerOneImageUrl)
        }
        
        if let playerTwoImageUrl = teamTwo.players[index].imageUrl {
            self.playerTwoPictureImageView.kf.setImage(with: playerTwoImageUrl)
        }
    }
}
