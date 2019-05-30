//
//  UIColor+theme.swift
//  IAP-REPO
//
//  Created by Max Nelson on 5/30/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

extension UIColor {
    // modify the return value when you want to switch the theme
    public static var primaryOne:UIColor = { return .scarletRed }()
    
    // don't modify
    public static var scarletRed:UIColor = { return UIColor.init(red: 255/255, green: 0/255, blue: 0/255, alpha: 1) }()
    public static var oceanBlue:UIColor = { return UIColor.init(red: 0, green: 159/255, blue: 255/255, alpha: 1) }()
}

