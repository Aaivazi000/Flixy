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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        
        //Load Movie data into UI Elements
        if let movie = movie  {
            movieTitleLabel.text = movie["title"] as? String
            releaseDateLabel.text = movie["release_date"] as? String
            descriptionLabel.text = movie["overview"] as? String
            
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
