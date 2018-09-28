//
//  NowPlayingViewController.swift
//  Flixy
//
//  Created by Andriana Aivazians on 9/27/18.
//  Copyright © 2018 Andriana Aivazians. All rights reserved.
//

import UIKit
import AlamofireImage
import KRProgressHUD
import SystemConfiguration

class NowPlayingViewController: UIViewController, UITableViewDataSource {

    //Declarations
    @IBOutlet weak var tableView: UITableView!
    var movies: [[String: Any]] = []
    var refreshControl: UIRefreshControl!
    let alertController = UIAlertController(title: "Cannot Get Movies", message: "Please check your network connection", preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: "Try Again", style: .cancel) { (action) in
    }
    
    
    //Function run when view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        alertController.addAction(cancelAction)
        
        //Handling Now Playing tableView
        tableView.dataSource = self
        tableView.rowHeight = 134
        
        //Refresh Control Setup
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.yellow
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        //Get Now Playing Movies
        fetchNowPlayingMovies()
        
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        fetchNowPlayingMovies()
    }
    
    func fetchNowPlayingMovies() {
        
        //Check for Network Connection
        if ConnectionCheck.isConnectedToNetwork() == false {
            present(alertController, animated: true)
        }
        
        //Show KRProgress
        KRProgressHUD
            .set(style: .custom(background: .white, text: .white, icon: nil))
            .set(maskType: .white)
            .show()
        
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
                self.tableView.reloadData()
                //Stop the Refreshing After Data is loaded
                self.refreshControl.endRefreshing()
            }
        
            //End KRPrgress
            KRProgressHUD.dismiss()
        }
        task.resume()
    }
    
    
    //TableView Handling
    //Sets the number of rows in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    
    //Sets what goes into each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        // Assign data from network request into variables
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        
        //Move data from variables into cell
        cell.titleLabel.text = title
        cell.overviewLabel.text = overview
        
        //Move image into cells
            //Set up URL to images
            let posterPathString = movie["poster_path"] as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURLString + posterPathString)!
            //Set image to the UI elements in Cell
            cell.posterImageView.af_setImage(withURL: posterURL)
        return cell
    }
    
    
    
//this bracket below closes the class
}
