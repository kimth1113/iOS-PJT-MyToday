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
        static let topBackground = UIImage(named: "nordwood-themes-R53t-Tg6J4c-unsplash")
        
        static let pencel = UIImage(named: "pencils (1)")
        
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
        
        enum Analysis {
            static let background = UIImage(named: "eberhard-grossgasteiger-S-2Ukb_VqpA-unsplash")
        }
        
        static let emotion = [
            UIImage(named: ""),
            UIImage(named: "happy"),
            UIImage(named: "kiss"),
            UIImage(named: "normal"),
            UIImage(named: "angry"),
            UIImage(named: "sad"),
            UIImage(named: "fear"),
            UIImage(named: "sick"),
            UIImage(named: "boring"),
            UIImage(named: "sleeping"),
        ]
        
        static let emotion2 = [
            UIImage(named: ""),
            UIImage(named: "happy2"),
            UIImage(named: "kiss2"),
            UIImage(named: "normal2"),
            UIImage(named: "angry2"),
            UIImage(named: "sad2"),
            UIImage(named: "fear2"),
            UIImage(named: "sick2"),
            UIImage(named: "boring2"),
            UIImage(named: "sleeping2"),
        ]
    }
}
