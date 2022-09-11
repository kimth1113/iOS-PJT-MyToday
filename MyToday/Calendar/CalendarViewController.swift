//
//  CalendarViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/07.
//

import UIKit
import FSCalendar
import SnapKit

class CalendarViewController: BaseViewController {
    
    private let mainView = CalendarView()
    
    fileprivate let gregorian = Calendar(identifier: .gregorian)
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    private let monthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy\nMM"
        return formatter
    }()
    
    private let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter
    }()
    
    private var currentPage: Date?
    
    private lazy var today: Date = {
        return Date()
    }()

    override func loadView() {
        view = mainView
        
        mainView.calendar.register(DIYCalendarCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        mainView.rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainView.calendar.scope = .month
        mainView.headerLabel.text = self.monthFormatter.string(from: mainView.calendar.currentPage)
    }
    
    override func configure() {
        mainView.calendar.delegate = self
        mainView.calendar.dataSource = self
        
    }
    
    @objc
    private func leftButtonTapped(_ sender: UIButton) {
        scrollCurrentPage(isPrev: true)
    }
    
    @objc
    private func rightButtonTapped(_ sender: UIButton) {
        scrollCurrentPage(isPrev: false)
    }
    
    private func scrollCurrentPage(isPrev: Bool) {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = isPrev ? -1 : 1
            
        self.currentPage = cal.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        mainView.calendar.setCurrentPage(self.currentPage!, animated: true)
    }
    
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        print(date, "선택")
//    }
//
//    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        print(date, "해제")
//    }
    
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        print(#function)
        let cell = mainView.calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position) as! DIYCalendarCell
        print(date)
        
        
        switch formatter.string(from: date) {
        case formatter.string(from: Date()):
            cell.titleImageView.image = UIImage(named: "serious")
        case "2022-09-03":
            cell.titleImageView.image = UIImage(named: "smile")
        case "2022-09-25":
            cell.titleImageView.image = UIImage(named: "smile")
        case "2022-09-20":
            cell.titleImageView.image = UIImage(named: "serious")
        default:
            cell.titleImageView.image = UIImage(named: "square")
        }
        
        return cell
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        switch dayFormatter.string(from: date) {
        case "Sat":
            return .blue
        case "Sun":
            return .red
        default:
            return .white
        }
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        mainView.headerLabel.text = self.monthFormatter.string(from: mainView.calendar.currentPage)
    }
    
    // 날짜의 이미지
//    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//        let imageDateFormatter = DateFormatter()
//        imageDateFormatter.dateFormat = "yyyyMMdd"
//        
//        return UIImage(named: "smile")
//    }
    

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        // Here you can return specify the height of the cell.
//        return height!
//    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("did select date \(self.formatter.string(from: date))")
//        self.configureVisibleCells()
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date) {
        print("did deselect date \(self.formatter.string(from: date))")
        self.configureVisibleCells()
    }
    
    private func configureVisibleCells() {
        print(#function)
        mainView.calendar.visibleCells().forEach { (cell) in
            let date = mainView.calendar.date(for: cell)
            let position = mainView.calendar.monthPosition(for: cell)
            self.configure(cell: cell, for: date!, at: position)
        }
    }
    
    private func configure(cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
        print(#function)
        let diyCell = (cell as! DIYCalendarCell)
        // Custom today circle
        diyCell.titleImageView.isHidden = !self.gregorian.isDateInToday(date)
        // Configure selection layer
        
    }
}

