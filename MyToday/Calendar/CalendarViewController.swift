//
//  CalendarViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/07.
//

import UIKit
import FSCalendar
import SnapKit
import Toast

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
        super.loadView()
        
        view = mainView
        mainView.calendar.register(DIYCalendarCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        mainView.rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        mainView.headerButton.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainView.calendar.scope = .month
        mainView.headerButton.setTitle(self.monthFormatter.string(from: mainView.calendar.currentPage), for: .normal)
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
    
    @objc
    private func headerButtonTapped() {
        print("캘린더 월 버튼 탭")
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
    
    // CellForRow
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        
        let cell = mainView.calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position) as! DIYCalendarCell
        
        switch formatter.string(from: date) {
        case formatter.string(from: Date()):
            cell.titleImageView.image = Constants.BaseImage.Emotion.serious
        case "2022-09-03":
            cell.titleImageView.image = Constants.BaseImage.Emotion.happy
        case "2022-09-25":
            cell.titleImageView.image = Constants.BaseImage.Emotion.happy
        case "2022-09-20":
            cell.titleImageView.image = Constants.BaseImage.Emotion.serious
        default:
            cell.titleImageView.image = Constants.BaseImage.Emotion.none
        }
        
        return cell
    }
    
    // Title 색상 반환
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        switch dayFormatter.string(from: date) {
        case "Sat":
            return Constants.BaseColor.Calendar.saturday
        case "Sun":
            return Constants.BaseColor.Calendar.sunday
        default:
            return Constants.BaseColor.Calendar.weekday
        }
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        
        self.currentPage = calendar.currentPage
        mainView.headerButton.setTitle(self.monthFormatter.string(from: mainView.calendar.currentPage), for: .normal)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("did select date \(self.formatter.string(from: date))")
//        self.configureVisibleCells()
        
        self.view.makeToast(dayFormatter.string(from: date), duration: 2.0, point: CGPoint(x: mainView.bounds.width / 2, y: mainView.bounds.height - 150), title: nil, image: nil) { _ in
        }
    }
    
//    func calendar(_ calendar: FSCalendar, didDeselect date: Date) {
//        print("did deselect date \(self.formatter.string(from: date))")
//        self.configureVisibleCells()
//    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("did deselect date \(self.formatter.string(from: date))")
    }
    
//    private func configureVisibleCells() {
//
//        mainView.calendar.visibleCells().forEach { (cell) in
//            let date = mainView.calendar.date(for: cell)
//            let position = mainView.calendar.monthPosition(for: cell)
//            self.configure(cell: cell, for: date!, at: position)
//        }
//    }
    
//    private func configure(cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
//        print(#function)
//        let diyCell = (cell as! DIYCalendarCell)
//        // Custom today circle
//        diyCell.titleImageView.isHidden = !self.gregorian.isDateInToday(date)
//        // Configure selection layer
//
//    }
}


// Status Bar 설정
extension CalendarViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
        
    override var prefersStatusBarHidden: Bool {
        return false
    }
}
