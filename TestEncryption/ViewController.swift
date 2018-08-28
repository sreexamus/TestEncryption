//
//  ViewController.swift
//  TestEncryption
//
//  Created by Sreekanth Iragam Reddy on 5/8/18.
//  Copyright © 2018 Sreekanth Iragam Reddy. All rights reserved.
//

import UIKit
import CryptoSwift
import CommonCrypto

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.


        
    }


//    func encryptUsingAES() -> String {
//
//
        let payloadObject = ["iv" : "",
                                "key" : "",
                                "payLoad": ""
        ]
//
//        guard let payloadData = try? JSONSerialization.data(withJSONObject: payloadObject) else {
//            return ""
//        }
//
//      var randomKey = [UInt8](repeating: 0, count: kCCKeySizeAES256)
//
//     _ = SecRandomCopyBytes(kSecRandomDefault, kCCKeySizeAES256, &randomKey)
//
//
//
//        var aes: AES
//        var encrypted: [UInt8]
//        var iv = AES.randomIV(128)
//        do {
//            aes = try AES(key: randomKey, blockMode: .CBC(iv: iv), padding: .pkcs7)
//            encrypted = try aes.encrypt(payloadData.bytes)
//        } catch {
//            print("eror")
//            return ""
//        }
//
//        guard let base64Encypted = encrypted.toBase64() else {
//            print("error while converting to base64")
//            return ""
//        }
//
//        return base64Encypted
//
//
//
//
//
//    }

}

