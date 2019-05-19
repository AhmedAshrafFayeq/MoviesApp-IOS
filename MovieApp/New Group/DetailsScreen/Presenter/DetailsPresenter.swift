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
        
        var moviesCheckList = Array<NSManagedObject>()
        var coreDataObject : CoreDataModel = CoreDataModel()
        moviesCheckList = coreDataObject.fetchUponSpecificID(appDelegate: appDelegate, Id: movie.id!)
        if moviesCheckList.count == 0{
            coreDataObject.favouritesMovie(movie: movie, appDelegate: appDelegate)
            self.detailsDelegate?.alert(title: "Add to favourite", message: "successfully added to the favourite list")
        }
        else{
            detailsDelegate?.showAlert()
            print("repeated")
        }
        
    }
    func unFavourite(movie : Movie ,appDelegate : AppDelegate)  {
    //code
    var coreDataObject : CoreDataModel = CoreDataModel()
    coreDataObject.deleteFromCoreData(movie: movie, appDelegate: appDelegate)
    self.detailsDelegate?.alert(title: "Remove from favourite", message: "successfully removed from the favourite list")
    }
    
    func checkCoreDataMovies(movie : Movie , appDelegate : AppDelegate) -> Bool {
        var moviesCheckList = Array<NSManagedObject>()
        var coreDataObject : CoreDataModel = CoreDataModel()
        moviesCheckList = coreDataObject.fetchUponSpecificID(appDelegate: appDelegate, Id: movie.id!)
        if moviesCheckList.count == 0{
            return true
        }
        return false
    }
    func fetchTrailer(movie : Movie){
        
        let network : NetworkConnection = NetworkConnection()
        network.setDetailsDelegate(delegate: self)
        
        network.fetchTrailersFromNetwork(url: "https://api.themoviedb.org/3/movie/\(movie.id!)/videos?api_key=f544b7896cfc1aaa6f8f288c388ce666")
    }
    
    func fetchReviews(movie : Movie) {
        let network : NetworkConnection = NetworkConnection()
        network.setDetailsDelegate(delegate: self)
        network.fetchReviewsFromNetwork(url: "https://api.themoviedb.org/3/movie/\(movie.id!)/reviews?api_key=f544b7896cfc1aaa6f8f288c388ce666")
        
    }
    
    func getTrailersList(listOfTrailes : Array<Trailer>)  {
        //
        
        detailsDelegate?.getTrailers(listOfTrailers: listOfTrailes)
        //print(listOfMovies.count)
    }
    func getReviewsList(listOfReviews: Array<Reviews>)
    {
        detailsDelegate?.getReviews(listOfReviews: listOfReviews)
    }
    
    func openTrailer(url : String) {
        
    }
    
}
