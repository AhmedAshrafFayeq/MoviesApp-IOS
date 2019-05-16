//
//  HomeViewController_ExtensionDelegate.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/14/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation

extension HomeCollectionViewController : HomeDelegate {

    func getMovies(listOfMovies: Array<Movie>) {
        print(listOfMovies.count)

        moviesList = listOfMovies
        
        self.collectionView?.reloadData()
        //print(self.moviesList.count)
        
        //print(movies.count)
    }
    
    
    //implement methods of ---HomeDelegate---
    
    
    
}
