//
//  QuestionListController.swift
//  IQ
//
//  Created by Sunny on 3/19/16.
//  Copyright © 2016 Sunny. All rights reserved.
//

import UIKit

class QuestionListController: UITableViewController {

    var questions: [NSDictionary] = []
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
        spinner.color = UIColor.grayColor()
        spinner.center = view.center
        tableView.addSubview(spinner)
    }
    
    func fetchRemoteData(title: String) {
        spinner.startAnimating()
        HTTPManager.sharedInstance.request(URLString: IQURLString(title),
            success: { JSON in
                self.spinner.removeFromSuperview()
                if let JSON = JSON as? [NSDictionary] {
                    self.questions = JSON
                    if self.questions.count > 0 {
                        self.tableView.reloadData()
                    }
                }
            },
            failure: {
                self.spinner.removeFromSuperview()
            }
        )
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Question", forIndexPath: indexPath) as! QuestionCell
        cell.updateUI(questions[indexPath.row])
        return cell
    }

    /*
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.fd_heightForCellWithIdentifier("Question", configuration: { (cell: AnyObject!) -> Void in
            cell.updateUI(self.questions[indexPath.row])
        })
    }
    */
    
    /*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath)
    }
    */
}
