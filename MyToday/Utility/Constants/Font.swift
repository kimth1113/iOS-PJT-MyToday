//
//  Font.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/09.
//

import UIKit

extension Constants {
    
    enum BaseFont {
        
        static let boxTitle = UIFont(name: "NanumBarunpen-Bold", size: 20)
        static let boxContent = UIFont(name: "NanumBarunpen-Bold", size: 16)
        static let boxExtra = UIFont(name: "NanumBarunpen-Bold", size: 16)
        
        enum Tapbar {
            static let float = UIFont(name: "NanumBarunpen-Bold", size: 20)
        }
        
        enum DateAlert {
            static let month = UIFont(name: "NanumBarunpen-Bold", size: 20)
            static let year = UIFont(name: "NanumBarunpen-Bold", size: 32)
        }
        
        enum Calendar {
            static let header = UIFont(name: "NanumBarunpen-Bold", size: 48)
            static let title = UIFont(name: "NanumBarunpen-Bold", size: 18)
        }
        
        enum Read {
            static let date = UIFont(name: "NanumBarunpen-Bold", size: 20)
            static let label = UIFont(name: "NanumBarunpen", size: 16)
            static let content = UIFont(name: "NanumBarunpen-Bold", size: 20)
        }
        
        enum DiaryList {
            static let header = UIFont(name: "NanumBarunpen-Bold", size: 28)
            static let emotion = UIFont(name: "NanumBarunpen-Bold", size: 16)
            static let year = UIFont(name: "NanumBarunpen-Bold", size: 20)
            static let date = UIFont(name: "NanumBarunpen", size: 16)
            static let eDate = UIFont(name: "NanumBarunpen-Bold", size: 16)
            static let content = UIFont(name: "NanumBarunpen", size: 12)
        }
        
        enum Analysis {
            static let header = UIFont(name: "NanumBarunpen-Bold", size: 28)
            static let title = UIFont(name: "NanumBarunpen-Bold", size: 18)
            static let count = UIFont(name: "NanumBarunpen-Bold", size: 18)
            static let diaryCount = UIFont(name: "NanumBarunpen-Bold", size: 80)
            static let label = UIFont(name: "NanumBarunpen-Bold", size: 16)
        }
    }
}
