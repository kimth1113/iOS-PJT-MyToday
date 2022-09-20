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
        
        static let emotion = [
            // none
            UIImage(named: "square(3)"),
            // happy
            UIImage(named: "happy"),
            // angry
            UIImage(named: "angry"),
            // disgusted
            UIImage(named: "disgusted"),
            // fear
            UIImage(named: "fear"),
            // kiss
            UIImage(named: "kiss"),
            // sad
            UIImage(named: "sad"),
            // sadness
            UIImage(named: "sadness"),
            // sleeping
            UIImage(named: "sleeping"),
            // surprised
            UIImage(named: "surprised"),
        ]
    }
}
