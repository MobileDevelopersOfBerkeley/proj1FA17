//
//  GameViewController.swift
//  mdb_miniproject
//
//  Created by Vineeth Yeevani on 9/13/17.
//  Copyright © 2017 Vineeth Yeevani. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    //Label to display score
    var scoreLabel : UILabel!
    
    //Variable to hold the score
    var scoreValue : Int=0
    
    //Button to stop the game
    var stopButton  : UIButton!
    
    //Button to take us to the statistics View
    var toStatistics : UIButton!
    
    //Image of the person
    var triviaImage : UIImageView!
    
    //The left top button
    var tLeftButton  : UIButton!
    
    //The right top button
    var tRightButton  : UIButton!
    
    //The left bottom button
    var bLeftButton  : UIButton!
    
    //The right bottom button
    var bRightButton  : UIButton!
    
    //The variable to hold a random number from 0-43
    var randNumberImage : Int!
    
    //The correct members name
    var correctMemberName : String!
    
    ////Edit the override prepare w bool
    var toStats : Bool!
    
    ////Statistics Variables
    
    //The array that holds the results of the last three questions
    var lastQuestions : [String] = ["Not Answered Yet", "Not Answered Yet", "Not Answered Yet"]
    
    //The longest streak so far
    var longestStreak : Int = 0
    
    //The current streak
    var currentStreak : Int = 0
    
    //Timer
    var timerChange : Timer!
    
    
    //An array that holds the 4 members name
    var memberNameButton : [String]!
    //An Array that holds the 4 members name's Index
    
    //
    
    
    
    let imageArray : [UIImage] = [#imageLiteral(resourceName: "aayushtyagi"), #imageLiteral(resourceName: "abhinavkoppu"), #imageLiteral(resourceName: "adhirajdatar"), #imageLiteral(resourceName: "akkshaykhoslaa"), #imageLiteral(resourceName: "amyshen"), #imageLiteral(resourceName: "aneeshjindal"),#imageLiteral(resourceName: "ashwinvaidyanathan"), #imageLiteral(resourceName: "bengoldberg"), #imageLiteral(resourceName: "borisyue"), #imageLiteral(resourceName: "edwardliu"), #imageLiteral(resourceName: "candiceye"), #imageLiteral(resourceName: "codyhsieh"), #imageLiteral(resourceName: "danielandrews"), #imageLiteral(resourceName: "eliothan"), #imageLiteral(resourceName: "emaanhariri"), #imageLiteral(resourceName: "erickong"), #imageLiteral(resourceName: "jaredgutierrez"), #imageLiteral(resourceName: "jeffreyzhang"), #imageLiteral(resourceName: "jessicachen"), #imageLiteral(resourceName: "julialuo"), #imageLiteral(resourceName: "justinkim"), #imageLiteral(resourceName: "kevinjiang"),#imageLiteral(resourceName: "krishnanrajiyah"), #imageLiteral(resourceName: "kristinho"), #imageLiteral(resourceName: "leonkwak"), #imageLiteral(resourceName: "leviwalsh"), #imageLiteral(resourceName: "mohitkatyal"), #imageLiteral(resourceName: "muditmittal"), #imageLiteral(resourceName: "peterschafhalter"),#imageLiteral(resourceName: "rhadikadhomse"), #imageLiteral(resourceName: "rochelleshen"), #imageLiteral(resourceName: "sahillamba"), #imageLiteral(resourceName: "sarahtang"), #imageLiteral(resourceName: "sayanpaul"), #imageLiteral(resourceName: "shariewang"), #imageLiteral(resourceName: "shivendrakushwah"),#imageLiteral(resourceName: "shreyareddy"), #imageLiteral(resourceName: "shubhamgoenka"), #imageLiteral(resourceName: "sumukhshivakumar"), #imageLiteral(resourceName: "tarunkhasnavis"), #imageLiteral(resourceName: "victorsun"), #imageLiteral(resourceName: "vidyaravikumar"), #imageLiteral(resourceName: "wilburshi"),#imageLiteral(resourceName: "younglin"), #imageLiteral(resourceName: "zachgovani")]
    
    let memberName : [String] = ["Aayush Tyagi", "Abhinav Koppu", "Adhiraj Datar", "Akkshay Khoslaa", "Amy Shen", "Aneesh Jindal", "Ashwin Vaidyanathan", "Ben Goldberg", "Boris Yue", "Edward Liu", "Candice Ye", "Cody Hsieh", "Daniel Andrews", "Eliot Han", "Emaan Hariri", "Eric Kong", "Jared Gutierrez", "Jeffery Zhang", "Jessica Chen", "Julia Luo", "Justin Kim", "Kevin Jiang", "Krishnan Rajiyah", "Kristin Ho", "Leon Kwak", "Levi Walsh", "Mohit Katyal", "Mudit Mittal", "Peter Schafhalter", "Radhika Dhomse", "Rochelle Shen", "Sahil Lamba", "Sarah Tang", "Sayan Paul", "Sharie Wang", "Shiv Kushwah", "Shreya Reddy", "Shubham Goenka", "Sumukh Shivakumar", "Tarun Khasnavis", "Victor Sun", "Vidya Ravikumar", "Wilbur Shi", "Young Lin", "Zach Govani"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
        //Score Label
        scoreLabel = UILabel(frame: CGRect(x: view.frame.width*0.10, y: view.frame.height*0.15, width: view.frame.width*0.5, height: view.frame.height*0.1))
        scoreLabel.text = "Score = \(scoreValue)"
        scoreLabel.textAlignment = .right
        view.addSubview(scoreLabel)
        
        //Stop Button
        stopButton = UIButton(frame: CGRect(x: view.frame.width*0.05, y: view.frame.height*0.07, width: view.frame.width*0.25, height: view.frame.height*0.05))
        stopButton.backgroundColor = UIColor(red:224.0/255.0, green:102.0/255.0, blue:102.0/255.0, alpha:1.0)
        stopButton.layer.cornerRadius = 10
        stopButton.setTitle("Stop", for: .normal)
        stopButton.titleLabel?.font = UIFont(name: "HelveticaNueu-UltraLight", size:20)
        stopButton.addTarget(self, action: #selector(endGame), for: .touchUpInside)
        view.addSubview(stopButton)
        
        //Stastics Button
        toStatistics = UIButton(frame: CGRect(x: view.frame.width*0.60, y: view.frame.height*0.07, width: view.frame.width*0.35, height: view.frame.height*0.05))
        toStatistics.backgroundColor = UIColor(red:201.0/255.0, green:218.0/255.0, blue:248.0/255.0, alpha:1.0)
        toStatistics.setTitle("Statistics", for: .normal)
        toStatistics.layer.cornerRadius = 10
        toStatistics.addTarget(self, action: #selector(stats), for: .touchUpInside)
        view.addSubview(toStatistics)
        startGame()
        
    }
    
    
    //Start the Game
    func startGame() {
        timerChange = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(failButton), userInfo: nil, repeats: false)
        imageMaker()
        buttonMaker()
    }
    
    
    
    //// Segue to the statistics
    
    //Pass the questions to statistics
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(toStats){
            let statsController = segue.destination as! StatisticsViewController
            print(longestStreak)
            statsController.myString = "\(longestStreak)"
            statsController.questionArray = lastQuestions
        }
    }
    
    //Switch to navigation view
    func stats(){
        toStats = true
        self.performSegue(withIdentifier: "toStats", sender: self)
    }
    
    //After a round
    func changeRound(){
        timerChange = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(failButton), userInfo: nil, repeats: false)
        imageMaker()
        randomArrayOfNames()
        setButtonNames()
    }
    
    
    //Ends the Game
    func endGame() {
        toStats = false
        self.performSegue(withIdentifier: "toStart", sender: self)
    }
    
    ////Random Functions
    
    //Creates Random Number for Image picking
    func randomNumImage() -> Int{
        return Int(arc4random_uniform(44))
    }
    
    //Create an array of random names
    func randomArrayOfNames(){
        memberNameButton = []
        memberNameButton.append(correctMemberName)
        var i : Int = 3
        var newRandomNumber : Int!
        while i > 0 {
            newRandomNumber = randomNumImage()
            if(memberNameButton.contains(memberName[newRandomNumber]) == false){
                memberNameButton.append(memberName[newRandomNumber])
                i = i - 1
            }
        }
        
        //Shuffle
        var items : [String] = memberNameButton
        var shuffled : [String] = []
        
        for i in 0..<items.count
        {
            let rand = Int(arc4random_uniform(UInt32(items.count)))
            
            shuffled.append(items[rand])
            
            items.remove(at: rand)
        }
        
        memberNameButton = shuffled
        
        
        
    }
    
    
    
    
    
    
    //Create the Image View along with the random number that the image view generates
    func imageMaker(){
        triviaImage = UIImageView(frame: CGRect(x: view.frame.width * 0.2, y: view.frame.height * 0.25, width: view.frame.width * 0.6, height: view.frame.height * 0.3))
        randNumberImage = randomNumImage()
        correctMemberName = memberName[randNumberImage]
        triviaImage.image = imageArray[randNumberImage]
        view.addSubview(triviaImage)
    }
    
  
    
    
    
    
    
    ////Game Buttons and related functions excluding random picker
    
    
    //Create the Buttons with random values
    func buttonMaker() {
        randomArrayOfNames()
        tLeftButton = UIButton(frame: CGRect(x: view.frame.width*0.05, y: view.frame.height*0.65, width: view.frame.width*0.425, height: view.frame.height*0.1))
        tLeftButton.backgroundColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 100/255)
        tLeftButton.layer.cornerRadius = 8
        tLeftButton.addTarget(self, action: #selector(tLeftButtonFunction), for: .touchUpInside)
        view.addSubview(tLeftButton)
        
        tRightButton = UIButton(frame: CGRect(x: view.frame.width*0.525, y: view.frame.height*0.65, width: view.frame.width*0.425, height: view.frame.height*0.1))
        tRightButton.backgroundColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 100/255)
        tRightButton.layer.cornerRadius = 8
        tRightButton.addTarget(self, action: #selector(tRightButtonFunction), for: .touchUpInside)
        view.addSubview(tRightButton)
        
        bLeftButton = UIButton(frame: CGRect(x: view.frame.width*0.05, y: view.frame.height*0.8, width: view.frame.width*0.425, height: view.frame.height*0.1))
        bLeftButton.backgroundColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 100/255)
        bLeftButton.layer.cornerRadius = 8
        bLeftButton.addTarget(self, action: #selector(bLeftButtonFunction), for: .touchUpInside)
        view.addSubview(bLeftButton)
        
        bRightButton = UIButton(frame: CGRect(x: view.frame.width*0.525, y: view.frame.height*0.8, width: view.frame.width*0.425, height: view.frame.height*0.1))
        bRightButton.backgroundColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 100/255)
        bRightButton.layer.cornerRadius = 8
        bRightButton.addTarget(self, action: #selector(bRightButtonFunction), for: .touchUpInside)
        view.addSubview(bRightButton)
        
        setButtonNames()
    }
    
    //Set button names
    func setButtonNames(){
        tLeftButton.backgroundColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 100/255)
        tRightButton.backgroundColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 100/255)
        bLeftButton.backgroundColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 100/255)
        bRightButton.backgroundColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 100/255)
        tLeftButton.setTitle(memberNameButton[0], for: .normal)
        tRightButton.setTitle(memberNameButton[1], for: .normal)
        bLeftButton.setTitle(memberNameButton[2], for: .normal)
        bRightButton.setTitle(memberNameButton[3], for: .normal)
    }
    
    
    
    //Functions to pass button values to the master button tracker
    
    func failButton(){
        selectButton(buttonString: "", buttonCode : 0)
    }
    
    func tLeftButtonFunction(){
        selectButton(buttonString:tLeftButton.title(for: .normal)!, buttonCode:1)
    }
    
    func tRightButtonFunction(){
        selectButton(buttonString:tRightButton.title(for: .normal)!, buttonCode:2)
    }
    
    func bLeftButtonFunction(){
        selectButton(buttonString:bLeftButton.title(for: .normal)!, buttonCode:3)
    }
    
    func bRightButtonFunction(){
        selectButton(buttonString:bRightButton.title(for: .normal)!, buttonCode:4)
    }
    
    func changeGreen(buttonGreen:Int){
        if(buttonGreen == 1){
            tLeftButton.backgroundColor = UIColor(red:172.0/255.0, green:212.0/255.0, blue:155.0/255.0, alpha:1.0)
        } else if (buttonGreen == 2){
            tRightButton.backgroundColor = UIColor(red:172.0/255.0, green:212.0/255.0, blue:155.0/255.0, alpha:1.0)
        } else if (buttonGreen == 3){
            bLeftButton.backgroundColor = UIColor(red:172.0/255.0, green:212.0/255.0, blue:155.0/255.0, alpha:1.0)
        } else {
            bRightButton.backgroundColor = UIColor(red:172.0/255.0, green:212.0/255.0, blue:155.0/255.0, alpha:1.0)
        }
        var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeRound), userInfo: nil, repeats: false)
    }
    
    func changeRedTimerFail(){
        tLeftButton.backgroundColor = UIColor(red:224.0/255.0, green:102.0/255.0, blue:102.0/255.0, alpha:1.0)
        tRightButton.backgroundColor = UIColor(red:224.0/255.0, green:102.0/255.0, blue:102.0/255.0, alpha:1.0)
        bLeftButton.backgroundColor = UIColor(red:224.0/255.0, green:102.0/255.0, blue:102.0/255.0, alpha:1.0)
        bRightButton.backgroundColor = UIColor(red:224.0/255.0, green:102.0/255.0, blue:102.0/255.0, alpha:1.0)
        var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeRound), userInfo: nil, repeats: false)
    }
    
    func changeRed(buttonRed : Int){
        if(buttonRed == 1){
            tLeftButton.backgroundColor = UIColor(red:224.0/255.0, green:102.0/255.0, blue:102.0/255.0, alpha:1.0)
        } else if (buttonRed == 2){
            tRightButton.backgroundColor = UIColor(red:224.0/255.0, green:102.0/255.0, blue:102.0/255.0, alpha:1.0)
        } else if (buttonRed == 3){
            bLeftButton.backgroundColor = UIColor(red:224.0/255.0, green:102.0/255.0, blue:102.0/255.0, alpha:1.0)
        } else {
            bRightButton.backgroundColor = UIColor(red:224.0/255.0, green:102.0/255.0, blue:102.0/255.0, alpha:1.0)
        }
        var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeRound), userInfo: nil, repeats: false)
    }
    
    
    //Master Button Tracker
    func selectButton(buttonString: String, buttonCode : Int){
        timerChange.invalidate()
        //Correct Answer
        if buttonString == correctMemberName {
            changeGreen(buttonGreen : buttonCode)
            scoreValue = scoreValue + 1
            print(scoreValue)
            scoreLabel.text = "Score = \(scoreValue)"
            print(111111)
            
            
            //Add one to current streak
            currentStreak = currentStreak + 1

            //If currentStreak is bigger than the prior longest streak than replace the prior streak w/ current streak
            if(currentStreak > longestStreak){
                longestStreak = currentStreak
            }
            lastQuestions.append("Correct")
            
        } else if(buttonString == ""){
            changeRedTimerFail()
            //If currentStreak is bigger than the prior longest streak than replace the prior streak w/ current streak
            if(currentStreak > longestStreak){
                longestStreak = currentStreak
            }
            
            //Since current streak was broken edit the currentStreak to 0
            currentStreak = 0
            print(000000)
            lastQuestions.append("Incorrect")
        } else {
            changeRed(buttonRed: buttonCode)
            //If currentStreak is bigger than the prior longest streak than replace the prior streak w/ current streak
            if(currentStreak > longestStreak){
                longestStreak = currentStreak
            }
            
            //Since current streak was broken edit the currentStreak to 0
            currentStreak = 0
            print(000000)
            lastQuestions.append("Incorrect")
        }

        
    }
    
    
    
    @IBAction func unwindToGame(Segue: UIStoryboardSegue) {
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

