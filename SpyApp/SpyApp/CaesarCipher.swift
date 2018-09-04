//
//  CaesarCipher.swift
//  SpyApp
//
//  Created by Ulises Martinez on 9/4/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

import Foundation

protocol Cipher{
    func encode(_ plaintext: String, secret: String) -> String
    func decrypt(_ plaintext: String, secret: String) -> String
}

struct CaesarCipher: Cipher {
    
    func encode(_ plaintext: String,secret: String) -> String{
        
        var encoded  = ""
        var shitfBy = UInt32(secret)!
        
        for character in plaintext{
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shitfBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String {
        var encoded  = ""
        var shitfBy = UInt32(secret)!
        
        for character in plaintext{
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shitfBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        
        return encoded
    }
}
