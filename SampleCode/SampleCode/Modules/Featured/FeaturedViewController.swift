//
//  FeaturedViewController.swift
//  SampleCode
//
//  Created by Nguyen Phuc Loc on 11/9/15.
//  Copyright © 2015 locnp. All rights reserved.
//

import UIKit

class FeaturedViewController: BaseViewController {

    @IBOutlet weak var clvCategories: UICollectionView?
    var arrResult:NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Featured"
        
        self.clvCategories?.registerNib(UINib(nibName: "CatalogCell", bundle: nil), forCellWithReuseIdentifier: "CatalogCell")
        self.arrResult = NSArray()
        APIClient.sharedInstance.getImage { (resObj) -> () in
            self.arrResult = resObj
            self.clvCategories?.reloadData()
        }
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

extension FeaturedViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrResult!.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CatalogCell", forIndexPath: indexPath) as! CatalogCell
        cell.renderData(self.arrResult![indexPath.row] as! NSDictionary)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width:ScreenSize.WIDTH/2, height:ScreenSize.WIDTH/2)
    }
}
