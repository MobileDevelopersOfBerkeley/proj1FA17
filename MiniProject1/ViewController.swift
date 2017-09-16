//
//  ViewController.swift
//  mdb_miniproject
//
//  Created by Vineeth Yeevani on 9/13/17.
//  Copyright © 2017 Vineeth Yeevani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var startButton : UIButton!
    var backgroundImage : UIImageView!
    var blurryBackground : UILabel!
    var logo : UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        backgroundImage.image = #imageLiteral(resourceName: "background")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.layer.opacity = 0.7
        view.addSubview(backgroundImage)
        
        blurryBackground = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        blurryBackground.layer.opacity = 0.8
        view.addSubview(blurryBackground)
        
        logo = UIImageView(frame: CGRect(x: view.frame.width*0.15, y: view.frame.height*0.06, width: view.frame.width*0.65, height: view.frame.height*0.20))
        logo.image = #imageLiteral(resourceName: "mdb_logo")
        view.addSubview(logo)
        
        startButton = UIButton(frame: CGRect(x: view.frame.width*0.25, y: view.frame.height*0.8, width: view.frame.width*0.5, height: view.frame.height*0.1))
        startButton.backgroundColor = UIColor(red: 67.0/255.0, green: 130.0/255.0, blue: 232.0/255.0, alpha: 1.0)
        startButton.layer.cornerRadius = 8
        startButton.setTitle("Start", for: .normal)
        startButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        view.addSubview(startButton)
    }
    
    func startGame() {
        self.performSegue(withIdentifier: "runGame", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
