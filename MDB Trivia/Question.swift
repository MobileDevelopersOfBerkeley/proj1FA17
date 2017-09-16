//
//  Question.swift
//  MDB Trivia
//
//  Created by Carol Wang on 9/15/17.
//  Copyright © 2017 MDB. All rights reserved.
//

//TODO: Add a used name array to keep track of people that have bben screened already

import Foundation
import UIKit

public class Question {
    var answerOptions: [String]!     // 4 options for the names of people
    var correctAnswerIndex: Int!     // the index of the correct answer in answerOptions
    var personImage: UIImage!        // the image that the screen is showing
    
    // all names of people being accessed
    static var nameArray : [String] = ["Aayush Tyagi", "Abhinav Koppu", "Adhiraj Datar", "Akkshay Khoslaa", "Amy Shen", "Aneesh Jindal", "Ashwin Vaidyanathan", "Ben Goldberg", "Billy Lu", "Boris Yue", "Edward Liu", "Candice Ye", "Cody Hsieh", "Daniel Andrews", "Eliot Han", "Emaan Hariri", "Eric Kong", "Jared Gutierrez", "Jeffrey Zhang", "Jessica Chen", "Julia Luo", "Justin Kim", "Kevin Jiang", "Krishnan Rajiyah", "Kristin Ho", "Leon Kwak", "Levi Walsh", "Mohit Katyal", "Mudit Mittal", "Peter Schafhalter", "Radhika Dhomse", "Rochelle Shen", "Sahil Lamba", "Sarah Tang", "Sayan Paul", "Sharie Wang", "Shiv Kushwah", "Shreya Reddy", "Shubham Goenka", "Sumukh Shivakumar", "Tarun Khasnavis", "Victor Sun", "Vidya Ravikumar", "Wilbur Shi", "Young Lin", "Zach Govani"]
    
    // initializer block
    init(){
        generateQuestion()
    }
    
    // loads an image based on the correct index
    // make sure you call generateQuestion first or will cause error
    func loadImage(){
        var imageName = Question.nameArray[correctAnswerIndex].replacingOccurrences(of: " ", with:"").lowercased() + ".jpg"
        if UIImage(named: imageName) == nil {
            imageName = Question.nameArray[correctAnswerIndex].replacingOccurrences(of: " ", with:"").lowercased() + ".png"
        }
        personImage = UIImage(named: imageName)
    }
    
    // sets values for correctAnswerIndex and answerOptions
    func generateQuestion(){
        var generatedIndices : [Int] = []
        correctAnswerIndex = Int(arc4random_uniform(UInt32(Question.nameArray.count)))
        generatedIndices.append(correctAnswerIndex)
        loadImage()
        
        while generatedIndices.count < 4 {
            let random = Int(arc4random_uniform(UInt32(Question.nameArray.count)))
            if !generatedIndices.contains(random) {
                generatedIndices.append(random)
            }
        }
        generatedIndices = generatedIndices.sorted()
        answerOptions = generatedIndices.map {Question.nameArray[$0]}
        
        correctAnswerIndex = generatedIndices.index(of: correctAnswerIndex)
    
    }
    
}
