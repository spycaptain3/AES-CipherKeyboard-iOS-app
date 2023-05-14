//
//  ViewController.swift
//  cipherKeyboard
//
//  Created by Deepak Gupta on 07/04/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func NextButton(_ sender: UIButton) {
                
        let HomepageViewController:UIViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainPageViewController" ) as!
        MainPageViewController
        
//        AnswerViewController.answer = HomeText.text
     //   AnswerViewController.answer = ansstring

        self.navigationController?.pushViewController(HomepageViewController , animated: true)

    }
    
}

