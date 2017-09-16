//
//  StatsVC.swift
//  Match the Members!
//
//  Created by Stephen Jayakar on 9/15/17.
//  Copyright © 2017 Stephen Jayakar. All rights reserved.
//

import UIKit

class StatsVC: UIViewController {
    var exitButton: UIButton!
    var statsTitle: UILabel!
    var scoreLabel: UILabel!
    var streakLabel: UILabel!
    var lastThreeTitle: UILabel!
    var recentAnswer1: UIImageView!
    var recentAnswer2: UIImageView!
    var recentAnswer3: UIImageView!
    var recentAnswer1_result: UILabel!
    var recentAnswer2_result: UILabel!
    var recentAnswer3_result: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let VFW = view.frame.width
        let VFH = view.frame.height
        
        // Adding stop button
        exitButton = UIButton(frame: CGRect(x:  VFW * 0.9,
                                            y: VFW * 0.075,
                                            width: VFW * 0.08,
                                            height: VFW * 0.08))
        exitButton.backgroundColor = UIColor.black
        exitButton.setTitle("x", for: .normal)
        exitButton.setTitleColor(UIColor.white, for: .normal)
        exitButton.layer.cornerRadius = 8
        exitButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        view.addSubview(exitButton)
        
        // Adding title of screen on top
        statsTitle = UILabel(frame: CGRect(x: 0,
                                      y: 0,
                                      width: VFW,
                                      height: VFH * 0.2))
        statsTitle.text = "Statistics"
        statsTitle.adjustsFontSizeToFitWidth = true
        statsTitle.font = UIFont(name: statsTitle.font.fontName, size: 28)
        statsTitle.textAlignment = .center
        view.addSubview(statsTitle)
        
        // Score
        scoreLabel = UILabel(frame: CGRect(x: VFW * 0.1,
                                           y: VFH * 0.15,
                                           width: VFW * 0.5,
                                           height: VFH * 0.1))
        scoreLabel.text = "Score: " + String(GLOBAL_SCORE)
        scoreLabel.font = UIFont(name: scoreLabel.font.fontName, size: 20)
        scoreLabel.textAlignment = .left
        view.addSubview(scoreLabel)
        
        // Streak
        streakLabel = UILabel(frame: CGRect(x: VFW * 0.1,
                                           y: VFH * 0.22,
                                           width: VFW * 0.5,
                                           height: VFH * 0.1))
        streakLabel.text = "Longest Streak: " + String(GLOBAL_STREAK)
        streakLabel.font = UIFont(name: streakLabel.font.fontName, size: 20)
        streakLabel.textAlignment = .left
        view.addSubview(streakLabel)
        
        // Last three answers title
        lastThreeTitle = UILabel(frame: CGRect(x: 0,
                                           y: VFH * 0.25,
                                           width: VFW,
                                           height: VFH * 0.2))
        lastThreeTitle.text = "Last Three Answers"
        lastThreeTitle.adjustsFontSizeToFitWidth = true
        lastThreeTitle.font = UIFont(name: lastThreeTitle.font.fontName, size: 22)
        lastThreeTitle.textAlignment = .center
        view.addSubview(lastThreeTitle)
        
        // Three answer frames
        recentAnswer1 = UIImageView(frame: CGRect(x: VFW * 0.1,
                                                  y: VFH * 0.4,
                                                  width: VFH * 0.18,
                                                  height: VFH * 0.18))
        recentAnswer1.contentMode = .scaleAspectFit
        if GLOBAL_RECENT_ANSWER3 != [] {
            recentAnswer1.image = UIImage(named: "memberPhotos/" + GLOBAL_RECENT_ANSWER3[0] + ".jpg")
            view.addSubview(recentAnswer1)
        
            recentAnswer1_result = UILabel(frame: CGRect(x: VFW * 0.4,
                                                     y: VFH * 0.4,
                                                     width: VFH * 0.4,
                                                     height: VFH * 0.18))
            recentAnswer1_result.text = GLOBAL_RECENT_ANSWER3[1]
            recentAnswer1_result.adjustsFontSizeToFitWidth = true
            recentAnswer1_result.font = UIFont(name: recentAnswer1_result.font.fontName, size: 35)
            recentAnswer1_result.textAlignment = .center
            view.addSubview(recentAnswer1_result)
        }
        
        if GLOBAL_RECENT_ANSWER2 != [] {
        recentAnswer2 = UIImageView(frame: CGRect(x: VFW * 0.1,
                                                  y: VFH * 0.6,
                                                  width: VFH * 0.18,
                                                  height: VFH * 0.18))
        recentAnswer2.contentMode = .scaleAspectFit
        recentAnswer2.image = UIImage(named: "memberPhotos/" + GLOBAL_RECENT_ANSWER2[0] + ".jpg")
        view.addSubview(recentAnswer2)
            
            recentAnswer2_result = UILabel(frame: CGRect(x: VFW * 0.4,
                                                         y: VFH * 0.6,
                                                         width: VFH * 0.4,
                                                         height: VFH * 0.18))
            recentAnswer2_result.text = GLOBAL_RECENT_ANSWER2[1]
            recentAnswer2_result.adjustsFontSizeToFitWidth = true
            recentAnswer2_result.font = UIFont(name: recentAnswer2_result.font.fontName, size: 35)
            recentAnswer2_result.textAlignment = .center
            view.addSubview(recentAnswer2_result)
        }
        
        if GLOBAL_RECENT_ANSWER1 != [] {
        recentAnswer3 = UIImageView(frame: CGRect(x: VFW * 0.1,
                                                  y: VFH * 0.8,
                                                  width: VFH * 0.18,
                                                  height: VFH * 0.18))
        recentAnswer3.contentMode = .scaleAspectFit
        recentAnswer3.image = UIImage(named: "memberPhotos/" + GLOBAL_RECENT_ANSWER1[0] + ".jpg")
        view.addSubview(recentAnswer3)
            
            recentAnswer3_result = UILabel(frame: CGRect(x: VFW * 0.4,
                                                         y: VFH * 0.8,
                                                         width: VFH * 0.4,
                                                         height: VFH * 0.18))
            recentAnswer3_result.text = GLOBAL_RECENT_ANSWER1[1]
            recentAnswer3_result.adjustsFontSizeToFitWidth = true
            recentAnswer3_result.font = UIFont(name: recentAnswer3_result.font.fontName, size: 35)
            recentAnswer3_result.textAlignment = .center
            view.addSubview(recentAnswer3_result)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func continueTapped() {
        self.performSegue(withIdentifier: "statsToGame", sender: self)
    }
}
