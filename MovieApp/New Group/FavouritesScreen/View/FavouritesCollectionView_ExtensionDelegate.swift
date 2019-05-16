//
//  FavouritesCollectionView_ExtensionDelegate.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/15/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
import CoreData
extension FavouritesCollectionViewController : FavouritesDelegate {
    
    //implement methods of ---FavouritesDelegate---
    
    func setMovies(listOfMovies: Array<NSManagedObject>) {
        movies = listOfMovies
        self.collectionView?.reloadData()
    }
    
    
    
    
    
    
    
    
}
