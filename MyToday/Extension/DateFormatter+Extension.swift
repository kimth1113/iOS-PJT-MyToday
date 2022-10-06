//
//  DateFormatter+Extension.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/17.
//
import UIKit

class FormatterRepository {
    
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    static let calendarMonthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy\nMM"
        return formatter
    }()
    
    static let analysisMonthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM"
        return formatter
    }()
    
    static let dateMonthIdFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        return formatter
    }()

    
    static let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    static let monthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M"
        return formatter
    }()
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }()
    
    static let eDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()
    
    static let wordEDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        formatter.locale = Locale(identifier: "locale_identifier".localized)
        return formatter
    }()
    
    static let dateLabelFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd. (E)"
        formatter.locale = Locale(identifier: "locale_identifier".localized)
        return formatter
    }()
    
    static let diaryListFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "formatter_md".localized
        formatter.locale = Locale(identifier: "locale_identifier".localized)
        return formatter
    }()
}
