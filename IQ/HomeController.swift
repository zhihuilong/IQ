//
//  HomeController.swift
//  IQ
//
//  Created by Sunny on 3/19/16.
//  Copyright © 2016 Sunny. All rights reserved.
//

import UIKit

class HomeModel: NSObject {

    var types: [NSDictionary] = []
    
    func fetchRemoteData(success success: ResultBlock, failure: ResultBlock) {
        
        HTTPManager.sharedInstance.request(URLString: IQURLString("types"),
            success: { JSON in
                if let JSON = JSON as? [NSDictionary] {
                    self.types = JSON
                    if let success = success {
                        success()
                    }
                }
            },
            failure: {
                if let failure = failure {
                    failure()
                }
            }
        )
        
    }
    
}

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    let model = HomeModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        let topLineView = UIView(frame: CGRect(x: 0, y: 44, width: kScreenWidth, height: 1))
        topLineView.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.addSubview(topLineView)
        test()
        spinner.startAnimating()
        model.fetchRemoteData(
            success: {
                self.spinner.stopAnimating()
                self.collectionView?.reloadData()
            },
            failure: {
                self.spinner.stopAnimating()
            }
        )
    }
    
    func test() {
        
        
    }
}

extension HomeController {
 
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.types.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HomeCell", forIndexPath: indexPath) as! HomeCell
        cell.updateUI(model.types[indexPath.row])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = (kScreenWidth-2)/2
        return CGSize(width: width, height: width)
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("QuestionList")
        vc.title = model.types[indexPath.row].allValues[0] as? String
        navigationController?.pushViewController(vc, animated: true)
    }
}

