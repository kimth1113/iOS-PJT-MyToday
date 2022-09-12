//
//  Font.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/09.
//

import UIKit

extension Constants {
    
    enum BaseFont {
        
        static let boxTitle = UIFont.boldSystemFont(ofSize: 20)
        static let boxContent = UIFont.systemFont(ofSize: 16)
        static let boxExtra = UIFont.boldSystemFont(ofSize: 16)
        
        enum Calendar {
            static let header = UIFont.boldSystemFont(ofSize: 40)
            static let title = UIFont(name: "Roboto-Regular", size: 14)
        }
    }
}
