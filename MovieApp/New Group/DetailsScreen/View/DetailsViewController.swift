//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/14/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import SDWebImage
import CoreData

class DetailsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var trailersList : Array<Trailer> = []
    var reviewsList : Array<Reviews> = []
    
    var flag : Bool?
    
    @IBOutlet weak var reviewsTableView: UITableView!
    @IBOutlet weak var trailersTableView: UITableView!
    @IBOutlet weak var img: UIImageView!
//    @IBOutlet weak var voteCountTXt: UILabel!
//    @IBOutlet weak var originalLangTxt: UILabel!
    @IBOutlet weak var releaseDateTxt: UILabel!
    @IBOutlet weak var originalTitleTxt: UILabel!
    @IBOutlet weak var overViewTxt: UILabel!
    @IBOutlet weak var voteAverageTxt: UILabel!
   // @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    
    @IBAction func favouriteBtn(_ sender: UIButton) {
        if flag == true{
            detailsPresenter.addToFavourite(movie: movie, appDelegate : appDelegate)
            sender.setTitle("🖤", for: .normal)
            //♥️
            flag = false
        }
        else{
            detailsPresenter.unFavourite(movie: movie, appDelegate: appDelegate)
            sender.setTitle("♡", for: .normal)
            
            flag = true
        }
        
    }
    
    var movie = Movie()
    
    var detailsPresenter : DeatailsPresenter = DeatailsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w185" + movie.posterPath!), placeholderImage: UIImage(named: "placeholder.png"))
        
        //voteCountTXt.text = String (movie.voteCount!)
        //voteCountTXt.text = (movie.voteCount as! String)
        originalTitleTxt.text = movie.originalTitle
        releaseDateTxt.text = movie.releaseDate
       // originalLangTxt.text = movie.originalLanguage
        //titleTxt.text = movie.title
        overViewTxt.text = movie.overview
        voteAverageTxt.text = String (movie.voteAverage!)
        voteAverageTxt.text?.append("/10")
        self.detailsPresenter.setDelegate(delegate: self)
        //print(movie.originalTitle)
        
        trailersTableView.delegate = self
        trailersTableView.dataSource = self
        
        reviewsTableView.delegate = self
        reviewsTableView.dataSource = self
        

        
        // Do any additional setup after loading the view.
    }
    func setMovie(movie : Movie) {
        self.movie = movie
        detailsPresenter.fetchTrailer(movie: movie)
        
        
        detailsPresenter.fetchReviews(movie: movie)
        
        
        //trailersList.count
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //setMovie(movie: movie)
        

        flag = self.detailsPresenter.checkCoreDataMovies(movie: movie, appDelegate: appDelegate)
        
        if flag! {
            favBtn.setTitle("♡", for: .normal)
        
        }
        else{
            favBtn.setTitle("🖤", for: .normal)
        }
        
//        detailsPresenter.fetchTrailer()
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //     -----------methods of table view---------------
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case trailersTableView:

            return trailersList.count
        case reviewsTableView:

            return reviewsList.count
        default:
            break
        }
        return reviewsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell()
        
        switch tableView {
        case trailersTableView:
            let trailerCell = tableView.dequeueReusableCell(withIdentifier: "trailerCell", for: indexPath) as! TrailersTableViewCell
            
            trailerCell.trailerLabel.text = trailersList[indexPath.row].name
            return trailerCell
            
        case reviewsTableView:
            let reviewsCell = tableView.dequeueReusableCell(withIdentifier: "reviewsCell", for: indexPath) as! ReviewsTableViewCell
            
            
            reviewsCell.authorLabel.text = reviewsList[indexPath.row].author!
            reviewsCell.contentLabel.text = reviewsList[indexPath.row].content!
            return reviewsCell
            
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case trailersTableView:
            
            return 70
            
        case reviewsTableView:
            
            return heightForEachView(text: reviewsList[indexPath.row].content! , width: self.view.frame.width-10)
            
        default:
            break
        }
        return 70
    }
    
    func heightForEachView(text : String , width : CGFloat) -> CGFloat{
        let label : UILabel = UILabel(frame : CGRect(origin: CGPoint(x: 0 , y:0), size: CGSize(width: width , height: CGFloat.greatestFiniteMagnitude)))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //detailsPresenter.openTrailer(url: trailersList[indexPath.row].key!)
        
        switch tableView {
        case trailersTableView:
            let youtubeId = trailersList[indexPath.row].key!
            let url = URL(string:"http://www.youtube.com/watch?v=\(youtubeId)")!
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        case reviewsTableView:
            //--------
            
            break
        default:
            break
        }
        
        
    
        
        //print(trailersList[indexPath.row].key!)
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        switch tableView {
//        case trailersTableView:
//            return "Trailers"
//        case reviewsTableView:
//            //--------
//            return "Reviews"
//            break
//        default:
//            break
//        }
//        return ""
//    }
    
}
