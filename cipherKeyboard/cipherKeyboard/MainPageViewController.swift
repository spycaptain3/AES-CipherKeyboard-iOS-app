//
//  MainPageViewController.swift
//  cipherKeyboard
//
//  Created by Deepak Gupta on 07/04/23.
//

import UIKit
import CryptoKit
import Foundation
import CryptoSwift
import SwiftUI




class MainPageViewController: UIViewController {
    
    @IBOutlet weak var HomeText: UITextView!
    @IBOutlet weak var HomeKey: UITextField!
    
    
    
    
    @IBAction func EncryptTextButton(_ sender: Any) {
        
        
         

        let testString = HomeText.text
        var ansstring:String = " "
        var givekey = HomeKey.text! + "1234567890"


//   used to encrypt the string (HomeText.text) with the key (givekey)
        if let aes = try? AES(key: givekey, iv: "abdefdsrfjdirogf"),
           let aesE = try? aes.encrypt(Array(testString!.utf8)) {
        //    print("AES encrypted: \(aesE)")
            
            // Code to convert string from (HomeText.text) to [UInt8] data type.
            
           var i:Int=0
            while(i<=(aesE.count-1))
            {
                var j:Int = Int(aesE[i])
                ansstring.append(String(j))
                ansstring.append(",")
                i=i+1;
            }
            
            
          //  print(ansstring)
            
            
//            let aesD = try? aes.decrypt(aesE)
//            let decrypted = String(bytes: aesD!, encoding: .utf8)
//            print("AES decrypted: \(decrypted)")
        }
        
        
        // To switch the UIViewController and pass the Cipher value to the textView.
        let AnswerViewController:AnswerViewController = self.storyboard?.instantiateViewController(withIdentifier: "AnswerViewController" ) as!
        AnswerViewController
        
//        AnswerViewController.answer = HomeText.text
        AnswerViewController.answer = ansstring

        self.navigationController?.pushViewController(AnswerViewController , animated: true)
    }
    
    
    
    
    @IBAction func DecryptTextButton(_ sender: Any) {
        
        
        let testString = "Well, the way they make shows is, they make one show"
        let giveKey = HomeKey.text! + "1234567890"
        let string = HomeText.text
        
        if let aes = try? AES(key: giveKey, iv: "abdefdsrfjdirogf"),
            let aesE = try? aes.encrypt(Array(testString.utf8)) {
            
            // To convert String HomeText.text to [UInt8] array.
            let array: [UInt8] = string!.split(separator: ",").compactMap { UInt8($0) }
        //    print(array) // [1, 2, 3, 4, 5]


            // Code to Decrypt the array [UInt8] array.
            let aesD = try? aes.decrypt(array)
            let decrypted = String(bytes: aesD!, encoding: .utf8)
          //  print("AES decrypted: \(decrypted)")
            
            
            //For Screen switch and animation and Pass the value to the another UIViewController.
            let AnswerViewController:AnswerViewController = self.storyboard?.instantiateViewController(withIdentifier: "AnswerViewController" ) as!
            AnswerViewController
            
            AnswerViewController.answer = decrypted
            
            self.navigationController?.pushViewController(AnswerViewController , animated: true)
            
        }
        
    }
    
    
    
    
    
    
    
    @IBAction func GotoInstallPage(_ sender: Any) {
        
        performSegue(withIdentifier: "gotoInstall", sender: self)
    }
    
    
    
    
    
    
    
    
    @IBAction func GotoAboutCipher(_ sender: Any) {
        performSegue(withIdentifier: "gotoAboutCipher", sender: self)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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





