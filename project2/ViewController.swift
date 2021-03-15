//
//  ViewController.swift
//  project2
//
//  Created by mac on 2021/3/15.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        countries.append("estonia")
//        countries.append("france")
//        countries.append("germany")
//        countries.append("ireland")
//        countries.append("italy")
//        countries.append("monaco")
//        countries.append("nigeria")
//        countries.append("poland")
//        countries.append("spain")
//        countries.append("uk")
//        countries.append("us")
        
        countries += ["estonia","france", "germany", "ireland", "italy", "monaco", "nigeria",  "poland", "spain", "uk", "us" ]
        
        
        //避免白色國旗與背景混為一體看不清 加上border
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        //讓邊界的黑線變灰色
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        

        
        
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) { //加上= nil可以不用寫在呼叫內 比較方便
        //shuffle為swift內建api
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]),for: .normal)
        button2.setImage(UIImage(named: countries[1]),for: .normal)
        button3.setImage(UIImage(named: countries[2]),for: .normal)
        
        //title大寫
        title = countries[correctAnswer].uppercased()

    }

    
    //加上 按鈕event
   
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "wrong"
            score -= 1
        }
        //alert window設置
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        //放action在 alert上面
        ac.addAction(UIAlertAction(title: "Continue", style: .default,
                                   handler: askQuestion))
        
        present(ac, animated: true)
        
        
    }
    
}

