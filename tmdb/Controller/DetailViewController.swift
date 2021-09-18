//
//  DetailViewController.swift
//  tmdb
//
//  Created by wahid tariq on 17/09/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var titleOfMovie  = ""
//    var originalTitle = ""
    var overView      = ""
//    var isVideo: Bool = true
    var imageUrl = ""
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var titleForMovie: UILabel!
//    @IBOutlet var isVideoForMovie: UILabel!
//    @IBOutlet var originalTitleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        overviewLabel.text = "OverView :- \(overView)"
        titleForMovie.text = "Title :- \(titleOfMovie)"
//        originalTitleLabel.text = "Original Title :- \(originalTitle)"
//        isVideoForMovie.text = "Trailer Avaliable :- \(String(isVideo))"
        let urlForImage = "https://image.tmdb.org/t/p/w500\(imageUrl)"
        if let url = URL(string: urlForImage){
        if let data = try? Data(contentsOf: url) {
               // Create Image and Update Image View
               imageView.image = UIImage(data: data)
           }
        }
      
        
    }
    

   
}
