//
//  QuestionCell.swift
//  IQ
//
//  Created by Sunny on 3/19/16.
//  Copyright © 2016 Sunny. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func awakeFromNib() {
        selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    func updateUI(dictionary: NSDictionary) {
        if let question = dictionary["question"] as? String {
            titleLabel.text = question
        }
        if let answer = dictionary["answer"] as? String {
            answerLabel.text = answer
        }
    }
}
