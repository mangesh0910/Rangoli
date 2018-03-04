//
//  ViewController.swift
//  Rangoli
//
//  Created by Mangesh Khanderao Gosavi on 10/02/18.
//  Copyright © 2018 Mangesh Khanderao Gosavi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tabledata: UITableView!
    var videos:[Youtube1] = [Youtube1]()
    var selectedVideo:Youtube1?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let youtubeModel = Youtube1model()
        youtubeModel.delegate = self
        youtubeModel.getVideos()
        
        self.tabledata.dataSource = self
        self.tabledata.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (self.view.frame.size.width/320)*180
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tabledata.dequeueReusableCell(withIdentifier: "BasicCell")!
        
      let utitle = videos [indexPath.row].yTitle
        
        //set label as title of video
        
        let label = cell.viewWithTag(2) as! UILabel
        
       label.text = utitle
        
     //   cell.textLabel?.text = utitle
        
        // Construct thumbanail url
        
        let videoUrlString = "https://i1.ytimg.com/vi/"+videos[indexPath.row].yId+"/mqdefault.jpg"
        
        //create NSURL objeect
        
        let videourl = NSURL(string: videoUrlString)
        
       
        
        
        if videourl != nil
        {
        
            //Create NSURL request obj
            
            let request = URLRequest(url: videourl! as URL)
            
            //Create NSurl session
        
            let session = URLSession.shared
        
            //Create data task and pass it to request
            
            let datataks = session.dataTask(with: request, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
                
                
                DispatchQueue.main.async {
                    
                
                    
                    // Get reference to the image view element of cell
                    
                    let imageview = cell.viewWithTag(1) as! UIImageView
                    
                    //Create and image object from data and assign it  into the image view
                    
                    imageview.image = UIImage(data: data!)
                    
                    
                }
                
                
               
                
                
                
                
                
                
            })
            datataks.resume()
            
        }
            
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // code to identify which video user has selected
        
        self.selectedVideo = self.videos[indexPath.row]
        
        //Call to segue
        
        self.performSegue(withIdentifier: "gotoDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //get reference to the destination view controller
        
        let detailViewController = segue.destination as! DetailViewController
        
        
        
        // set selectedVideo property for destination view controller
        
        detailViewController.selectedVideo = self.selectedVideo
    }
}

extension ViewController : YoutubeModelProtocol {
    
    func didFailToLoadVideos() {
        // TODO : show error
    }
    
    func didReceivedVideos(videos: [Youtube1]) {
        self.videos = videos
        self.tabledata.reloadData()
    }
}

