//
//  HomePresenter.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/14/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
class HomePresenter{
    
    var homeDelegate : HomeDelegate?
    
    init() {
        
    }
    func setDelegate(delegate : HomeDelegate)
    {
        self.homeDelegate = delegate
    }
    
    //func of presenter
    
    func sendURLToNetwork(){
        let network : NetworkConnection = NetworkConnection()
        network.setDelegate(delegate: self)
        
        network.fetchMostPopular(url: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=e65304c9167bce2469081f4f8948ed36")
    }
    func getMovieList(listOfMovies : Array<Movie>)  {
        //
       homeDelegate?.getMovies(listOfMovies: listOfMovies)
        //print(listOfMovies.count)
    }
    
    
}
