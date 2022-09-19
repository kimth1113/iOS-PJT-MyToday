//
//  Color.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/09.
//

import UIKit

extension Constants {
    
    enum BaseColor {
        
        static let white = UIColor.white
        static let black = UIColor.black
        
        enum TabBar {
            static let background = UIColor(named: "tabbar-background")
            static let item = UIColor.orange
            static let unselectedItem = UIColor.lightGray
        }
        
        enum Calendar {
            static let saturday = UIColor.blue
            static let sunday = UIColor.red
            static let weekday = UIColor.white
        }
        
        enum PencilAlert {
            static let background = UIColor(named: "alert-background")
        }
    }
}
