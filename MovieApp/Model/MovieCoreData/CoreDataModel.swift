//
//  CoreDataModel.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/14/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation
import CoreData

class CoreDataModel : CoreDataDelegate{
    //
    var coreDataDelegate : CoreDataDelegate?
    var movies = Array<NSManagedObject>()
    
    init() {
        
    }
    func setDelegate(delegate : CoreDataDelegate)
    {
        self.coreDataDelegate = delegate
    }
    func favouritesMovie(movie : Movie , appDelegate : AppDelegate){
        //
        let managerContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "MovieEntity", in: managerContext)
        let movie1 = NSManagedObject (entity: entity!, insertInto: managerContext)
        
        movie1.setValue(movie.title, forKey: "title")
        movie1.setValue(movie.voteCount, forKey: "voteCount")
        movie1.setValue(movie.adult , forKey: "adult")
        movie1.setValue(movie.id, forKey: "id")
        movie1.setValue(movie.video, forKey: "video")
        movie1.setValue(movie.voteAverage, forKey: "voteAverage")
        movie1.setValue(movie.popularity, forKey: "popularity")
        movie1.setValue(movie.posterPath, forKey: "posterPath")
        movie1.setValue(movie.originalTitle, forKey: "originalTitle")
        movie1.setValue(movie.originalLanguage, forKey: "originalLang")
        movie1.setValue(movie.backdropPath, forKey: "backdropPath")
        movie1.setValue(movie.overview, forKey: "overview")
        movie1.setValue(movie.releaseDate, forKey: "releaseDate")
        movie1.setValue(movie.genre_ids, forKey: "genre")
        
        //var genre_ids : Array<Int>?
 
        do{
            try managerContext.save()
            
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
       // self.movies.append(movie1)

    }
    func fetchFromCoreData( appDelegate : AppDelegate) -> Array<NSManagedObject> {
        //
        let managerContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"MovieEntity")
        
        do{
            movies = try managerContext.fetch(fetchRequest)
        }catch{
            print("error")
        }
        return movies
    }
    
    func deleteFromCoreData(movie : Movie , appDelegate : AppDelegate) {
        let managerContext = appDelegate.persistentContainer.viewContext
        for movieItem in 0..<movies.count
        {
            if movies[movieItem].value(forKey: "title") as! String ==  movie.title
            {
                managerContext.delete(movies[movieItem])
                movies.remove(at: movieItem)
                do{
                    try managerContext.save()
                }catch let error as NSError{
                    print(error)
                }
            }
        }
        
    }
}
