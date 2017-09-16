import UIKit

class EndViewController: UIViewController {
    
    let darkBlue: UIColor = UIColor(red:0.20, green:0.35, blue:0.52, alpha:1.0)
    let lightBlue: UIColor = UIColor(red:0.38, green:0.59, blue:0.83, alpha:1.0)
    let darkGrayBlue: UIColor = UIColor(red:0.19, green:0.24, blue:0.44, alpha:1.0)
    
    var goodByeLabel: UILabel!
    var thanksLabel: UILabel!
    var playAgain: UIButton!
    
    override func viewDidLoad() {
        
        view.backgroundColor = darkGrayBlue
        
        goodByeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.8));
        goodByeLabel.text = "Goodbye —";
        goodByeLabel.textColor = UIColor.white;
        goodByeLabel.textAlignment = .center;
        goodByeLabel.font = UIFont(name: goodByeLabel.font.fontName, size: 30);
        view.addSubview(goodByeLabel);
        
        thanksLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.9))
        thanksLabel.text = "and thanks for playing!"
        thanksLabel.textColor = UIColor.white
        thanksLabel.textAlignment = .center
        thanksLabel.font = UIFont(name: thanksLabel.font.fontName, size: 20)
        view.addSubview(thanksLabel)
        
        playAgain = UIButton(frame: CGRect(x: view.frame.width * 0.15, y: view.frame.height * 0.5, width: view.frame.width * 0.7, height: 50))
        playAgain.setTitle("Play again?", for: .normal)
        playAgain.setTitleColor(UIColor.white, for: .normal)
        playAgain.layer.borderWidth = 1
        playAgain.layer.borderColor = UIColor.white.cgColor
        playAgain.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.addSubview(playAgain)
    }
    
    func goBack() {
        playAgain.backgroundColor = lightBlue
        self.performSegue(withIdentifier: "playAgain", sender: self)
    }
}
