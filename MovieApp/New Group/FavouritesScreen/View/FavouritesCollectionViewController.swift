//
//  FavouritesCollectionViewController.swift
//  MoviesApp
//
//  Created by JETS Mobil Lab -  on 5/12/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import CoreData
private let reuseIdentifier = "favouritesCell"

class FavouritesCollectionViewController: UICollectionViewController {

    var detailsVC : DetailsViewController?
    var favouritesPresenter : FavouritesPresenter = FavouritesPresenter()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var movies = Array<NSManagedObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favouritesPresenter.setDelegate(delegate: self)
        self.collectionView?.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favouritesPresenter.fetchFavouritesMovies(appDelegate: appDelegate)
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FavouritesCollectionViewCell
    
        // Configure the cell
        let path : String = self.movies[indexPath.row].value(forKey: "posterPath") as! String
        cell.img.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w185" + path), placeholderImage: UIImage(named: "cr1.jpg"))
//        cell.textLabel?.text = movies[indexPath.row].value(forKey: "title") as! String
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        detailsVC = segue.destination as? DetailsViewController
        // secondVC.movie = moviesList[(self.collectionView.indexPathForSelectedRow?.row)!]
        
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var currentMovie = Movie()
        currentMovie.adult=movies[indexPath.row].value(forKey: "adult") as! Bool
        currentMovie.backdropPath=movies[indexPath.row].value(forKey: "backdropPath")
            as! String
        currentMovie.id=movies[indexPath.row].value(forKey: "id") as! Int
        currentMovie.originalLanguage=movies[indexPath.row].value(forKey: "originalLang") as! String
        currentMovie.originalTitle=movies[indexPath.row].value(forKey: "originalTitle") as! String
        currentMovie.overview=movies[indexPath.row].value(forKey: "overview") as! String
        currentMovie.popularity=movies[indexPath.row].value(forKey: "popularity") as! Double
        currentMovie.posterPath=movies[indexPath.row].value(forKey: "posterPath") as! String
        currentMovie.releaseDate=movies[indexPath.row].value(forKey: "releaseDate") as! String
        currentMovie.title=movies[indexPath.row].value(forKey: "title") as! String
        currentMovie.video=movies[indexPath.row].value(forKey: "video") as! Bool
        currentMovie.voteAverage=movies[indexPath.row].value(forKey: "voteAverage") as! Double
        currentMovie.voteCount=movies[indexPath.row].value(forKey: "voteCount") as! Int
        currentMovie.genre_ids=movies[indexPath.row].value(forKey: "genre") as! Array<Int>

        detailsVC!.setMovie(movie: currentMovie)
        
    }
    
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
