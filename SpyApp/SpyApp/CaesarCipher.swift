//
//  CaesarCipher.swift
//  SpyApp
//
//  Created by Ulises Martinez on 9/4/18.
//  Copyright © 2018 Ulises Martinez. All rights reserved.
//

import Foundation

protocol Cipher{
    //func encode(_ plaintext: String, secret: String) -> String
    func decrypt(_ plaintext: String, secret: String) -> String
}

struct CaesarCipher: Cipher {
    
    func encode(_ plaintext: String,secret: String) -> String?{
        
        /*
        var encoded  = ""
        
        let shitfBy = UInt32(secret)!
        
        for character in plaintext{
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shitfBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        
        return encoded*/
        
        /*
        guard let uniCode = UnicodeScalar(plaintext) else {
            return nil
        }
        switch uniCode {
        case "A" ..< "Z","0" ..< "9":
            return String(UnicodeScalar(uniCode.value + 1)!)
        default:
            return nil
        }*/
        
        let shitfBy = UInt32(secret)!
        
        var encoded = ""
        
        // z to 0
        var endZ = "/"
        var valueZ = 122
        
        // 9 to a
        var end9 = "`"
        var value9 = 57
        
        //var character = 0
        var flag = "Character Not Allowed"
        let UpperCaseletters = UnicodeScalar("A").value ... UnicodeScalar("Z").value
        let letters = UnicodeScalar("a").value ... UnicodeScalar("z").value
        let digits = UnicodeScalar("0").value ... UnicodeScalar("9").value
        
        let string = String(String.UnicodeScalarView(letters.compactMap(UnicodeScalar.init)))
            + String(String.UnicodeScalarView(digits.compactMap(UnicodeScalar.init)))
            +  String(String.UnicodeScalarView(UpperCaseletters.compactMap(UnicodeScalar.init)))
        
        
        for character in plaintext{
                //print(string.contains(character))
                //print(character.unicodeScalars.first!.value)
            let OneisEqual = ( valueZ == character.unicodeScalars.first!.value)
            let TwoisEqual = ( value9 == character.unicodeScalars.first!.value)
            
            //print(OneisEqual)
            
            
            if string.contains(character){
                var unicode = character.unicodeScalars.first!.value
                if OneisEqual{
                    unicode = endZ.unicodeScalars.first!.value
                }else if TwoisEqual{
                    unicode = end9.unicodeScalars.first!.value
                }
                
                let shiftedUnicode = unicode + shitfBy
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }else{
                encoded = flag
                break
            }
        }
        
        
        
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String {
        /*
        var encoded  = ""
        let shitfBy = UInt32(secret)!
        
        for character in plaintext{
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shitfBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        
        return encoded*/
        
        
        let shitfBy = UInt32(secret)!
        
        var encoded = ""
        
        // 0 to z
        var endZ = "{"
        var valueZ = 48
        
        // a to 9
        var enda = ":"
        var valuea = 97
        
        
        //var character = 0
        var flag = "Character Not Allowed"
        let letters = UnicodeScalar("a").value ... UnicodeScalar("z").value
        let digits = UnicodeScalar("0").value ... UnicodeScalar("9").value
        
        let string = String(String.UnicodeScalarView(letters.compactMap(UnicodeScalar.init)))
            + String(String.UnicodeScalarView(digits.compactMap(UnicodeScalar.init)))
        
        
        print(endZ.unicodeScalars.first!.value)
        
        for character in plaintext{
            
            //print(string.contains(character))
            print(character.unicodeScalars.first!.value)
            let OneisEqual = ( valueZ == character.unicodeScalars.first!.value)
            let TwoisEqual = ( valuea == character.unicodeScalars.first!.value)
            
            print(OneisEqual)
            
            
            if string.contains(character){
                var unicode = character.unicodeScalars.first!.value
                if OneisEqual{
                    unicode = endZ.unicodeScalars.first!.value
                }else if TwoisEqual{
                    unicode = enda.unicodeScalars.first!.value
                }
                
                let shiftedUnicode = unicode - shitfBy
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }else{
                encoded = flag
                break
            }
        }
        
        
        
        return encoded
    }
}
