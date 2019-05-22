//
//  DetailsViewController_ExtensionDelegate.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/14/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
import UIKit

extension DetailsViewController : DetailsDelegate {
    
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    
    //implement methods of ---HomeDelegate---
    
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Add To Favourite", message: "this movie already added to the favourite list.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    func getTrailers(listOfTrailers: Array<Trailer>) {
        trailersList = listOfTrailers
        
        DispatchQueue.main.async {
            self.trailersTableView?.reloadData()
        }

    }
    func getReviews(listOfReviews: Array<Reviews>) {
        reviewsList = listOfReviews
        DispatchQueue.main.async {
            self.reviewsTableView?.reloadData()
        }
    }
    
    
    
    
    
}
