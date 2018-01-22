//
//  HTButtons.swift
//  HandyTools
//
//  Created by Poonam Pandey on 22/01/18.
//

import UIKit

class HTButtons : NSObject {
    
    var mylabel : String
    var mytype : Int
    var myorder: Int
    var myheight : Int
    
    init(_ lable:String ,_ type: Int,_ order:Int,_ height: Int) {
        self.mylabel = lable
        self.mytype = type
        self.myorder = order
        self.myheight = height
    }
    
}
