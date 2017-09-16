//
//  GameVC.swift
//  Match the Members!
//
//  Created by Stephen Jayakar on 9/13/17.
//  Copyright © 2017 Stephen Jayakar. All rights reserved.
//
import UIKit

var game: Game! = nil

class GameVC: UIViewController {
    // current image
    var memberImage: UIImageView!
    // four buttons
    var answer1: UIButton!
    var answer2: UIButton!
    var answer3: UIButton!
    var answer4: UIButton!
    // stats button
    var statsButton: UIButton!
    
    override func viewDidLoad() {
        let VFW = view.frame.width
        let VFH = view.frame.height
        let ANSWIDTH = VFW * 0.38
        let ANSHEIGHT = VFH * 0.09
        // The stats button
        statsButton = UIButton(frame: CGRect(x: VFW * 0.6,
                                             y: 40,
                                             width: VFW * 0.3,
                                             height: 30))
        
        // The image of the member; for now hardcoded to Krishnan
        memberImage = UIImageView(frame: CGRect(x: VFW * 0.5,
                                                y: VFH * 0.4,
                                                width: VFW * 0.8,
                                                height: VFH * 0.4))
        memberImage.center = CGPoint(x: VFW * 0.5,
                                     y: VFH * 0.4)
        memberImage.contentMode = .scaleAspectFit
        view.addSubview(memberImage)
        
        // Create the four answer buttons
        answer1 = UIButton(frame: CGRect(x: VFW * 0.1,
                                         y: VFH * 0.7,
                                         width: ANSWIDTH,
                                         height: ANSHEIGHT))
        answer3 = UIButton(frame: CGRect(x: VFW * 0.1,
                                         y: VFH * 0.85,
                                         width: ANSWIDTH,
                                         height: ANSHEIGHT))
        answer2 = UIButton(frame: CGRect(x: VFW * 0.9 - ANSWIDTH,
                                         y: VFH * 0.7,
                                         width: ANSWIDTH,
                                         height: ANSHEIGHT))
        answer4 = UIButton(frame: CGRect(x: VFW * 0.9 - ANSWIDTH,
                                         y: VFH * 0.85,
                                         width: ANSWIDTH,
                                         height: ANSHEIGHT))
        ansButtonHelper(answer1)
        ansButtonHelper(answer2)
        ansButtonHelper(answer3)
        ansButtonHelper(answer4)
        
        if game == nil {
            game = Game(vc: self)
        }
        game.run(vc: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func continueTapped() {
        self.performSegue(withIdentifier: "toStats", sender: self)
    }
    
    func ansButtonHelper(_ b: UIButton) {
        b.backgroundColor = UIColor(hue: 0.6639, saturation: 0.23, brightness: 1, alpha: 1.0) /* #c4c5ff */
        b.layer.cornerRadius = 8
        b.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(b)
    }
}
