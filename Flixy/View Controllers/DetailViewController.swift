//
//  DetailViewController.swift
//  Flixy
//
//  Created by Andriana Aivazians on 10/5/18.
//  Copyright © 2018 Andriana Aivazians. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //Declarations & Outlets
    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var movie: [String: Any]?
    @IBOutlet weak var voteavgLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        
        //Load Movie data into UI Elements
        if let movie = movie  {
            movieTitleLabel.text = movie["title"] as? String
            releaseDateLabel.text = movie["release_date"] as? String
            descriptionLabel.text = movie["overview"] as? String
            var voteavgString = String(describing: movie["vote_average"])
            voteavgString = voteavgString.replacingOccurrences(of: "Optional", with: "")
            voteavgString = voteavgString.replacingOccurrences(of: "(", with: "")
            voteavgString = voteavgString.replacingOccurrences(of: ")", with: "")
            voteavgLabel.text = voteavgString
            
            //Get URLs for backdrop image & poster image
            let backDropPathString = movie["backdrop_path"] as! String
            let posterPathString = movie["poster_path"] as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            //Make URL for backdrop & set to UI element
            let backdropURL = URL(string: baseURLString + backDropPathString)!
            backDropImageView.af_setImage(withURL: backdropURL)
            
            //Make URL for poster & set to UI element
            let posterURL = URL(string: baseURLString + posterPathString)!
            posterImageView.af_setImage(withURL: posterURL)
        }
    //This closes out viewDidLoad
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as!NowPlayingTrailerViewController
        if let movie = movie {
            let npmovieid = String(describing: movie["id"]!)
            nextViewController.npMovieId = npmovieid
        }
    }

    
//This closes out the class
}
