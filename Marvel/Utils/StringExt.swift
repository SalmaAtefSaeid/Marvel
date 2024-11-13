//
//  StringExt.swift
//  Marvel
//
//  Created by Salma Atef on 11/11/2024.
//

import Foundation
import CryptoKit

extension String {
    
    func md5() -> String {
        let digest = Insecure.MD5.hash(data: Data(self.utf8))
        
        return digest.compactMap {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
