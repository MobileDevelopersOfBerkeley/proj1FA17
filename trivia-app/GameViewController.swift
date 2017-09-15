import UIKit

class GameViewController: UIViewController {
    
    let darkBlue: UIColor = UIColor(red:0.20, green:0.35, blue:0.52, alpha:1.0)
    let lightBlue: UIColor = UIColor(red:0.38, green:0.59, blue:0.83, alpha:1.0)
    let lightGray: UIColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
    var darkGrayBlue: UIColor = UIColor(red:0.19, green:0.24, blue:0.44, alpha:1.0)
    
    var score: Int!
    var scoreLabel: UILabel!
    
    var promptLabel: UILabel!
    
    var randomPair: (UIImage, String)!
    var memberImage: UIImageView!
    var memberName: String!
    
    var choiceArr: [UIButton]!
    var choiceOne: UIButton!
    var choiceTwo: UIButton!
    var choiceThree: UIButton!
    var choiceFour: UIButton!
    var correctChoice: UIButton!
    
    var imageArr: [UIImage]!
    var nameArr: [String]!
    
    override func viewDidLoad() {
        
        view.backgroundColor = lightGray
        setUpArrays()
        score = 0
        
        promptLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.5))
        promptLabel.text = "Which member is this?"
        promptLabel.textColor = darkBlue
        promptLabel.textAlignment = .center
        promptLabel.font = UIFont(name: promptLabel.font.fontName, size: 30)
        view.addSubview(promptLabel)
        
        
        scoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.6))
        scoreLabel.text = "YOUR SCORE: \(score!)"
        scoreLabel.textAlignment = .center
        scoreLabel.textColor = darkGrayBlue
        scoreLabel.font = UIFont(name: scoreLabel.font.fontName, size: 20)
        view.addSubview(scoreLabel)
        
        randomPair = getImage()
        memberImage.image = randomPair.0
        memberName = randomPair.1
        
        memberImage.contentMode = .scaleAspectFill
        memberImage = UIImageView(frame: CGRect(x: view.frame.width * 0.375, y: view.frame.height * 0.35, width: view.frame.width * 0.25, height: view.frame.height * 0.25))
        view.addSubview(memberImage)
        
        initializeChoices()
        
    }
    
    func initializeChoices() {
        choiceOne = UIButton(frame: CGRect(x: view.frame.width * 0.15, y: view.frame.height * 0.6, width: view.frame.width * 0.7, height: 50))
        choiceTwo = UIButton(frame: CGRect(x: view.frame.width * 0.15, y: view.frame.height * 0.65, width: view.frame.width * 0.7, height: 50))
        choiceThree = UIButton(frame: CGRect(x: view.frame.width * 0.15, y: view.frame.height * 0.70, width: view.frame.width * 0.7, height: 50))
        choiceFour  = UIButton(frame: CGRect(x: view.frame.width * 0.15, y: view.frame.height * 0.75, width: view.frame.width * 0.7, height: 50))
        
        choiceArr = [choiceOne, choiceTwo, choiceThree, choiceFour]

        for i in 0...3 {
            let choice = choiceArr[i]
            choice.setTitleColor(darkBlue, for: .normal)
            view.addSubview(choice)
        }
    }
    
    func populateChoices() {
        var usedNames: [Int: String]!
        
        let imgRange: UInt32 = UInt32(4)
        let correctNumber = Int(arc4random_uniform(imgRange))
        usedNames[correctNumber] = memberName
        
        var randomNumber: Int!
        for i in 0...3 {
            if usedNames[i] != nil {
                randomNumber = Int(arc4random_uniform(imgRange))
                usedNames[i]
                
            }
        }
        
        
    }
    
    func getImage() -> (UIImage, String) {
        let imgRange: UInt32 = UInt32(imageArr.count)
        let randomNumber = Int(arc4random_uniform(imgRange))
        let randomImage: UIImage = imageArr[randomNumber]
        let randomName: String = nameArr[randomNumber]
        return (randomImage, randomName)
    }
    
    func setUpArrays()  {
        imageArr = [#imageLiteral(resourceName: "aayushtyagi"), #imageLiteral(resourceName: "abhinavkoppu"), #imageLiteral(resourceName: "adhirajdatar"), #imageLiteral(resourceName: "akkshaykhoslaa"), #imageLiteral(resourceName: "amyshen"), #imageLiteral(resourceName: "aneeshjindal"), #imageLiteral(resourceName: "ashwinvaidyanathan"), #imageLiteral(resourceName: "bengoldberg"), #imageLiteral(resourceName: "billylu"), #imageLiteral(resourceName: "borisyue"), #imageLiteral(resourceName: "candiceye"), #imageLiteral(resourceName: "codyhsieh"), #imageLiteral(resourceName: "danielandrews"), #imageLiteral(resourceName: "edwardliu"), #imageLiteral(resourceName: "eliothan"), #imageLiteral(resourceName: "emaanhariri"), #imageLiteral(resourceName: "erickong"), #imageLiteral(resourceName: "jaredgutierrez"), #imageLiteral(resourceName: "jeffreyzhang"), #imageLiteral(resourceName: "jessicachen"), #imageLiteral(resourceName: "julialuo"), #imageLiteral(resourceName: "justinkim"), #imageLiteral(resourceName: "kevinjiang"), #imageLiteral(resourceName: "krishnanrajiyah"), #imageLiteral(resourceName: "kristinho"), #imageLiteral(resourceName: "leonkwak"), #imageLiteral(resourceName: "leviwalsh"), #imageLiteral(resourceName: "mohitkatyal"), #imageLiteral(resourceName: "muditmittal"), #imageLiteral(resourceName: "peterschafhalter"), #imageLiteral(resourceName: "radhikadhomse"), #imageLiteral(resourceName: "rochelleshen"), #imageLiteral(resourceName: "sahillamba"), #imageLiteral(resourceName: "sarahtang"), #imageLiteral(resourceName: "sayanpaul"), #imageLiteral(resourceName: "shariewang"), #imageLiteral(resourceName: "shivkushwah"), #imageLiteral(resourceName: "shreyareddy"), #imageLiteral(resourceName: "sumukhshivakumar"), #imageLiteral(resourceName: "tarunkhasnavis"), #imageLiteral(resourceName: "victorsun"), #imageLiteral(resourceName: "wilburshi"), #imageLiteral(resourceName: "younglin"), #imageLiteral(resourceName: "zachgovani")]
        
        nameArr = ["Aayush Tyagi", "Abhinav Koppu", "Adhiraj Datar", "Akkshay Khoslaa", "Amy Shen", "Aneesh Jindal", "Ashwin Vaidyanathan", "Ben Goldberg", "Billy Lu", "Boris Yue", "Edward Liu", "Candice Ye", "Cody Hsieh", "Daniel Andrews", "Eliot Han", "Emaan Hariri", "Eric Kong", "Jared Gutierrez", "Jeffrey Zhang", "Jessica Chen", "Julia Luo", "Justin Kim", "Kevin Jiang", "Krishnan Rajiyah", "Kristin Ho", "Leon Kwak", "Levi Walsh", "Mohit Katyal", "Mudit Mittal", "Peter Schafhalter", "Radhika Dhomse", "Rochelle Shen", "Sahil Lamba", "Sarah Tang", "Sayan Paul", "Sharie Wang", "Shiv Kushwah", "Shreya Reddy", "Shubham Goenka", "Sumukh Shivakumar", "Tarun Khasnavis", "Victor Sun", "Vidya Ravikumar", "Wilbur Shi", "Young Lin", "Zach Govani"];

        }
    }
