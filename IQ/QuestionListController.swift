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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
    }
    
    func fetchRemoteData(title: String) {
        HTTPManager.sharedInstance.request(URLString: IQURLString(title),
            success: { JSON in
                if let JSON = JSON as? [NSDictionary] {
                    self.questions = JSON
                    self.tableView.reloadData()
                }
            },
            failure: {
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
