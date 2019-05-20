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
    var trailers = [Trailer] ()
    var reviews = [Reviews] ()
    
    var arrayResult = [[String:AnyObject]]()
    var trailersArrayResult = [[String:AnyObject]]()
    var reviewsArrayResult = [[String:AnyObject]]()
    var homePresenter : HomePresenter?
    var detailsPresenter : DeatailsPresenter?
    func setDelegate (delegate : HomePresenter){
        self.homePresenter = delegate
    }
    func setDetailsDelegate (delegate : DeatailsPresenter){
        self.detailsPresenter = delegate
    }
    init() {
        

    }
    
    func fetchReviewsFromNetwork(url : String) {
        print(url)
        Alamofire.request(url).responseJSON { (response) in
            if((response.result.value) != nil)
            {

                let jsonData = JSON(response.result.value!)
                if let resultData = jsonData["results"].arrayObject
                {

                    self.reviewsArrayResult = resultData as! [[String:AnyObject]]
                    for index in 0..<self.reviewsArrayResult.count{
                        print(index)
                        let arrayDictionary = self.reviewsArrayResult[index]
                        let review = Reviews()
                        review.author = arrayDictionary["author"] as! String
                        review.content = arrayDictionary["content"] as! String
                        review.id = arrayDictionary ["id"] as! String
                        review.url = arrayDictionary["url"] as! String
                        
                        //print(review)
                        self.reviews.append(review)
                    }
                    if self.reviews.count != 0{
                        // self.homePresenter?.getMovieList(listOfMovies: self.movies)
                        
                        self.detailsPresenter?.getReviewsList(listOfReviews: self.reviews)
                    }
                }
            }
        }
    }
    
    
    
    func fetchTrailersFromNetwork(url : String) {
        Alamofire.request(url).responseJSON { (response) in
            if((response.result.value) != nil)
            {
                let jsonData = JSON(response.result.value!)
                if let resultData = jsonData["results"].arrayObject
                {
                    self.trailersArrayResult = resultData as! [[String:AnyObject]]
                    for index in 0..<self.trailersArrayResult.count{
                        let arrayDictionary = self.trailersArrayResult[index]
                        let trailer = Trailer()
                        trailer.id = arrayDictionary["id"] as! String
                        trailer.iso31661 = arrayDictionary["iso_3166_1"] as! String
                        trailer.iso6391 = arrayDictionary["iso_639_1"] as! String
                        trailer.key = arrayDictionary["key"] as! String
                        trailer.name = arrayDictionary["name"] as! String
                        trailer.site = arrayDictionary["site"] as! String
                        trailer.size = arrayDictionary["size"] as! Int
                        trailer.type = arrayDictionary["type"] as! String
                        
                        //print(trailer)
                        self.trailers.append(trailer)
                    }
                    if self.trailers.count != 0{
                       // self.homePresenter?.getMovieList(listOfMovies: self.movies)
                        self.detailsPresenter?.getTrailersList(listOfTrailes: self.trailers)
                    }
                }
            }
        }
    }

    func fetchMoviesFromNetwork(url : String)
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
                        if arrayDictionary["poster_path"] as? String != nil
                        {
                            movie.posterPath = arrayDictionary["poster_path"] as! String
                        }                        
                        movie.originalLanguage = arrayDictionary["original_language"] as! String
                        movie.originalTitle = arrayDictionary["original_title"] as! String
                        movie.genre_ids = arrayDictionary["genre_ids"] as! Array<Int>
                        if arrayDictionary["backdrop_path"] as? String != nil
                        {
                            movie.backdropPath = arrayDictionary["backdrop_path"] as! String
                        }
                        
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
