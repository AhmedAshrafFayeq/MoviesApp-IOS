//
//  DetailsProtocol.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/14/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation

protocol DetailsDelegate{
    
    func showAlert()
    func alert(title : String , message : String)
    func getTrailers(listOfTrailers: Array<Trailer>)
    func getReviews(listOfReviews: Array<Reviews>)
}
