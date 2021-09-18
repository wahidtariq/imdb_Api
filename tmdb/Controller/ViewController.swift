//
//  ViewController.swift
//  tmdb
//
//  Created by wahid tariq on 17/09/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    
    
    
    var movieArray = [MovieData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let urlString = "https://api.themoviedb.org/3/trending/all/day?api_key=6b70c9f1ce39376d67e8bbcd8f652db2"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    parseJson(data:safeData)
                    
                }
            }
            task.resume()
        }
        
        func parseJson(data: Data){
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode(MovieDetails.self, from: data)
                for i in 0...18{
                    if let original_title = decodedData.results[i].original_title,
                       let overview = decodedData.results[i].overview,
                       let movieTitle = decodedData.results[i].title,
                       let isVideo = decodedData.results[i].video,
                       let imagePath = decodedData.results[i].poster_path{                        
                        movieArray.append(MovieData(original_title: original_title, video: isVideo, overview: overview, imageUrl: imagePath, title: movieTitle))
                        
                    }
                }
                
                DispatchQueue.main.async { [self] in
                    
                    tableView.reloadData()
                }
     
            }catch{
                print(error)
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = movieArray[indexPath.row].original_title
        return cell
    }
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController{
            vc.overView = movieArray[indexPath.row].overview
//            vc.isVideo = movieArray[indexPath.row].video
//            vc.originalTitle = movieArray[indexPath.row].original_title
            vc.titleOfMovie = movieArray[indexPath.row].title
            vc.imageUrl = movieArray[indexPath.row].imageUrl
            present(vc, animated: true, completion: .none)
           
        }
        
    }
}


