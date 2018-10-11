//
//  NowPlayingTrailerViewController.swift
//  Flixy
//
//  Created by Andriana Aivazians on 10/10/18.
//  Copyright © 2018 Andriana Aivazians. All rights reserved.
//

import UIKit

class NowPlayingTrailerViewController: UIViewController {

    var npMovieId: String?
    var npTrailer: [String] = []
    @IBOutlet weak var nptrailerWebView: UIWebView!
    @IBOutlet weak var backBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set up back button
        backBarButtonItem.tintColor = UIColor.white
        backBarButtonItem.target = self
        backBarButtonItem.action = #selector (backtodetail)
        
        //Get trailer
        npplaytrailer()
        
    //Closes out ViewDidLoad
    }
    
    @objc func backtodetail(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func npplaytrailer() {
        if let npMovieId = npMovieId {
            // Make Network Request for Now Playing Movie Trailer
            let npURL = URL(string: "https://api.themoviedb.org/3/movie/\(npMovieId)/videos?api_key=5f89533e24a2ff0828389c5e1cb6f8e8&language=en-US")!
            let npRequest = URLRequest(url: npURL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            // The reloadIgnoringLocalCacheData means everytime the request is done the app will pull data from the MD API even when it has data stored in Cache.
            let npURLSession = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let npTask = npURLSession.dataTask(with: npRequest) { (data, response, error) in
                //This will run when the network request returns
                if let error = error {
                    let nptrailerAlertController = UIAlertController(title: "Cannot Load Trailer", message: "check network connection", preferredStyle: .alert)
                    let npcancelAction = UIAlertAction(title: "Okay", style: .cancel)
                    nptrailerAlertController.addAction(npcancelAction)
                    self.present(nptrailerAlertController, animated: true)
                    print(error.localizedDescription)
                }
                else if let data = data {
                    let npdataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let nptrailerresults = npdataDictionary["results"] as! [[String: Any]]
                    for trailer in nptrailerresults {
                        let type = String(describing: trailer["type"]!)
                        if type == "Trailer" {
                            self.npTrailer.append(trailer["key"] as! String)
                        }
                    }
                    if (self.npTrailer.count > 0) {
                        let trailerkey = self.npTrailer[0]
                        let youtubeURL = URL(string: "https://www.youtube.com/watch?v=\(trailerkey)")!
                        let youtubeRequest = URLRequest(url: youtubeURL)
                            self.nptrailerWebView.loadRequest(youtubeRequest)
                    }
                }
            }
            npTask.resume()
        }
    //closes out trailer function
    }
    
    
//Closes out class
}
