//
//  Styler.swift
//  momoCustomer
//
//  Created by zcon on 2017/5/17.
//  Copyright © 2017年 MomoDidi. All rights reserved.
//

import Foundation
import UIKit

class Styler {
    class func styleNavBar(_ vc:UIViewController){
        vc.edgesForExtendedLayout = []
        vc.extendedLayoutIncludesOpaqueBars = true
        vc.navigationController?.toolbar.barStyle = .default // this make it appears
        
        vc.navigationController?.navigationBar.barStyle = .blackOpaque
        vc.navigationController?.navigationBar.isTranslucent = false
        vc.navigationController?.navigationBar.barTintColor = CustomerAppCr.navBar
        vc.navigationController?.navigationBar.tintColor = .white
    }
}

