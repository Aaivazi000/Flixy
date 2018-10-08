//
//  PlayTrailerViewController.swift
//  Flixy
//
//  Created by Andriana Aivazians on 10/7/18.
//  Copyright © 2018 Andriana Aivazians. All rights reserved.
//

import UIKit

class PlayTrailerViewController: UIViewController {

    //Declaration & UI Elements
    var movieid: String?
    var trailer: [String] = []
    @IBOutlet weak var trailerWebView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playtrailer()
    }
    
    
    func playtrailer() {
        if let movieid = movieid {
            // Make Network Request for Now Playing Movies
            let newurl = URL(string: "https://api.themoviedb.org/3/movie/\(movieid)/videos?api_key=5f89533e24a2ff0828389c5e1cb6f8e8&language=en-US")!
            let newrequest = URLRequest(url: newurl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            // The reloadIgnoringLocalCacheData means everytime the request is done the app will pull data from the MD API even when it has data stored in Cache.
            let newsession = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let newtask = newsession.dataTask(with: newrequest) { (newdata, newresponse, newerror) in
                //This will run when the network request returns
                if let newerror = newerror {
                    let trailerAlertController = UIAlertController(title: "Cannot Load Trailer", message: "check network connection", preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "Okay", style: .cancel)
                    trailerAlertController.addAction(cancelAction)
                    self.present(trailerAlertController, animated: true)
                    print(newerror.localizedDescription)
                }
                else if let newdata = newdata {
                    let newdataDictionary = try! JSONSerialization.jsonObject(with: newdata, options: []) as! [String: Any]
                    let trailerresults = newdataDictionary["results"] as! [[String: Any]]
                    for trailer in trailerresults {
                        let type = String(describing: trailer["type"]!)
                        if type == "Trailer" {
                            self.trailer.append(trailer["key"] as! String)
                        }
                    }
                    if (self.trailer.count > 0) {
                        let trailerkey = self.trailer[0]
                        let youtubeURL = URL(string: "https://www.youtube.com/watch?v=\(trailerkey)")!
                        let youtubeRequest = URLRequest(url: youtubeURL)
                        self.trailerWebView.loadRequest(youtubeRequest)
                    }
                    
                }
                
                
            }
            newtask.resume()
        }
    }

//this bracket closes class
}
