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
        self.setupElements()
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
        self.playerOneContainerView.layer.masksToBounds = true
        self.playerOneContainerView.layer.cornerRadius = 16
        self.playerOneContainerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        self.playerOnePictureImageView.layer.cornerRadius = 8
        
        self.playerTwoContainerView.layer.masksToBounds = true
        self.playerTwoContainerView.layer.cornerRadius = 16
        self.playerTwoContainerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        self.playerTwoPictureImageView.layer.cornerRadius = 8
        
        self.playerOneNicknameLabel.font = UIFont.init(name: "Roboto-Regular", size: 14)
        self.playerTwoNicknameLabel.font = UIFont.init(name: "Roboto-Regular", size: 14)
        self.playerOneNameLabel.font = UIFont.init(name: "Roboto-Regular", size: 12)
        self.playerTwoNameLabel.font = UIFont.init(name: "Roboto-Regular", size: 12)
    }
    
    func setupCell(teamOne: TeamsDetails, teamTwo: TeamsDetails, index: Int) {
        if teamOne.players.count >= index + 1 {
            if let firstNamePlayerOne = teamOne.players[index].firstName, let lastNamePlayerOne = teamOne.players[index].lastName, let playerOneImageUrl = teamOne.players[index].imageUrl {
                self.playerOneNameLabel.text = "\(firstNamePlayerOne) \(lastNamePlayerOne)"
                self.playerOnePictureImageView.kf.setImage(with: playerOneImageUrl)
            }
            
            self.playerOneNicknameLabel.text = teamOne.players[index].nickname
        }
        
        if teamTwo.players.count >= index + 1 {
            if let firstNamePlayerTwo = teamTwo.players[index].firstName, let lastNamePlayerTwo = teamTwo.players[index].lastName, let playerTwoImageUrl = teamTwo.players[index].imageUrl  {
                self.playerTwoNameLabel.text = "\(firstNamePlayerTwo) \(lastNamePlayerTwo)"
                self.playerTwoPictureImageView.kf.setImage(with: playerTwoImageUrl)
            }
            
            self.playerTwoNicknameLabel.text = teamTwo.players[index].nickname
        }
    }
}
