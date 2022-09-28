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
        
        static let background = UIImage(named: "aboodi-vesakaran-bnlJM6zwTjQ-unsplash")
        static let scrollBackground = UIImage(named: "aboodi-vesakaran-bnlJM6zwTjQ-unsplash")
        
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
//            UIImage(named: "square(3)"),
            UIImage(named: ""),
            // happy
            UIImage(named: "happy"),
            // angry
            UIImage(named: "angry"),
            // disgusted
            UIImage(named: "sleeping"),
            // fear
            UIImage(named: "fear"),
            // kiss
            UIImage(named: "kiss"),
            // sad
            UIImage(named: "sad"),
            // sadness
            UIImage(named: "sadness"),
            // sleeping
            UIImage(named: "boring"),
            // surprised
            UIImage(named: "surprised"),
        ]
        
        static let emotion2 = [
            // none
//            UIImage(named: "square(3)"),
            UIImage(named: ""),
            // happy
            UIImage(named: "happy"),
            // angry
            UIImage(named: "angry2"),
            // disgusted
            UIImage(named: "sleeping2"),
            // fear
            UIImage(named: "fear2"),
            // kiss
            UIImage(named: "kiss2"),
            // sad
            UIImage(named: "sad2"),
            // sadness
            UIImage(named: "sadness2"),
            // sleeping
            UIImage(named: "boring2"),
            // surprised
            UIImage(named: "surprised2"),
        ]
    }
}
