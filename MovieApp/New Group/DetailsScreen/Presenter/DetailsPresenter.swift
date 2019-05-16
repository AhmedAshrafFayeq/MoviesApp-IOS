//
//  DetailsPresenter.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/14/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
import CoreData

class DeatailsPresenter{
    //
    
    var detailsDelegate : DetailsDelegate?
    var movies = Array<NSManagedObject>()
    
    
    init() {
        
    }
    func setDelegate(delegate : DetailsDelegate)
    {
        self.detailsDelegate = delegate
    }

    
    func addToFavourite(movie : Movie ,appDelegate : AppDelegate)  {
        //code
        var coreDataObject : CoreDataModel = CoreDataModel()
        coreDataObject.favouritesMovie(movie: movie, appDelegate: appDelegate)
        
    }
    func unFavourite(movie : Movie ,appDelegate : AppDelegate)  {
    //code
    var coreDataObject : CoreDataModel = CoreDataModel()
    coreDataObject.deleteFromCoreData(movie: movie, appDelegate: appDelegate)
    
    }
    
    
}
