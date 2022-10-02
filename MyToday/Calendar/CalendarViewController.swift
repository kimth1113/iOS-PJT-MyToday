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
    
    let mainView = CalendarView()
    
    private let repository = DiaryRepository()
    
    fileprivate let gregorian = Calendar(identifier: .gregorian)
    
    private var currentPage: Date? {
        didSet {
            if FormatterRepository.calendarMonthFormatter.string(from: currentPage!) == FormatterRepository.calendarMonthFormatter.string(from: Date()) {
                mainView.comeBackButton.isHidden = true
            } else {
                mainView.comeBackButton.isHidden = false
            }
        }
    }
    
    private lazy var today: Date = {
        return Date()
    }()
    
    lazy var reloadCalendar: () -> () = {
        self.mainView.calendar.reloadData()
    }
    
    lazy var goThisMonth: ((Date) -> Void)? = { date in
        self.mainView.calendar.select(date)
    }
    
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
        mainView.comeBackButton.addTarget(self, action: #selector(comeBackButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainView.calendar.scope = .month
        mainView.headerButton.setTitle(FormatterRepository.calendarMonthFormatter.string(from: mainView.calendar.currentPage), for: .normal)
    }
    
    override func configure() {
        mainView.calendar.delegate = self
        mainView.calendar.dataSource = self
    }
    
    @objc
    private func comeBackButtonTapped(_ sender: UIButton) {
        mainView.calendar.select(Date())
        mainView.calendar.appearance.titleSelectionColor = .white
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
        let vc = DateAlertViewController()
        vc.goThisMonth = goThisMonth
        transition(vc, transitionStyle: .present)
    }
    
    private func scrollCurrentPage(isPrev: Bool) {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = isPrev ? -1 : 1
            
        currentPage = cal.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        mainView.calendar.setCurrentPage(self.currentPage!, animated: true)
    }
    
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    // CellForRow
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        
        let cell = mainView.calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position) as! DIYCalendarCell
        
        if FormatterRepository.formatter.string(from: Date()) == FormatterRepository.formatter.string(from: date) {
            cell.titleLabel.layer.opacity = 1
        } else if Date() < date {
            cell.titleLabel.layer.opacity = 0.4
        } else {
            cell.titleLabel.layer.opacity = 0.7
        }
        
        let date = FormatterRepository.formatter.string(from: date)
        if let diary = repository.getDiary(date: date) {
            cell.titleImageView.image = Constants.BaseImage.emotion[diary.emoticonId]
        } else {
            cell.titleImageView.image = Constants.BaseImage.emotion[0]
            cell.titleImageView.layer.opacity = 0.7
        }
        
        
        return cell
    }
    
    // Title 색상 반환
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        if FormatterRepository.formatter.string(from: date) == FormatterRepository.formatter.string(from: Date()) {
            return .white
        }
        
        switch FormatterRepository.eDateFormatter.string(from: date) {
        case "토":
            return UIColor(rgb: 0x3742fa)
        case "일":
            return .red
        default:
            return Constants.BaseColor.Calendar.weekday
        }
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        mainView.calendar.appearance.titleSelectionColor = .none
        self.currentPage = calendar.currentPage
        mainView.headerButton.setTitle(FormatterRepository.calendarMonthFormatter.string(from: mainView.calendar.currentPage), for: .normal)
    }
    
    // didSelect
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        switch FormatterRepository.eDateFormatter.string(from: date) {
        case "토":
            calendar.appearance.titleSelectionColor = UIColor(rgb: 0x3742fa)
        case "일":
            calendar.appearance.titleSelectionColor = .red
        default:
            calendar.appearance.titleSelectionColor = Constants.BaseColor.Calendar.weekday
        }
        
        if FormatterRepository.formatter.string(from: date) == FormatterRepository.formatter.string(from: Date()) {
            calendar.appearance.titleSelectionColor = .white
        }
        
        guard FormatterRepository.monthFormatter.string(from: calendar.currentPage) == FormatterRepository.monthFormatter.string(from: date) else {
            return
        }
        
        if date > Date() {
            return
        }
        
        self.view.makeToast(FormatterRepository.eDateFormatter.string(from: date), duration: 2.0, point: CGPoint(x: mainView.bounds.width / 2, y: mainView.bounds.height - 150), title: nil, image: nil) { _ in
        }
        
        let vc = ReadViewController()
        let date = FormatterRepository.formatter.string(from: date)
        
        if let diary = repository.getDiary(date: date) {
            vc.diary = diary
        } else {
            vc.diary = Diary(objectId: date, emotionId: 0, content: nil)
        }
        
        vc.reloadCalendar = reloadCalendar
        transition(vc, transitionStyle: .present)
    }
    
//    func calendar(_ calendar: FSCalendar, didDeselect date: Date) {
//        print("did deselect date \(self.formatter.string(from: date))")
//        self.configureVisibleCells()
//    }
    
    // didDeselect
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
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
