import UIKit

class GameViewController: UIViewController {
    
    let darkBlue: UIColor = UIColor(red:0.20, green:0.35, blue:0.52, alpha:1.0)
    let lightBlue: UIColor = UIColor(red:0.38, green:0.59, blue:0.83, alpha:1.0)
    let lightGray: UIColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
    let darkGrayBlue: UIColor = UIColor(red:0.19, green:0.24, blue:0.44, alpha:1.0)
    
    var score: Int = 0
    var scoreLabel: UILabel!
    
    var promptLabel: UILabel!
    var stopButton: UIButton!
    
    var randomTuple: (UIImage, String, Int)!
    var memberImage: UIImageView!
    var memberName: String!
    var memberNumber: Int!
    var correctNumber: Int!
    
    var choiceArr: [UIButton]!
    var choiceOne: UIButton!
    var choiceTwo: UIButton!
    var choiceThree: UIButton!
    var choiceFour: UIButton!
    
    var imageArr: [UIImage]!
    var nameArr: [String]!
    
    
    
    override func viewDidLoad() {
        
        view.backgroundColor = lightGray
        setUpArrays()
        
        promptLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.3))
        promptLabel.text = "Which member is this?"
        promptLabel.textColor = darkBlue
        promptLabel.textAlignment = .center
        promptLabel.font = UIFont(name: promptLabel.font.fontName, size: 30)
        view.addSubview(promptLabel)
        
        stopButton = UIButton(frame: CGRect(x: view.frame.width * 0.275, y: view.frame.height * 0.8, width: view.frame.width * 0.45, height: 50))
        stopButton.setTitle("STOP", for: .normal)
        stopButton.setTitleColor(darkGrayBlue, for: .normal)
        stopButton.layer.borderWidth = 1
        stopButton.layer.borderColor = darkGrayBlue.cgColor
        stopButton.addTarget(self, action: #selector(endGame), for: .touchUpInside)
        view.addSubview(stopButton)
        
        scoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.4))
        scoreLabel.text = "YOUR SCORE: \(score)"
        scoreLabel.textAlignment = .center
        scoreLabel.textColor = darkGrayBlue
        scoreLabel.font = UIFont(name: scoreLabel.font.fontName, size: 20)
        view.addSubview(scoreLabel)
    
        memberImage = UIImageView(frame: CGRect(x: view.frame.width * 0.375, y: view.frame.height * 0.25, width: view.frame.width * 0.25, height: view.frame.height * 0.25))
        view.addSubview(memberImage)
        
        choiceOne = UIButton(frame: CGRect(x: view.frame.width * 0.275, y: view.frame.height * 0.53, width: view.frame.width * 0.45, height: view.frame.height * 0.05))
        choiceTwo = UIButton(frame: CGRect(x: view.frame.width * 0.275, y: view.frame.height * 0.59, width: view.frame.width * 0.45, height: view.frame.height * 0.05))
        choiceThree = UIButton(frame: CGRect(x: view.frame.width * 0.275, y: view.frame.height * 0.65, width: view.frame.width * 0.45, height: view.frame.height * 0.05))
        choiceFour  = UIButton(frame: CGRect(x: view.frame.width * 0.275, y: view.frame.height * 0.71, width: view.frame.width * 0.45, height: view.frame.height * 0.05))
        choiceArr = [choiceOne, choiceTwo, choiceThree, choiceFour]
        for i in 0 ..< 4 {
            let choice: UIButton = choiceArr[i]
            choice.setTitleColor(UIColor.white, for: .normal)
            choice.titleLabel?.font = UIFont(name: scoreLabel.font.fontName, size: 12)
            choice.backgroundColor = lightBlue
            choice.layer.cornerRadius = 8
            choice.tag = i
            view.addSubview(choice)
        }
        
        startGame()
        
    }

    func displayAnswers() {
        for choice in choiceArr {
            if choice.tag == correctNumber {
                choice.backgroundColor = UIColor.green
            } else {
                choice.backgroundColor = UIColor.red
            }
        }
        startGame()
    }
    
    func startGame() {
        displayMember()
        var  displayAnswerTimer = Timer.scheduledTimer(
            timeInterval: 5,
            target: self,
            selector: (#selector(displayAnswers)),
            userInfo: nil,
            repeats: false)
//        displayAnswerTimer.invalidate()
//        startGame()

        
    }
    
    func validateAnswer(sender: UIButton!) {
        let delayAnswerTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(displayAnswers)), userInfo: nil, repeats: false)
    
        if sender.tag == self.correctNumber {
            score += 1
            scoreLabel.text = "YOUR SCORE: \(score)"
        }
        
    }
    

    func displayMember() {
        randomTuple = getImage()
        
        memberImage.image = randomTuple.0
        memberImage.contentMode = .scaleAspectFill
        
        memberName = randomTuple.1
        memberNumber = randomTuple.2
        
        populateChoices()
    }
    
    /* creates a dictionary choiceNames to keep track of final buttons: memberNames
       creates usedNumbers to keep track of which memberNumbers have been used
       randomly picks a number from 0..3 to assign correctName to a button
       puts the correctName into the dictionary, with the appropriate key
       finds 3 other random choices, unduplicated, and also add them into dict
     */
    func populateChoices() {
        var choiceNames = [Int: String]()
        var usedImgNumbers = [Int]()
        
        correctNumber = Int(arc4random_uniform(UInt32(4)))
        choiceNames[correctNumber] = memberName
        usedImgNumbers.append(memberNumber)
        
        var randomNumber: Int!
        let imgRange: UInt32 = UInt32(imageArr.count)
        
        for i in 0...3 {
            if choiceNames[i] == nil {
                randomNumber = Int(arc4random_uniform(imgRange))
                while usedImgNumbers.contains(randomNumber) {
                    randomNumber = Int(arc4random_uniform(imgRange))
                }
                choiceNames[i] = nameArr[randomNumber]
                usedImgNumbers.append(randomNumber)
            }
        }
        
        for (i, name) in choiceNames {
            let choice = choiceArr[i]
            choice.setTitle(name, for: .normal)
            choice.removeTarget(nil, action: nil, for: .allEvents)
            if i == correctNumber {
                choice.addTarget(self, action: #selector(validateAnswer(sender:)), for: .touchUpInside)
            } else {
                choice.addTarget(self, action: #selector(validateAnswer(sender:)), for: .touchUpInside)
            }
            choice.backgroundColor = lightBlue
        }
    }
    
    func getImage() -> (UIImage, String, Int) {
        let imgRange: UInt32 = UInt32(imageArr.count)
        let randomNumber = Int(arc4random_uniform(imgRange))
        let randomImage: UIImage = imageArr[randomNumber]
        let randomName: String = nameArr[randomNumber]
        print(randomName)
        return (randomImage, randomName,randomNumber)
    }
    
    func setUpArrays()  {
        imageArr = [#imageLiteral(resourceName: "aayushtyagi"), #imageLiteral(resourceName: "abhinavkoppu"), #imageLiteral(resourceName: "adhirajdatar"), #imageLiteral(resourceName: "akkshaykhoslaa"), #imageLiteral(resourceName: "amyshen"), #imageLiteral(resourceName: "aneeshjindal"), #imageLiteral(resourceName: "ashwinvaidyanathan"), #imageLiteral(resourceName: "bengoldberg"), #imageLiteral(resourceName: "billylu"), #imageLiteral(resourceName: "borisyue"), #imageLiteral(resourceName: "candiceye"), #imageLiteral(resourceName: "codyhsieh"), #imageLiteral(resourceName: "danielandrews"), #imageLiteral(resourceName: "edwardliu"), #imageLiteral(resourceName: "eliothan"), #imageLiteral(resourceName: "emaanhariri"), #imageLiteral(resourceName: "erickong"), #imageLiteral(resourceName: "jaredgutierrez"), #imageLiteral(resourceName: "jeffreyzhang"), #imageLiteral(resourceName: "jessicachen"), #imageLiteral(resourceName: "julialuo"), #imageLiteral(resourceName: "justinkim"), #imageLiteral(resourceName: "kevinjiang"), #imageLiteral(resourceName: "krishnanrajiyah"), #imageLiteral(resourceName: "kristinho"), #imageLiteral(resourceName: "leonkwak"), #imageLiteral(resourceName: "leviwalsh"), #imageLiteral(resourceName: "mohitkatyal"), #imageLiteral(resourceName: "muditmittal"), #imageLiteral(resourceName: "peterschafhalter"), #imageLiteral(resourceName: "radhikadhomse"), #imageLiteral(resourceName: "rochelleshen"), #imageLiteral(resourceName: "sahillamba"), #imageLiteral(resourceName: "sarahtang"), #imageLiteral(resourceName: "sayanpaul"), #imageLiteral(resourceName: "shariewang"), #imageLiteral(resourceName: "shivkushwah"), #imageLiteral(resourceName: "shreyareddy"),#imageLiteral(resourceName: "shubhamgoenka"), #imageLiteral(resourceName: "sumukhshivakumar"), #imageLiteral(resourceName: "tarunkhasnavis"), #imageLiteral(resourceName: "victorsun"), #imageLiteral(resourceName: "vidyaravikumar"), #imageLiteral(resourceName: "wilburshi"), #imageLiteral(resourceName: "younglin"), #imageLiteral(resourceName: "zachgovani")]
        
        nameArr = ["Aayush Tyagi", "Abhinav Koppu", "Adhiraj Datar", "Akkshay Khoslaa", "Amy Shen", "Aneesh Jindal", "Ashwin Vaidyanathan", "Ben Goldberg", "Billy Lu", "Boris Yue", "Candice Ye", "Cody Hsieh", "Daniel Andrews", "Edward Liu", "Eliot Han", "Emaan Hariri", "Eric Kong", "Jared Gutierrez", "Jeffrey Zhang", "Jessica Chen", "Julia Luo", "Justin Kim", "Kevin Jiang", "Krishnan Rajiyah", "Kristin Ho", "Leon Kwak", "Levi Walsh", "Mohit Katyal", "Mudit Mittal", "Peter Schafhalter", "Radhika Dhomse", "Rochelle Shen", "Sahil Lamba", "Sarah Tang", "Sayan Paul", "Sharie Wang", "Shiv Kushwah", "Shreya Reddy", "Shubham Goenka", "Sumukh Shivakumar", "Tarun Khasnavis", "Victor Sun", "Vidya Ravikumar", "Wilbur Shi", "Young Lin", "Zach Govani"];
    }
    
    func endGame() {
        stopButton.backgroundColor = lightBlue
        self.performSegue(withIdentifier: "toEnd", sender: self)
    }
}


