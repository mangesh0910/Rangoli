//
//  DetailViewController.swift
//  Rangoli
//
//  Created by Mangesh Khanderao Gosavi on 28/02/18.
//  Copyright © 2018 Mangesh Khanderao Gosavi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var webViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var selectedVideo :Youtube1? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let vid = self.selectedVideo
        {
            self.titleLabel.text = vid.yTitle
            self.descriptionLabel.text = vid.yDescription
            
            let width = self.view.frame.size.width
            let height = width / 320 * 180
            self.webViewHeightConstraint.constant = height
            
            let s = "<html><body><iframe src='http://www.youtube.com/embed/"+vid.yId
            let s1 = s + "' width='"+String(describing: width)
            let s2 = s1 + "' height='"+String(describing: height)
            let s3 = s2 + "' frameborder='0' allowfullscreen></iframe></body></html>"
            self.webView.loadHTMLString( s3 ,baseURL: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
