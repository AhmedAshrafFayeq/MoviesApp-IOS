//
//  FavouritesPresenter.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/15/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
import CoreData

class FavouritesPresenter{
    //
    
    var favouritesDelegate : FavouritesDelegate?
    
    init() {
        
    }
    func setDelegate(delegate : FavouritesDelegate)
    {
        self.favouritesDelegate = delegate
    }
    
    func fetchFavouritesMovies(appDelegate : AppDelegate) {
        //
        var movies = Array<NSManagedObject>()
        var coreDataObject : CoreDataModel = CoreDataModel()
        movies = coreDataObject.fetchFromCoreData(appDelegate: appDelegate)
        
        favouritesDelegate?.setMovies(listOfMovies: movies)
    }
    func unfavourite(movie : Movie , appDelegate : AppDelegate)  {
        var coreDataObject : CoreDataModel = CoreDataModel()
        coreDataObject.deleteFromCoreData(movie: movie, appDelegate: appDelegate)
    }
    
    
}
