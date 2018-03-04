//
//  YadminViewController.swift
//  Rangoli
//
//  Created by Mangesh Khanderao Gosavi on 02/03/18.
//  Copyright © 2018 Mangesh Khanderao Gosavi. All rights reserved.
//

import UIKit
import FirebaseDatabase

class YadminViewController: UIViewController {
    
    @IBOutlet weak var yid: UITextField!
    @IBOutlet weak var ytitle: UITextField!
    @IBOutlet weak var ydescription: UITextField!
    
    
    var ref:DatabaseReference?
    var i = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Ystore(_ sender: Any) {
       
        ref?.child("Youtube").child(String(i)).child("id").setValue(yid.text)
        ref?.child("Youtube").child(String(i)).child("title").setValue(ytitle.text)
        ref?.child("Youtube").child(String(i)).child("description").setValue(ydescription.text)
        i = i + 1
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
