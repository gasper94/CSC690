//
//  CipherFactory.swift
//  SpyApp
//
//  Created by Ulises Martinez on 9/1/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

import Foundation
struct CipherFactory{
    
    private var cipher: [String: Cipher] = [
        "cesar": CaesarCipher()
    ]
    
    func cipher(for key: String) -> Cipher{
        return cipher[key]!
        
    }
}
