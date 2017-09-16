//
//  StatisticsViewController.swift
//  MiniProject1
//
//  Created by Vineeth Yeevani on 9/15/17.
//  Copyright © 2017 Vineeth Yeevani. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    var firstQuestion : UILabel!
    var secondQuestion : UILabel!
    var thirdQuestion : UILabel!
    var longestStreak : UILabel!
    var backToGame : UIButton!
    var myString : String!
    var questionArray : [String]!
    override func viewDidLoad() {
        print(questionArray)
        super.viewDidLoad()
        
        //Label for the longest streak
        longestStreak = UILabel(frame: CGRect(x: view.frame.width*0.25, y: 0, width: view.frame.width*0.5, height: view.frame.height*0.1))
        print(myString)
        longestStreak.text = "Longest Streak: \(myString!)"
        longestStreak.textAlignment = .right
        view.addSubview(longestStreak)
        
        
        //Button to return to the game page without changing the score using the unwind segue
        backToGame = UIButton(frame: CGRect(x: view.frame.width*0.25, y: view.frame.height*0.1, width: view.frame.width*0.5, height: view.frame.height*0.1))
        backToGame.layer.cornerRadius = 8
        backToGame.setTitle("Back to Game", for: .normal)
        backToGame.backgroundColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 100/255)
        backToGame.addTarget(self, action: #selector(backtoGameFunction), for: .touchUpInside)
        view.addSubview(backToGame)
        
        firstQuestion = UILabel(frame: CGRect(x: view.frame.width*0.1, y: view.frame.height * 0.4, width: view.frame.width*0.8, height: view.frame.height*0.1))
        firstQuestion.text =  "Last              \(questionArray[questionArray.count-1])"
        firstQuestion.textAlignment = .left
        
        view.addSubview(firstQuestion)
        
        secondQuestion = UILabel(frame: CGRect(x: view.frame.width*0.1, y: view.frame.height * 0.6, width: view.frame.width*0.8, height: view.frame.height*0.1))
        secondQuestion.text = "Second            \(questionArray[questionArray.count-2])"
        secondQuestion.textAlignment = .left
        view.addSubview(secondQuestion)
        
        thirdQuestion = UILabel(frame: CGRect(x: view.frame.width*0.1, y: view.frame.height * 0.8, width: view.frame.width*0.8, height: view.frame.height*0.1))
        thirdQuestion.text =  "Third             \(questionArray[questionArray.count-3])"
        thirdQuestion.textAlignment = .left
        view.addSubview(thirdQuestion)
    }

    //Function to go back to the game page
    func backtoGameFunction(){
        self.performSegue(withIdentifier: "unwindToGame", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
