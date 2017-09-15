import UIKit

class ViewController: UIViewController {
    
    let darkBlue: UIColor = UIColor(red:0.20, green:0.35, blue:0.52, alpha:1.0)
    let lightBlue: UIColor = UIColor(red:0.38, green:0.59, blue:0.83, alpha:1.0)
    
    var startButton: UIButton!
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = lightBlue
        
        startButton = UIButton(frame: CGRect(x: view.frame.width * 0.15, y: view.frame.height * 0.53, width: view.frame.width * 0.7, height: 50))
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        view.addSubview(startButton)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.8))
        titleLabel.text = "MDB TRIVIA"
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 50)
        view.addSubview(titleLabel)
        
        subtitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.94))
        subtitleLabel.text = "test your knowledge."
        subtitleLabel.textColor = UIColor.white
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont(name: titleLabel.font.fontName, size: 20)
        view.addSubview(subtitleLabel)

    }
    
    func startGame() {
        startButton.backgroundColor = darkBlue
        self.performSegue(withIdentifier: "toGame", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

