//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/14/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var voteCountTXt: UILabel!
    @IBOutlet weak var originalLangTxt: UILabel!
    @IBOutlet weak var releaseDateTxt: UILabel!
    @IBOutlet weak var originalTitleTxt: UILabel!
    @IBOutlet weak var overViewTxt: UILabel!
    @IBOutlet weak var voteAverageTxt: UILabel!
    @IBOutlet weak var titleTxt: UILabel!
    @IBAction func favouriteBtn(_ sender: UIButton) {
        
        detailsPresenter.addToFavourite(movie: movie, appDelegate : appDelegate)
        
    }
    
    var movie = Movie()
    
    var detailsPresenter : DeatailsPresenter = DeatailsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w185" + movie.posterPath!), placeholderImage: UIImage(named: "cr1.jpg"))
        
        voteCountTXt.text = String (movie.voteCount!)
        //voteCountTXt.text = (movie.voteCount as! String)
        originalTitleTxt.text = movie.originalTitle
        releaseDateTxt.text = movie.releaseDate
        originalLangTxt.text = movie.originalLanguage
        titleTxt.text = movie.title
        overViewTxt.text = movie.overview
        voteAverageTxt.text = String (movie.voteAverage!)
        voteAverageTxt.text?.append("/10")
        self.detailsPresenter.setDelegate(delegate: self)
        //print(movie.originalTitle)

        // Do any additional setup after loading the view.
    }
    func setMovie(movie : Movie) {
        self.movie = movie
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
