//
//  NetworkConnection.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/13/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SDWebImage

class NetworkConnection{
    var movies = [Movie] ()
    var arrayResult = [[String:AnyObject]]()
    
    var homePresenter : HomePresenter?
    
    func setDelegate (delegate : HomePresenter){
        self.homePresenter = delegate
    }
    
    init() {
        

    }
    func fetchMostPopular(url : String)
    {
        Alamofire.request(url).responseJSON { (response) in
            if((response.result.value) != nil)
            {
                let jsonData = JSON(response.result.value!)
                if let resultData = jsonData["results"].arrayObject
                {
                    self.arrayResult = resultData as! [[String:AnyObject]]
                    for index in 0..<self.arrayResult.count{
                        let arrayDictionary = self.arrayResult[index]
                        let movie = Movie()
                        movie.voteCount = arrayDictionary["vote_count"] as! Int
                        movie.id = arrayDictionary["id"] as! Int
                        movie.video = arrayDictionary["video"] as! Bool
                        movie.voteAverage = arrayDictionary["vote_average"] as! Double
                        movie.title = arrayDictionary["title"] as! String
                        movie.popularity = arrayDictionary["popularity"] as! Double
                        movie.posterPath = arrayDictionary["poster_path"] as! String
                        movie.originalLanguage = arrayDictionary["original_language"] as! String
                        movie.originalTitle = arrayDictionary["original_title"] as! String
                        movie.genre_ids = arrayDictionary["genre_ids"] as! Array<Int>
                        movie.backdropPath = arrayDictionary["backdrop_path"] as! String
                        movie.adult = arrayDictionary["adult"] as! Bool
                        movie.overview = arrayDictionary["overview"] as! String
                        movie.releaseDate = arrayDictionary["release_date"] as! String
                        
                        self.movies.append(movie)
                        
                        //print(movie.posterPath)
                        
                        
                    }
                    if self.movies.count != 0{
                        self.homePresenter?.getMovieList(listOfMovies: self.movies)
                }
                else{
                    
                }
            }
            else{
                
            }
            
        }
        
        
        }
    
    }

    
    
    
}
