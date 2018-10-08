//
//  TrailersViewController.swift
//  Flixy
//
//  Created by Andriana Aivazians on 10/6/18.
//  Copyright © 2018 Andriana Aivazians. All rights reserved.
//

import UIKit

class TrailersViewController: UIViewController, UICollectionViewDataSource {

    //Declarations & UI Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        fetchUpcomingMovies()
        
    }
    
    //UICollectionViewDataSource Required Methods
    //Defines number of cells in CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    //Defines what goes into each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        
        //Get movie poster info for the cell
        if let posterPathString = movie["poster_path"] as? String {
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let posterPathURL = URL(string: baseURLString + posterPathString)!
            cell.posterImageView.af_setImage(withURL: posterPathURL)
        }
        return cell
    }
    
    //Function to get movies
    func fetchUpcomingMovies() {
        
        
        // Make Network Request for Upcoming Movies
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US&page=1&region=US")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        // The reloadIgnoringLocalCacheData means everytime the request is done the app will pull data from the MD API even when it has data stored in Cache.
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            //This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies
                self.collectionView.reloadData()
                //Stop the Refreshing After Data is loaded
                //self.refreshControl.endRefreshing()
            }
            
            //End KRPrgress
            //KRProgressHUD.dismiss()
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell) {
            let upcomingMovie = movies[indexPath.item]
            let upcomingdetailViewController = segue.destination as! UpcomingDetailViewController
            upcomingdetailViewController.upcomingMovie = upcomingMovie
        }
    }
    

//The bracket below closes out the class
}
