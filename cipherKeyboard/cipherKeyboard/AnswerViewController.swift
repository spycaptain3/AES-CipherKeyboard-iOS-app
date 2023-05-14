//
//  AnswerViewController.swift
//  cipherKeyboard
//
//  Created by Deepak Gupta on 07/04/23.
//

import UIKit
import AVFoundation

class AnswerViewController: UIViewController {
    
    
    @IBOutlet weak var AnswerText: UITextView!
  //  @IBOutlet weak var AnswerText: UILabel!
    var answer:String! = nil

        
    override func viewDidLoad() {
        super.viewDidLoad()
//       answer = "hello kyse hai aap"
        AnswerText.text = answer
        
        print(AnswerText.text!)
    


        // Do any additional setup after loading the view.
    }
    
    func spo(){
            let utterance = AVSpeechUtterance(string: AnswerText.text)
        
            utterance.rate = 0.5
        utterance.pitchMultiplier = 2
            utterance.postUtteranceDelay = 2
        utterance.volume = 2
            
            let voice = AVSpeechSynthesisVoice(language: "en-GB")
            
            utterance.voice = voice
            
            let synthesizer = AVSpeechSynthesizer()

            // Tell the synthesizer to speak the utterance.
        
            synthesizer.speak(utterance)
        }

    @IBAction func textSpeak(_ sender: UIButton) {
        spo()
              sender.alpha = 0.5

                //Code should execute after 0.2 second delay.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    //Bring's sender's opacity back up to fully opaque.
                    sender.alpha = 1.0
                    
          }
    }
    
    
    @IBAction func InstallKeyboardButton(_ sender: Any) {
        
        
    }
    
    
    @IBAction func AboutCipherKeyboardButton(_ sender: Any) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
