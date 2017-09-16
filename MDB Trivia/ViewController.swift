//
//  ViewController.swift
//  MDB Trivia
//
//  Created by Carol Wang on 9/15/17.
//  Copyright © 2017 MDB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var controlButton: UIButton!
    
    var scoreLabel: UILabel!
    var score = 0

    var timerLabel: UILabel!
    var questionTimer = Timer()
    var time = 5
    var isTimerRunning = false
    
    var profileImage: UIImageView!
    
    var options: [UIButton] = []
    let numOptions = 4
    
    var question: Question!
    
    var correctAnswer = 0
    var chosenAnswer = -1
    
    var isStart: Bool = true
    
    var pauseScreen: UIView!
    var paused = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        controlButton = UIButton(frame: CGRect(x: 15, y: 20, width: 100, height: 40))
        controlButton.setTitle("Start", for: .normal)
        controlButton.setTitleColor(UIColor.white, for: .normal)
        controlButton.backgroundColor = UIColor(red: 0, green: 153/255, blue: 51/255, alpha: 0.95)
        controlButton.layer.cornerRadius = 8
        controlButton.addTarget(self, action: #selector(toggleButton), for: .touchUpInside)
        view.addSubview(controlButton)
        
        // timer stuff
        let timerFrame = UIView(frame: CGRect(x: view.frame.width - 115, y: 20, width: 100, height: 40))
        timerFrame.backgroundColor = UIColor(red: 23/255, green: 123/255, blue: 156/255, alpha: 0.95)
        timerFrame.layer.cornerRadius = 8
        timerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        timerLabel.textAlignment = .center
        timerLabel.textColor = UIColor.white
        timerLabel.text = "0:0"+String(time)
        timerFrame.addSubview(timerLabel)
        view.addSubview(timerFrame)
        
        // add in a score label
        scoreLabel = UILabel(frame: CGRect(
            x: self.view.frame.width / 2 - 50,
            y: self.view.frame.height - 100,
            width: 100,
            height: 50
        ))
        scoreLabel.text = String(score)
        scoreLabel.textAlignment = .center
        scoreLabel.textColor = UIColor.black
        scoreLabel.font = scoreLabel.font.withSize(20)
        view.addSubview(scoreLabel)
        
        // picture stuff
        profileImage = UIImageView(frame: CGRect(
            x: view.frame.width / 4,
            y: view.frame.height / 6,
            width: view.frame.width / 2,
            height: view.frame.width / 2)
        )
        profileImage.image = #imageLiteral(resourceName: "aayushtyagi.jpg")
        view.addSubview(profileImage)
        
        for i in 0..<numOptions {
            // button creation
            var newButton = UIButton()
            
            // setting title and positions
            if i == 0 {
                newButton = UIButton(frame: CGRect(
                    x: view.frame.width / 4,
                    y: profileImage.frame.maxY + 25,
                    width: view.frame.width / 2,
                    height: 40))
                
            } else {
                newButton = UIButton(frame: CGRect(
                    x: view.frame.width / 4,
                    y: options[i-1].frame.maxY + 15,
                    width: view.frame.width / 2,
                    height: 40))
            }
            
            newButton.setTitleColor(UIColor.white, for: .normal)
            newButton.layer.cornerRadius = 8
            newButton.backgroundColor = UIColor(red: 23/255, green: 123/255, blue: 156/255, alpha: 0.95)
            newButton.addTarget(self, action: #selector(optionPressed), for: .touchUpInside)
            
            options.append(newButton)
            
            self.view.addSubview(newButton)
        }
        
        // pause screen stuff
        pauseScreen = UIView(frame: CGRect(x:0, y:0, width: view.frame.width, height: view.frame.height))
        //pauseScreen.backgroundColor = UIColor.lightGray
        
        pauseScreen.backgroundColor = UIColor.clear
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pauseScreen.addSubview(blurEffectView)
        view.addSubview(pauseScreen)
        
        view.bringSubview(toFront: controlButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func toggleButton() {
        if controlButton.title(for: .normal) == "Start" {
            controlButton.setTitle("Stop", for: .normal)
            controlButton.backgroundColor = UIColor(red: 209/255, green: 32/255, blue: 0, alpha: 0.95)
            //Remove the pause screen
            UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                    self.pauseScreen.alpha = 0.0
            })
            //pauseScreen.removeFromSuperview()
            //Start the app
            if isStart {
                question = Question()
                updateQuestionScreen()
                isStart = false
            }
            if isTimerRunning == false {
                runQuestionTimer()
            }
            paused = false
        } else {
            controlButton.setTitle("Start", for: .normal)
            controlButton.backgroundColor = UIColor(red: 0, green: 153/255, blue: 51/255, alpha: 0.95)
            //Show the pause screen
            UIView.animate(withDuration: 0.05, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.pauseScreen.alpha = 1.0
            })
            view.bringSubview(toFront: controlButton)
            //Pause timer
            paused = true
        }
    }
    
    func runQuestionTimer() {
        if !isTimerRunning{
            questionTimer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimerLabel)), userInfo: nil, repeats: true)
        }
        isTimerRunning = true

    }
    
    func updateQuestionScreen() {
        profileImage.image = question.personImage
        for i in 0..<options.count {
            options[i].setTitle(question.answerOptions[i], for: .normal)
        }
        correctAnswer = question.correctAnswerIndex
    }
    
    func updateTimerLabel() {
        timerLabel.text = "0:0" + String(time)
        if !paused && time > 0 {
            time -= 1
        }
        else if time <= 0 {
            time = 0
            questionTimer.invalidate()
            isTimerRunning = false
            checkAnswer()
        }
    }
    
    @objc func optionPressed(sender: UIButton) {
        for i in 0..<options.count {
            if options[i].title(for: .normal) == sender.title(for: .normal) {
                chosenAnswer = i
            }
        }
        questionTimer.invalidate()
        isTimerRunning = false
        checkAnswer()
    }
    
    func checkAnswer() {
        if chosenAnswer == correctAnswer {
            score += 1
        }
        
        scoreLabel.text = String(score)
        
        // Set correct answer to green
        // set all other answers to red
        // stay like that for 1 second, and then do all the rest of the stuff
        for i in 0..<options.count {
            if i == correctAnswer {
                options[i].backgroundColor = UIColor(red: 0, green: 153/255, blue: 51/255, alpha: 0.95)
            } else {
                options[i].backgroundColor = UIColor(red: 209/255, green: 32/255, blue: 0, alpha: 0.95)
            }
        }
        
        // delay for 1 second
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            self.time = 5
            self.chosenAnswer = -1
            self.question = Question()
            self.reset()
            self.updateQuestionScreen()
            self.runQuestionTimer()
            self.timerLabel.text = "0:05"
        }
       
    }
    
    func reset() {
        for i in 0..<options.count {
            options[i].backgroundColor = UIColor(red: 23/255, green: 123/255, blue: 156/255, alpha: 0.95)
        }
    }
    
}

