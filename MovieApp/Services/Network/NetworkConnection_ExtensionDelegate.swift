//
//  NetworkConnection_ExtensionDelegate.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/14/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation

extension NetworkConnection : NetworkDelegate
{
    //implementation of Network Delegate
    
    func errorMessage(message: String) {
        print(message)
    }
}
