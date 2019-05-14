//
//  NetworkConnection.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/13/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
import Alamofire

class NetworkConnection{
    init() {
        

    }
    func fetchMostPopular(url : String)
    {
        Alamofire.request(url).responseJSON { (response) in
            print(response)
            if let json = response.result.value{
                print(json)
            }
        }
    }
}
