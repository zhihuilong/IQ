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
        answerLabel.text = "编译时，类似宏替换，使用函数体替换调用处的函数名。用来消除函数调用时的时间开销宏是由预处理宏是     由预处理宏是由预处理宏是由预处理。宏是由预处理器对宏进行替代，而内联函数是\n通过编译器控制来实现的。"
    }
    
    func updateUI(dictionary: NSDictionary) {
        titleLabel.text = dictionary["question"] as? String
        answerLabel.text = dictionary["answer"] as? String
    }
}
