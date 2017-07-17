//
//  ViewController.swift
//  05_jeirani
//
//  Created by Ika Javakhishvili on 05/1/17.
//  Copyright © 2017 Ika Javakhishvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerOneImage: UIImageView!
    @IBOutlet weak var playerTwoImage: UIImageView!
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    enum Player: String {
        case Scissors = "scissors"
        case Rock = "rock"
        case Paper = "paper"
    }
    
    
    enum Result {
        case Win
        case Lose
        case Drow
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerOneImage.image = #imageLiteral(resourceName: "paper")
        
    }

    @IBAction func play(_ sender: Any) {
        var result: Result
        
        var player1: Player
        var player2: Player
        
        let number1 = arc4random_uniform(3)
        let number2 = arc4random_uniform(3)
        
        switch number1 {
            case 0 : player1 = .Paper
            case 1: player1 = .Rock
            default: player1 = .Scissors
        }
        
        switch number2 {
            case 0 : player2 = .Paper
            case 1: player2 = .Rock
            default: player2 = .Scissors
        }
        
        switch (player1, player2) {
            case (.Rock, .Rock), (.Scissors, .Scissors), (.Paper, .Paper): result = .Drow
            case (.Paper, .Scissors), (.Scissors, .Rock), (.Rock, .Paper): result = .Lose
            default: result = .Win
        }
        
        switch result {
        case .Drow:
            playerOneLabel.text = "Drow"
            playerTwoLabel.text = "Drow"
        case .Win:
            playerOneLabel.text = "Win"
            playerTwoLabel.text = "Lose"
        case .Lose:
            playerOneLabel.text = "Lose"
            playerTwoLabel.text = "Win"
        }
      
        
    }


}

