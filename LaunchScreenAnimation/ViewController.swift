//
//  ViewController.swift
//  LaunchScreenAnimation
//
//  Created by Cognisun on 18/09/17.
//  Copyright © 2017 Cognisun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pageViewController: UIPageControl!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Continue(_ sender: UIButton) {
        
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "OneScreen") as! OneScreen
        self.present(newViewController, animated: true, completion: nil)
        
        
        
        
        
        
        
        
    }


}

