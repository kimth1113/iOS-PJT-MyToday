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
            
            static let unselectedItem = #colorLiteral(red: 0.8010819554, green: 0.8010819554, blue: 0.8010819554, alpha: 1)
        }
        
        enum Calendar {
            static let saturday = UIColor.blue
            static let sunday = UIColor.red
            static let weekday = UIColor(red: 47/255, green: 53/255, blue: 66/255)
        }
        
        enum PencilAlert {
            static let background = UIColor(named: "alert-background")
        }
        
        enum ListCell {
            static let background = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4)
            static let contentBackground = UIColor(named: "alert-background")
        }
    }
}
