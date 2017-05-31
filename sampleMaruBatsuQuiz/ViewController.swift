//
//  ViewController.swift
//  sampleMaruBatsuQuiz
//
//  Created by Muneharu Onoue on 2017/05/31.
//  Copyright © 2017年 Muneharu Onoue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quizView: UITextView!
    @IBOutlet weak var resultLabel: UILabel!
    
    let quizzes:[(quiz:String, answer:Bool)] = [
        ("1+1は2である", true),
        ("日本の人口は1億人以下である", false),
        ("テトリス（ゲーム）を開発したのは、日本人である", false),
        ("生きている間は、有名な人であっても広辞苑に載ることはない", true)
    ]
    var no = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        quizView.text = quizzes[no].quiz
        resultLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func maru(_ sender: UIButton) {
        if (quizzes[no].answer) {
            resultLabel.text = "正解"
        } else {
            resultLabel.text = "不正解"
        }
    }

    @IBAction func batsu(_ sender: UIButton) {
        if (!quizzes[no].answer) {
            resultLabel.text = "正解"
        } else {
            resultLabel.text = "不正解"
        }
    }

    @IBAction func next(_ sender: UIButton) {
        no = no + 1
        if quizzes.count <= no {
            no = 0
        }
        quizView.text = quizzes[no].quiz
        resultLabel.text = ""
    }

}

