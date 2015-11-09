//
//  BaseViewController.swift
//  SampleCode
//
//  Created by Nguyen Phuc Loc on 11/9/15.
//  Copyright © 2015 locnp. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // background navigation
        let sImage = CGSize(width: ScreenSize.WIDTH, height: 1)
        let imgBackground = UIImage().tintWithColor(UIColor.hexColor("#4dd2cb", alpha: 1.0), size: sImage)
        self.navigationController?.navigationBar.backgroundColor = UIColor.hexColor("#4dd2cb", alpha: 1.0)
        
        self.navigationController?.navigationBar.setBackgroundImage(imgBackground, forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = imgBackground
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        self.navigationController?.navigationBar.translucent = false
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
