//
//  Constants.swift
//  IQ
//
//  Created by Sunny on 3/19/16.
//  Copyright © 2016 Sunny. All rights reserved.
//

let kScreenWidth  = UIScreen.mainScreen().bounds.size.width
let kScreenHeight = UIScreen.mainScreen().bounds.size.height

let cachedTypesKey = "cachedTypesKey"

let IQURLAbout = ""

func IQURLString(action: String) -> String{
    return "https://raw.githubusercontent.com/litsunny/IQ/master/api/\(action).json"
}

func IQImageURLString(action: String) -> String{
    return "https://raw.githubusercontent.com/litsunny/IQ/master/img/\(action).png"
}
