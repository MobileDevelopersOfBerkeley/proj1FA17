//
//  Game.swift
//  Match the Members!
//
//  Created by Stephen Jayakar on 9/14/17.
//  Copyright © 2017 Stephen Jayakar. All rights reserved.
//
import UIKit

var GLOBAL_STREAK: Int = 0
var GLOBAL_SCORE: Int = 0
var GLOBAL_RECENT_ANSWER1: [String] = []
var GLOBAL_RECENT_ANSWER2: [String] = []
var GLOBAL_RECENT_ANSWER3: [String] = []

class Game {
    var seconds: Int = 5
    var timer: Timer! = nil
    var vc: GameVC! = nil
    var buttons: [UIButton] = []
    var streak: Int = 0
    
    var members: [String] = ["Aayush", "Abhinav", "Adhiraj", "Akkshay", "Amy", "Aneesh", "Ashwin", "Ben", "Billy", "Boris", "Edward", "Candice", "Cody", "Daniel", "Eliot", "Emaan", "Eric", "Jared", "Jeffrey", "Jessica", "Julia", "Justin", "Kevin", "Krishnan", "Kristin", "Leon", "Levi", "Mohit", "Mudit", "Peter", "Radhika", "Rochelle", "Sahil", "Sarah", "Sayan", "Sharie", "Shiv", "Shreya", "Shubham", "Sumukh", "Tarun", "Victor", "Vidya", "Wilbur", "Young", "Zach"]
    var member_photos: [String] = ["aayushtyagi", "abhinavkoppu", "adhirajdatar", "akkshaykhoslaa", "amyshen", "aneeshjindal", "ashwinvaidyanathan", "bengoldberg", "billylu", "borisyue", "edwardliu", "candiceye", "codyhsieh", "danielandrews", "eliothan", "emaanhariri", "erickong", "jaredgutierrez", "jeffreyzhang", "jessicachen", "julialuo", "justinkim", "kevinjiang", "krishnanrajiyah", "kristinho", "leonkwak", "leviwalsh", "mohitkatyal", "muditmittal", "peterschafhalter", "radhikadhomse", "rochelleshen", "sahillamba", "sarahtang", "sayanpaul", "shariewang", "shivkushwah", "shreyareddy", "shubhamgoenka", "sumukhshivakumar", "tarunkhasnavis", "victorsun", "vidyaravikumar", "wilburshi", "younglin", "zachgovani"]

    var rand: Int = 0
    
    var correctButtonIndex: Int = 0
    
    init(vc: GameVC) {
        self.vc = vc
        timer = Timer()
    }
    
    func run(vc: GameVC) {
        self.vc = vc
        
        buttons = [vc.answer1, vc.answer2,
                   vc.answer3, vc.answer4]
        
        rand = Int(arc4random_uniform(45))
        correctButtonIndex = 0
        setImage(member_photos[rand])
        setButtons(members[rand])
        vc.statsButton.backgroundColor = UIColor(red: 62/255, green: 150/255, blue: 247/255, alpha: 0.95);
        vc.statsButton.layer.cornerRadius = 8;
        vc.statsButton.setTitle("Score: 0", for: .normal);
        vc.statsButton.setTitleColor(UIColor.white, for: .normal);
        vc.statsButton.addTarget(self, action: #selector(statsTapped), for: .touchUpInside);
        vc.view.addSubview(vc.statsButton);
        startGame()
        vc.statsButton.setTitle("Score: " + String(GLOBAL_SCORE), for: .normal)
    }

    func setImage(_ name: String) {
        vc.memberImage.image = UIImage(named: "memberPhotos/" + name + ".jpg")
    }

    func setButtons(_ name: String) {
        var wrongMembers: [Int]
        wrongMembers = []
        correctButtonIndex = Int(arc4random_uniform(4))
        var rand: Int
        for i in 0...3 {
            if i == correctButtonIndex {
                _setAnswerRight(index: i, name: name)
            } else {
                rand = Int(arc4random_uniform(45))
                while (wrongMembers.contains(rand) || rand == self.rand) {
                    rand = Int(arc4random_uniform(45))
                }
                wrongMembers.append(rand)
                _setAnswerWrong(index: i, name: members[rand])
            }
        }
    }

    
    func _setAnswerRight(index: Int, name: String) {
        buttons[index].removeTarget(nil, action: nil, for: .allEvents)
        buttons[index].setTitle(name, for: .normal)
        buttons[index].addTarget(self, action: #selector(rightAns), for: .touchUpInside)
    }

    func _setAnswerWrong(index: Int, name: String) {
        buttons[index].removeTarget(nil, action: nil, for: .allEvents)
        buttons[index].setTitle(name, for: .normal)
        buttons[index].addTarget(self, action: #selector(wrongAns), for: .touchUpInside)
    }
    
    func refreshButtons() {
        for b in buttons {
            b.backgroundColor = UIColor(hue: 0.6639, saturation: 0.23, brightness: 1, alpha: 1.0) /* #c4c5ff */
        }
    }
    
    func disableButtons() {
        for b in buttons {
            b.isEnabled = false
        }
    }
    
    func enableButtons() {
        for b in buttons {
            b.isEnabled = true
        }
    }
    
    // from stackoverflow#31690634
    func resetTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(self.updateTimer),
                                     userInfo: nil,
                                     repeats: true)
    }

    func pauseGame() {
        timer.invalidate()
    }
    
    // assumes the timer has been invalidated
    func startGame() {
        print("game is starting")
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(self.updateTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func statsTapped() {
        pauseGame()
        vc.performSegue(withIdentifier: "toStats", sender: self);
    }
    
    // how do we pass the button that called this
    @objc func rightAns() {
        GLOBAL_RECENT_ANSWER1 = GLOBAL_RECENT_ANSWER2
        GLOBAL_RECENT_ANSWER2 = GLOBAL_RECENT_ANSWER3
        GLOBAL_RECENT_ANSWER3 = []
        GLOBAL_RECENT_ANSWER3.append(member_photos[rand])
        GLOBAL_RECENT_ANSWER3.append("Correct")
        streak += 1
        if streak > GLOBAL_STREAK {
            GLOBAL_STREAK = streak
        }
        buttons[correctButtonIndex].backgroundColor = UIColor(red: 124/255, green: 247/255, blue: 96/255, alpha: 1.0) /* #7cf760 */
        GLOBAL_SCORE += 1
        vc.statsButton.setTitle("Score: " + String(GLOBAL_SCORE), for: .normal)
        disableButtons()
        seconds = 1
        resetTimer()
    }
    
    @objc func wrongAns(_ sender: UIButton) {
        GLOBAL_RECENT_ANSWER1 = GLOBAL_RECENT_ANSWER2
        GLOBAL_RECENT_ANSWER2 = GLOBAL_RECENT_ANSWER3
        GLOBAL_RECENT_ANSWER3 = []
        GLOBAL_RECENT_ANSWER3.append(member_photos[rand])
        GLOBAL_RECENT_ANSWER3.append("Wrong")
        if streak > GLOBAL_STREAK {
            GLOBAL_STREAK = streak
        }
        streak = 0
        sender.backgroundColor = UIColor(red: 255/255, green: 99/255, blue: 102/255, alpha: 1.0) /* #ff6366 */
        disableButtons()
        seconds = 1
        resetTimer()
    }
    
    
    @objc func updateTimer() {
        seconds -= 1
        print(seconds)
        if seconds <= 0 {
            enableButtons()
            rand = Int(arc4random_uniform(45))
            setImage(member_photos[rand])
            setButtons(members[rand])
            refreshButtons()
            seconds = 5
            resetTimer()
        }
    }
}
