//
//  MainMenu.swift
//  Match the Members!
//
//  Created by Stephen Jayakar on 9/13/17.
//  Copyright © 2017 Stephen Jayakar. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {
    var startButton: UIButton!
    var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height));
        backgroundImage.image = UIImage(named: "mainMenu.jpg")
        backgroundImage.contentMode = .scaleAspectFill;
        view.addSubview(backgroundImage);
        
        startButton = UIButton(frame: CGRect(x: view.frame.width * 0.3,
                                             y: view.frame.height * 0.7,
                                             width: view.frame.width * 0.4,
                                             height: 60))
        startButton.backgroundColor = UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1.0) /* #ff9900 */
        startButton.layer.cornerRadius = 8
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        view.addSubview(startButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func continueTapped() {
        self.performSegue(withIdentifier: "toGame", sender: self)
    }
}
