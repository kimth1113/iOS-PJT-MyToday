//
//  Font.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/09.
//

import UIKit

extension Constants {
    
    enum BaseFont {
        
        static let boxTitle = UIFont(name: "ChosunKm", size: 20)
        static let boxContent = UIFont(name: "ChosunilboNM", size: 16)
        static let boxExtra = UIFont(name: "ChosunilboNM", size: 16)
        
        enum Calendar {
            static let header = UIFont(name: "RIDIBatang", size: 48)
            static let title = UIFont(name: "RIDIBatang", size: 16)
        }
        
        enum Read {
            static let header = UIFont(name: "esamanruOTFMedium", size: 60)
            static let date = UIFont(name: "RIDIBatang", size: 20)
            static let label = UIFont(name: "RIDIBatang", size: 16)
            static let content = UIFont(name: "esamanruOTFMedium", size: 16)
        }
    }
}
