//
//  Youtube1model.swift
//  Rangoli
//
//  Created by Mangesh Khanderao Gosavi on 10/02/18.
//  Copyright © 2018 Mangesh Khanderao Gosavi. All rights reserved.
//

import UIKit
import FirebaseDatabase

protocol YoutubeModelProtocol : class {
    func didReceivedVideos(videos : [Youtube1])
    func didFailToLoadVideos()
}


class Youtube1model: NSObject {
    
    var ref:DatabaseReference?
    var databasehandler: DatabaseHandle?
    weak var delegate : YoutubeModelProtocol?
    
    func getVideos() -> [Youtube1] {
  
        var videos = [Youtube1]()
     
        ref = Database.database().reference()
   
       // retrive data and listen to changes
        
        ref?.child("Youtube").observe(.value, with: { (snapshot) in
        
            if snapshot.childrenCount > 0 {
               // videos.removeAll()
                for yvideos in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    
                    if let yvideoObject = yvideos.value as? [String: AnyObject] {
                        
                        if let yvideoid = yvideoObject["id"] as? String
                        {
                            let yt = yvideoObject["title"] as? String ?? ""
                            let ydesc = yvideoObject["description"] as? String ?? ""
                            
                            let yvideo = Youtube1(yId:yvideoid,yTitle:yt,yDescription:ydesc)
                            
                            videos.append(yvideo)
                            
                            print("here data : \(yvideoid) :: \(yt)")
                        }
                    }
                }
                self.delegate?.didReceivedVideos(videos: videos)
            }else if snapshot.childrenCount == 0 {
                self.delegate?.didReceivedVideos(videos: [])
            }else {
                self.delegate?.didFailToLoadVideos()
            }
        })
    
        /*let yvideo = Youtube1(yId:   ,yTitle:"Tuzhyat Jeev Rangala Title Song Lyrics | Aanandi Joshi | Zee Marathi",yDescription:"Tuzhyat Jeev Rangalamy favourite song .....﻿")*/
        
      //  print(yvideo.yId)
        
      //  videos.append(yvideo)
 /*
         var videos = [Youtube1]()
         
         
  /*       //Create video object
        let video1 = Youtube1(yId,yTitle,yDescription)
        
       //locate properties
        
        video1.yId = "CYelWJsrGFs"
        video1.yTitle = "Swarajya Rakshak Sambhaji New serial on zee marathi ||Marathi Sounds"
        video1.yDescription = "In Maharashtra’s rich history, there is an important chapter dedicated to Chhatrapati Sambhaji Maharaj."
        
        //then append it to video array
        videos.append(video1)
        
        
        //Create video object
        let video2 = Youtube1(yId,yTitle,yDescription)
        
        //locate properties
        
        video2.yId = "NWHb8VKvgsg"
        video2.yTitle = "Adhir Man Zale, Madhur Ghan Aale Full HD Song - Nilkanth Master"
        video2.yDescription = "the first song of ‪Nilkanth Master‬ Adhir man zale, Madhur ghan aale.. in the voice of Shreya Ghoshal, Music by Ajay Atul."
        
        //then append it to video array
        videos.append(video2)
        */
        
        
        //Create video object
        let video3 = Youtube1(yId:"9m6-8L1o9LM",yTitle:"Tuzhyat Jeev Rangala Title Song Lyrics | Aanandi Joshi | Zee Marathi",yDescription:"Tuzhyat Jeev Rangalamy favourite song .....﻿")
        
/*        //locate properties
        
        video3.yId =
        video3.yTitle =
        video3.yDescription =
        
        //then append it to video array */
        videos.append(video3)
        
        
        
     /*
        
        //Create video object
        let video4 = Youtube1(yId,yTitle,yDescription)
        
        //locate properties
        
        video4.yId = "FxGvi8O3mxM"
        video4.yTitle = "Fandry Song - Ajay Atul"
        video4.yDescription = "Sound track for Fandry composed by Ajay-Atul"
        //then append it to video array
        videos.append(video4)
        
        
        
        //Create video object
        let video5 = Youtube1(yId,yTitle,yDescription)
        
        //locate properties
        
        video5.yId = "0TRma7tUNxA"
        video5.yTitle = "Deva Tujhya Navach Yed Lagal | Ek Taraa | Sung By Master Vidhit Patankar | Santosh Juvekar"
        video5.yDescription = "Listen to the heart touching Marathi song 'Deva Tujhya Navach Yed Lagal' sung by Master Vidhit Patankar from Marathi movie 'Ek Taraa (2015)' starring Santosh Juvekar, Tejaswini Pandit & Urmila Nimbalkar. Music by Avdhoot Gupte. Lyrics by Guru Thakur. "
        
        //then append it to video array
        videos.append(video5)
        
        
        
        //Create video object
        let video6 = Youtube1(yId,yTitle,yDescription)
        
        //locate properties
        
        video6.yId = "-qV7-pyW15k"
        video6.yTitle = "माऊली माऊली | Mauli Mauli | Sona Mohapatra | Ghaat Marathi Movie 2017 | Marathi Devotional Songs"
        video6.yDescription = "the brand new Marathi Devotional Song 'Mauli Mauli' | माऊली माऊली sung by renowned singer Sona Mohapatra from Dadasaheb Falke Film Festival Award winner Marathi Movie Ghaat(2017) Starring Yash Kulkarni, Dattatray Dharme, Mitali Jagtap, Umesh Jagtap, Riya Gavli."
        //then append it to video array
        videos.append(video6)
        
        
        
        //Create video object
        let video7 = Youtube1(yId,yTitle,yDescription)
        
        //locate properties
        
        video7.yId = "GSH4Ev63okE"
        video7.yTitle = "Adarsh Shinde From Rasik Group (Gudi Padwa) 2017 Ahmednagar Live From Reflection Media Newasa"
        video7.yDescription = "Reflection Media Newasa Contact No.9881962140"
        //then append it to video array
        videos.append(video7)
        
        
        
        
        
        
        
        
        
        
       */   */
        
        return videos
        
    }
    

}
