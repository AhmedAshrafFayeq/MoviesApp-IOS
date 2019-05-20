//
//  SplashViewController.swift
//  MovieApp
//
//  Created by JETS Mobil Lab -  on 5/20/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var imgSplash: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3) {
            self.performSegue(withIdentifier: "splash", sender: nil)
            
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2, animations: {
            self.movieTitleLabel.frame.origin.y -= 130
        }, completion: nil)
        
        UIView.animate(withDuration: 2, animations: {
            self.imgSplash.frame.origin.y += 220
        }, completion: nil)
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
