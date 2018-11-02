//
//  Movie.swift
//  Flixy
//
//  Created by Andriana Aivazians on 11/1/18.
//  Copyright © 2018 Andriana Aivazians. All rights reserved.
//

import Foundation

class Movie {
    var title: String
    var overview: String
    var rating: String?
    var releasedate: String
    var posterURL: URL?
    var backposterURL: URL?
    var movieid: String
    private var testString: String
    
    init(dictionary: [String: Any]) {
        title = dictionary[""] as? String ?? "No Title"
        overview = dictionary["overview"] as? String ?? "N/A"
        releasedate = dictionary["release_date"] as? String ?? "N/A"
        
        //Formatting rating
        testString = String(describing: dictionary["vote_average"])
        testString = testString.replacingOccurrences(of: "Optional", with: "")
        testString = testString.replacingOccurrences(of: "(", with: "")
        testString = testString.replacingOccurrences(of: ")", with: "")
        
        if (testString == "0.0") {
            rating = "No Rating"
        }
        else {
            let denominatorString = "/10"
            rating = rating! + denominatorString
        }
        
        //Generate poster & backposter URL
        let baseString = "https://image.tmdb.org/t/p/w500"
        let posterString = dictionary["poster_path"] as? String
        let backposterString = dictionary["backdrop_path"] as? String
        if posterString != nil {
            posterURL = URL(string: baseString + posterString!)
        }
        if backposterString != nil {
            backposterURL = URL(string: baseString + backposterString!)
        }
        
        //Generate Trailer URL
        movieid = dictionary["id"] as! String
    }
    
    
    
}
