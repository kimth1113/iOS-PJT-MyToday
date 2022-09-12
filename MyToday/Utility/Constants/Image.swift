//
//  Image.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/09.
//

import Foundation
import UIKit

extension Constants {
    
    enum BaseImage {
        
        static let background = UIImage(named: "eugene-chystiakov-wcMysLw5ROM-unsplash")
        
        static let pencel = UIImage(named: "pencils")
        
        static let leftArrow = UIImage(systemName: "chevron.left.circle.fill")
        static let rightArrow = UIImage(systemName: "chevron.right.circle.fill")
        
        enum TapMenu {
            static let calendar = UIImage(systemName: "note.text")
            static let calendarFill = UIImage(systemName: "note.text")
            static let diaryList = UIImage(systemName: "square.grid.2x2")
            static let diaryListFill = UIImage(systemName: "square.grid.2x2.fill")
            static let analysis = UIImage(systemName: "align.vertical.bottom")
            static let analysisFill = UIImage(systemName: "align.vertical.bottom.fill")
            static let setting = UIImage(systemName: "gearshape")
            static let settingFill = UIImage(systemName: "gearshape.fill")
        }
        
        enum Emotion {
            static let happy = UIImage(named: "smile")
            static let serious = UIImage(named: "serious")
            static let none = UIImage(named: "square")
        }
    }
}
