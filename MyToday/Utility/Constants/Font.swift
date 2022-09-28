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
        
        enum Calendar {
            static let header = UIFont(name: "NanumBarunpen-Bold", size: 48)
            static let title = UIFont(name: "NanumBarunpen-Bold", size: 18)
        }
        
        enum Read {
            static let header = UIFont(name: "NanumBarunpen-Bold", size: 40)
            static let date = UIFont(name: "NanumBarunpen-Bold", size: 20)
            static let label = UIFont(name: "RIDIBatang", size: 16)
            static let content = UIFont(name: "KOTRA_SONGEULSSI", size: 16)
        }
        
        enum DiaryList {
            static let header = UIFont(name: "NanumBarunpen-Bold", size: 32)
            static let year = UIFont(name: "ChosunKm", size: 20)
            static let date = UIFont(name: "RIDIBatang", size: 16)
            static let eDate = UIFont(name: "RIDIBatang", size: 16)
            static let content = UIFont(name: "RIDIBatang", size: 16)
        }
    }
}
