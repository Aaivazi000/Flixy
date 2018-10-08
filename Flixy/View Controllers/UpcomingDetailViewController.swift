//
//  UpcomingDetailViewController.swift
//  Flixy
//
//  Created by Andriana Aivazians on 10/7/18.
//  Copyright © 2018 Andriana Aivazians. All rights reserved.
//

import UIKit

class UpcomingDetailViewController: UIViewController {

    //Declaration & UI Element Outlets
    
    @IBOutlet weak var backposterImageView: UIImageView!
    @IBOutlet weak var frontposterImageView: UIImageView!
    @IBOutlet weak var upcomingtitleLabel: UILabel!
    @IBOutlet weak var upcomingdateLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var upcomingoverviewLabel: UILabel!
    var upcomingMovie: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set backbutton color to white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
       //Pass movie data to UI Elements
        if let upcomingMovie = upcomingMovie  {
            upcomingtitleLabel.text = upcomingMovie["title"] as? String
            var voteString = String(describing: upcomingMovie["vote_average"])
            voteString = voteString.replacingOccurrences(of: "Optional", with: "")
            voteString = voteString.replacingOccurrences(of: "(", with: "")
            voteString = voteString.replacingOccurrences(of: ")", with: "")
            voteLabel.text = voteString
            upcomingdateLabel.text = upcomingMovie["release_date"] as? String
            upcomingoverviewLabel.text = upcomingMovie["overview"] as? String
            
            //Get URL's for both UI Images
            let checkposter = upcomingMovie["poster_path"] as? String
            let checkbackposter = upcomingMovie["backdrop_path"] as? String
            if checkposter != nil && checkbackposter != nil {
                let backposterPathString = upcomingMovie["backdrop_path"] as! String
                let frontposterPathString = upcomingMovie["poster_path"] as! String
                let basePathString = "https://image.tmdb.org/t/p/w500"
                let backposterURL = URL(string: basePathString + backposterPathString)!
                let frontposterURL = URL(string: basePathString + frontposterPathString)!
            
                //Set Poster URL's to UI Image Views
                backposterImageView.af_setImage(withURL: backposterURL)
                frontposterImageView.af_setImage(withURL: frontposterURL)
            }
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextcontrolller = segue.destination as! PlayTrailerViewController
        if let upcomingMovie = upcomingMovie {
            let movieid = String(describing: upcomingMovie["id"]!)
            nextcontrolller.movieid = movieid
        }
    }
    
//This bracket closes the class
}
