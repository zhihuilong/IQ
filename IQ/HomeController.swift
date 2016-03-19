//
//  HomeController.swift
//  IQ
//
//  Created by Sunny on 3/19/16.
//  Copyright © 2016 Sunny. All rights reserved.
//

import UIKit

let kScreenWidth  = UIScreen.mainScreen().bounds.size.width
let kScreenHeight = UIScreen.mainScreen().bounds.size.height

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let imageNames = ["计算机基础", "iOS", "Android", "php", "Java", "C++", "前端", "算法", "大数据", "安全"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let topLineView = UIView(frame: CGRect(x: 0, y: 44, width: kScreenWidth, height: 1))
        topLineView.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.addSubview(topLineView)
    }
    
}

extension HomeController {
 
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HomeCell", forIndexPath: indexPath) as! HomeCell
        cell.updateUI(imageNames[indexPath.row])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = (kScreenWidth-2)/2
        return CGSize(width: width, height: width)
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("QuestionList")
        vc.title = imageNames[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

