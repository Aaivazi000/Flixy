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
        let posterPathString = movie["poster_path"] as! String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterPathURL = URL(fileURLWithPath: baseURLString + posterPathString)
        cell.posterImageView.af_setImage(withURL: posterPathURL)
        
        return cell
    }
    
    //Function to get movies
    func fetchNowPlayingMovies() {
        
        //Check for Network Connection
        /*if ConnectionCheck.isConnectedToNetwork() == false {
            present(alertController, animated: true)
        }
        */
        //Show KRProgress
        /*KRProgressHUD
            .set(style: .custom(background: .white, text: .white, icon: nil))
            .set(maskType: .white)
            .show()
        */
        
        // Make Network Request for Now Playing Movies
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//The bracket below closes out the class
}
