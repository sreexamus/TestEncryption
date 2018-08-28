//
//  EncryptUserWifiCredentials.swift
//  TestEncryption
//
//  Created by Sreekanth Iragam Reddy on 5/8/18.
//  Copyright © 2018 Sreekanth Iragam Reddy. All rights reserved.
//

import Foundation
import CryptoSwift
import CommonCrypto

// Encrypt data using AES,RSA algorithms
struct EncryptUserWifiCredentials {

    // Step : 1
    var symmetricKey = [UInt8](repeating: 0, count: kCCKeySizeAES256)

    init() {
     _ = SecRandomCopyBytes(kSecRandomDefault, kCCKeySizeAES256, &symmetricKey)
    }
    let iv = AES.randomIV(kCCKeySizeAES128)


    // Step:  2
    // encrypt data using public key, value WIll be Symetric Key or IV
    // Key = Public key that we will get from cloud
    func encryptUsingRSA(value: Data, key: String) -> String {
        //rsaSignatureMessagePKCS1v15SHA256
        guard let encryptedCFData = SecKeyCreateEncryptedData(key as! SecKey, SecKeyAlgorithm.rsaEncryptionOAEPSHA512, value as CFData, nil) else {
            return ""
        }

        let encryptedData = encryptedCFData as Data

        let base64Encypted = encryptedData.base64EncodedString()

        print("rsa the encrypted data is   \(base64Encypted)")

        let decryptedCFData = SecKeyCreateDecryptedData(key as! SecKey, SecKeyAlgorithm.rsaEncryptionOAEPSHA256, encryptedCFData, nil)

        guard let decryptedData = decryptedCFData as Data? else {
            return ""
        }

        guard let decryptedString = String(data: decryptedData, encoding: String.Encoding.utf8) else {
            print("ECC decrypt could not get string")
            return""
        }
        print("the decrypted string is \(decryptedString)")


        return base64Encypted
    }

    // Step : 3

     //encrypt data using AES algorith with 256bit random key and 128bit IV
    // value : jSON payload combination of ssid and password
    func encryptUsingAES(value: Data) -> String {

        let aes: AES
        let encrypted: [UInt8]
        do {
            //AES(

            
            aes = try AES(key: symmetricKey, blockMode: .CBC(iv: iv), padding: .pkcs7)
            encrypted = try aes.encrypt(value.bytes)
        } catch {
            print("eror")
            return ""
        }

        guard let base64Encypted = encrypted.toBase64() else {
          print("error while converting to base64")
            return ""
        }


        print("aes the encrypted data is   \(base64Encypted)")

        return base64Encypted
    }
}
