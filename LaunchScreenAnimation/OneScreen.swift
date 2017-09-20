//
//  OneScreen.swift
//  LaunchScreenAnimation
//
//  Created by Cognisun on 18/09/17.
//  Copyright © 2017 Cognisun. All rights reserved.
//

import UIKit

class OneScreen: UIViewController {

    @IBOutlet var ScrollView: UIScrollView!
    @IBOutlet var PageController: UIPageControl!
    
    var closeHandler: (() -> Void)?
    
    class func instance() -> OneScreen {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "OneScreen") as! OneScreen
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let container1 = storyboard.instantiateViewController(withIdentifier: "FirstScreen")
        let container2 = storyboard.instantiateViewController(withIdentifier: "SecondScreen")
        let container3 = storyboard.instantiateViewController(withIdentifier: "ThirdScreen")
        
        container1.view.frame = UIScreen.main.bounds
        container2.view.frame = UIScreen.main.bounds
        container2.view.frame.origin.x = UIScreen.main.bounds.width
        container3.view.frame = UIScreen.main.bounds
        container3.view.frame.origin.x = UIScreen.main.bounds.width * 2
        
        self.addChildViewController(container1)
        ScrollView.addSubview(container1.view)
        container1.didMove(toParentViewController: self)
        
        self.addChildViewController(container2)
        ScrollView.addSubview(container2.view)
        container2.didMove(toParentViewController: self)
        
        self.addChildViewController(container3)
        ScrollView.addSubview(container3.view)
        container3.didMove(toParentViewController: self)
        
        ScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: UIScreen.main.bounds.height)
        
        ScrollView.showsHorizontalScrollIndicator = true
        ScrollView.showsVerticalScrollIndicator = false
        ScrollView.isPagingEnabled = true
    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension OneScreen: PopupContentViewController {
    func sizeForPopup(_ popupController: PopupController, size: CGSize, showingKeyboard: Bool) -> CGSize {
        return UIScreen.main.bounds.size
    }
}

extension OneScreen: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        PageController.currentPage = Int(floor((scrollView.contentOffset.x / scrollView.frame.width)))
    }
}








