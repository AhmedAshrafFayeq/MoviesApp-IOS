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
    
    func fetchHighestRated(){
        let network : NetworkConnection = NetworkConnection()
        network.setDelegate(delegate: self)
        
        network.fetchMoviesFromNetwork(url: "https://api.themoviedb.org/3/discover/movie?sort_by=top_rated.desc&api_key=f544b7896cfc1aaa6f8f288c388ce666")
    }
    
    func fetchMostPopular(){
        let network : NetworkConnection = NetworkConnection()
        network.setDelegate(delegate: self)
        
        network.fetchMoviesFromNetwork(url: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=e65304c9167bce2469081f4f8948ed36")
    }
    func getMovieList(listOfMovies : Array<Movie>)  {
        //
       homeDelegate?.getMovies(listOfMovies: listOfMovies)
        //print(listOfMovies.count)
    }
    func sendHighestRatedURLToNetwork() {
        let network : NetworkConnection = NetworkConnection()
        network.setDelegate(delegate: self)
        
    }
    
    
}
