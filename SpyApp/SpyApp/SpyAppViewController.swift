//
//  ViewController.swift
//  SpyApp
//
//  Created by Ulises Martinez on 9/1/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

import UIKit

class SpyAppViewController:
    UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!
    
    //let factory = CipherFactory()
    let cipher = CaesarCipher()
    
    @IBAction func encodedButtonPressed(_ sender: UIButton) {
        let plaintext = input.text!
        let secret = self.secret.text!
        output.text = cipher.encode(plaintext, secret: secret)
    }
    
    @IBAction func print(_ sender: UIButton) {
        let plaintext = input.text!
        let secret = self.secret.text!
        output.text = cipher.decrypt(plaintext, secret: secret)
    }
    
    
    
    
//    @IBAction func cipherButtonPressed(_ sender: UIButton) {
//        let key = sender.titleLabel!.text!
//        cipher = factory.cipher(for: key)
// }
}

