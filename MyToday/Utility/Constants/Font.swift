//
//  Font.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/09.
//

import UIKit

extension Constants {
    
    enum BaseFont {
        
        static let boxTitle = UIFont(name: "font_bold".localized, size: 20)
        static let boxContent = UIFont(name: "font_bold".localized, size: 16)
        static let boxExtra = UIFont(name: "font_bold".localized, size: 16)
        
        enum Tapbar {
            static let float = UIFont(name: "font_bold".localized, size: 20)
        }
        
        enum DateAlert {
            static let month = UIFont(name: "font_bold".localized, size: 20)
            static let year = UIFont(name: "font_bold".localized, size: 32)
        }
        
        enum Calendar {
            static let header = UIFont(name: "font_bold".localized, size: 48)
            static let title = UIFont(name: "font_bold".localized, size: 18)
        }
        
        enum Read {
            static let date = UIFont(name: "font_bold".localized, size: 20)
            static let label = UIFont(name: "font_normal".localized, size: 16)
            static let content = UIFont(name: "font_bold".localized, size: 20)
        }
        
        enum DiaryList {
            static let header = UIFont(name: "font_bold".localized, size: 28)
            static let emotion = UIFont(name: "font_bold".localized, size: 16)
            static let year = UIFont(name: "font_bold".localized, size: 20)
            static let date = UIFont(name: "font_normal".localized, size: 16)
            static let eDate = UIFont(name: "font_bold".localized, size: 16)
            static let content = UIFont(name: "font_normal".localized, size: 12)
        }
        
        enum Analysis {
            static let header = UIFont(name: "font_bold".localized, size: 28)
            static let title = UIFont(name: "font_bold".localized, size: 18)
            static let count = UIFont(name: "font_bold".localized, size: 18)
            static let diaryCount = UIFont(name: "font_bold".localized, size: 80)
            static let label = UIFont(name: "font_bold".localized, size: 16)
        }
    }
}
