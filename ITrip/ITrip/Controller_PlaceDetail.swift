//
//  Controller_PlaceDetail.swift
//  ITrip
//
//  Created by Özgün on 24.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit


class Controller_PlaceDetail: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    var c_View :View_PlaceDetail?
    
    var s_Arr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        self.navigationController!.view.backgroundColor = UIColor.clearColor()
        self.navigationBackGroundColor(UIColor.clearColor(), tintC: UIColor.whiteColor())

        
        s_Arr.append("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
        s_Arr.append("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo cons")
        s_Arr.append("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut ")
        s_Arr.append("Lorem is aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
        s_Arr.append("Lorem ipsum doxcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
        s_Arr.append("d est laborum")
        s_Arr.append("Lorem ipsum aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
        s_Arr.append("Lorem ipsum dolor sit amet,                                                                                                                                                                                                                          consectetur adipiscing elit, sed do eiu  \n                                                                                                                                                                                                                       smod tempor incididunt ut labore et  \n                                                                                                                                                                                                                        dolore magna aliqua.L    \n                                                                    orem ipsum dolor sit amet, consectetur                                                                                                                                                                                                                          adipiscing elit, sed do eiusmod                                                                                                                                                                                                                          tempor incididunt ut labore et dolor                                                                                                            e magna aliqua. Ut\n                                                                                           enim ad minim veniam,                                                                                                                                                            qu\n                                                                                                                                                                                                                                                                               is nostrud exercitation                                                                                                                                                                                                                                                         ullamco laboris nisi ut                                                                                              aliquip ex ea com                                                                                                                            modo consequat. Duis aute irure dolo                                                                                          r in reprehenderit                                                                                           in\n                                                                                                                               voluptate velit esse cillu                                                                                                                            m dolore eu fugiat nulla pa                                                                                                                            riatur. Excepteur sint occae                                                                                                                            cat cupidatat non proident,                                                                                                                                                            sunt in\n culpa                                                                                                                               qui officia\n                                                                                                                                                                                                                                                         deserunt mollit\n                                                                                                                               anim id est laborum")
        
        
        
        self.c_View = View_PlaceDetail(frame: self.view.frame, target: self)
        self.view.addSubview(self.c_View!)

        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        self.navigationController!.view.backgroundColor = UIColor.clearColor()
        
        
        self.navigationBackGroundColor(UIColor.clearColor(), tintC: UIColor.whiteColor())
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        self.navigationController!.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = nil
        self.navigationController!.navigationBar.translucent = false
        //self.navigationController!.view.backgroundColor = UIColor.clearColor()
         self.navigationBackGroundColor(UIColor.grayColor(), tintC: UIColor.whiteColor())
        //navigationBarBackImage(UIImage(named: "navigationimg")!)
        
    }

    
    
    
    //:MARK - TableView DataSource & Delegate
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 2
        }else{
            return 8
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        if(indexPath.row == 0 && indexPath.section == 0){
            let cell = tableView.dequeueReusableCellWithIdentifier(CELL_PD_TV_INF, forIndexPath: indexPath) as! Cell_PD_TV_Inf
            
            
            return cell
        }else if(indexPath.row == 1 && indexPath.section == 0){
            let cell = tableView.dequeueReusableCellWithIdentifier(CELL_PD_TV_INF_2, forIndexPath: indexPath) as! Cell_PD_TV_Inf_2
            
            
            return cell
        }else if(indexPath.section == 1){
        
            let cell = tableView.dequeueReusableCellWithIdentifier(CELL_PD_TV_REVIEW, forIndexPath: indexPath) as! Cell_PD_TV_Review
            cell.lbl_Review.text = self.s_Arr[indexPath.row]
            return cell

        }else{
            return UITableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if(indexPath.section == 1){
            
            
            let height = heightToText(self.s_Arr[indexPath.row], font: UIFont.appFont(12), width: self.view.frame.width - 75)
            let total = 88 + height
            
            return total
        }else if(indexPath.section == 0){
        
            
            return 70
        }
        return 0
        
    }
    
    
    //:MARK - CollectionView DataSource & Delegate
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CELL_PD_CV_IMAGES, forIndexPath: indexPath) as! Cell_PD_CV_Images
        
        
        return cell
    }
    
    
    
    
}