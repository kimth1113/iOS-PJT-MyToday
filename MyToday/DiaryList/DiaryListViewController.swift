//
//  DiaryListViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/20.
//

import UIKit
import RealmSwift
import SnapKit

class DiaryListViewController: BaseViewController {
    
    let mainView = DiaryListView()
    
    private let repository = DiaryRepository()
    
    var moveToReadVC: ((ReadViewController, Diary) -> Void)?
    
    lazy var reloadDiaryList: (() -> Void) = {
        self.mainView.diaryTableView.reloadData()
    }
    
    let emotionList = ["전체", "행복", "설렘", "보통", "화남", "슬픔", "당황", "아픔", "지루", "피곤"]
    
    private var diaryList: Results<Diary>! {
        didSet {
            mainView.diaryTableView.reloadData()
        }
    }
    
    private var currentEmotion: Int = 0 {
        didSet {
            mainView.emoticonCollectionView.reloadData()
        }
    }
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tapTerm = UITapGestureRecognizer(target: self, action: nil)
//        tapTerm.delegate = self
//        mainView.addGestureRecognizer(tapTerm)
        
//        mainView.searchBar.delegate = self
        
        mainView.emoticonCollectionView.delegate = self
        mainView.emoticonCollectionView.dataSource = self
        mainView.emoticonCollectionView.register(EmotionCollectionViewCell.self, forCellWithReuseIdentifier: EmotionCollectionViewCell.reuseIdentifier)
        
        mainView.diaryTableView.delegate = self
        mainView.diaryTableView.dataSource = self
        mainView.diaryTableView.register(DefaultCell.self, forCellReuseIdentifier: DefaultCell.reuseIdentifier)
        mainView.diaryTableView.register(FullCell.self, forCellReuseIdentifier: FullCell.reuseIdentifier)
//        mainView.diaryTableView.rowHeight = UITableView.automaticDimension
//        mainView.diaryTableView.estimatedRowHeight = UITableView.automaticDimension
        mainView.diaryTableView.separatorStyle = .none
        mainView.diaryTableView.contentInset.top = 8
        mainView.diaryTableView.contentInset.bottom = 40
        
        diaryList = repository.getDiaryList(emoticonId: nil)
        
        // 버튼 등록
//        mainView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    override func configure() {
        
    }
    
    
}

extension DiaryListViewController {
    
    func setLineSpacing(lbl: UILabel) -> Void {
        let attrString = NSMutableAttributedString(string: lbl.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        lbl.attributedText = attrString
    }
    
//    @objc
//    private func searchButtonTapped(_ sender: UIButton) {
//        mainView.searchBar.isHidden = false
//        diaryList = repository.getDiaryList(emoticonId: nil)
//        mainView.searchBar.searchTextField.becomeFirstResponder()
//    }
}

extension DiaryListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emotionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmotionCollectionViewCell.reuseIdentifier, for: indexPath) as? EmotionCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setCellDate(emotionLabel: emotionList[indexPath.row])
        
        if indexPath.row == currentEmotion {
            cell.emotionLabel.backgroundColor = #colorLiteral(red: 0, green: 0.4800075889, blue: 1, alpha: 0.5)
        } else {
            cell.emotionLabel.backgroundColor = UIColor(red: 34/255, green: 166/255, blue: 179/255, alpha: 0.5)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            diaryList = repository.getDiaryList(emoticonId: nil)
        } else {
            diaryList = repository.getDiaryList(emoticonId: indexPath.row)
        }

        currentEmotion = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
}

extension DiaryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let defaultCell = tableView.dequeueReusableCell(withIdentifier: DefaultCell.reuseIdentifier) as? DefaultCell else {
            return UITableViewCell()
        }
        guard let fullCell = tableView.dequeueReusableCell(withIdentifier: FullCell.reuseIdentifier) as? FullCell else {
            return UITableViewCell()
        }
        
        let diary = diaryList[indexPath.row]
        
        guard let diaryDate = FormatterRepository.formatter.date(from: diary.objectId) else { return UITableViewCell() }
        
        let year = FormatterRepository.yearFormatter.string(from: diaryDate)
        let month = FormatterRepository.monthFormatter.string(from: diaryDate)
        let date = FormatterRepository.dateFormatter.string(from: diaryDate)
        let eDate = FormatterRepository.eDateFormatter.string(from: diaryDate)
        
        if let diaryImage = loadImageFromDocument(fileName: diaryList[indexPath.row].objectId), let diaryContent = diary.content, diary.content != "" {
            // 둘다
            fullCell.cellDefaultView.emoticonImageView.image = Constants.BaseImage.emotion2[diary.emoticonId]
            fullCell.cellFullView.diaryImageView.image = diaryImage
            fullCell.cellFullView.diaryContentlabel.text = diaryContent
            setLineSpacing(lbl: fullCell.cellFullView.diaryContentlabel)
            fullCell.cellDefaultView.yearLabel.text = year
            fullCell.cellDefaultView.dateLabel.text = "\(month)월 \(date)일"
            fullCell.cellDefaultView.eDateLabel.text = "\(eDate)요일"
            return fullCell
        } else if let diaryImage = loadImageFromDocument(fileName: diaryList[indexPath.row].objectId) {
            // 이미지만
            fullCell.cellDefaultView.emoticonImageView.image = Constants.BaseImage.emotion2[diary.emoticonId]
            fullCell.cellFullView.diaryImageView.image = diaryImage
            fullCell.cellDefaultView.yearLabel.text = year
            fullCell.cellDefaultView.dateLabel.text = "\(month)월 \(date)일"
            fullCell.cellDefaultView.eDateLabel.text = "\(eDate)요일"
            fullCell.cellFullView.noContentLabel.text = "일기 미작성"
            return fullCell
        } else if let diaryContent = diary.content {
            // 글만
            fullCell.cellDefaultView.emoticonImageView.image = Constants.BaseImage.emotion2[diary.emoticonId]
            fullCell.cellFullView.diaryContentlabel.text = diaryContent
            setLineSpacing(lbl: fullCell.cellFullView.diaryContentlabel)
            fullCell.cellDefaultView.yearLabel.text = year
            fullCell.cellDefaultView.dateLabel.text = "\(month)월 \(date)일"
            fullCell.cellDefaultView.eDateLabel.text = "\(eDate)요일"
            fullCell.cellFullView.diaryImageView.image = nil
            fullCell.cellFullView.diaryImageView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
            return fullCell
        } else {
            // 기본
            defaultCell.cellDefaultView.emoticonImageView.image = Constants.BaseImage.emotion2[diary.emoticonId]
            defaultCell.cellDefaultView.yearLabel.text = year
            defaultCell.cellDefaultView.dateLabel.text = "\(month)월 \(date)일"
            defaultCell.cellDefaultView.eDateLabel.text = "\(eDate)요일"
            return defaultCell
        }
    }
    
    // didSelectRow
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainView.searchBar.isHidden = true
        
        let vc = ReadViewController()
        vc.reloadDiaryList = reloadDiaryList
        vc.diary = diaryList[indexPath.row]
        transition(vc, transitionStyle: .present)
    }
    
    // 오른쪽 스와이프
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let diary = diaryList[indexPath.row]
        
        return swipeConfiguration() {
            self.removeImageFromDocument(fileName: diary.objectId)
            self.repository.delete(diary: self.repository.localRealm.object(ofType: Diary.self, forPrimaryKey: diary.objectId)!)
            
            self.mainView.diaryTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let diary = diaryList[indexPath.row]
        
        if let _ = loadImageFromDocument(fileName: diaryList[indexPath.row].objectId), let _ = diary.content, diary.content != "" {
            return 248
        } else if let _ = loadImageFromDocument(fileName: diaryList[indexPath.row].objectId) {
            return 248
        } else if let _ = diary.content {
            return 248
        } else {
            return 80
        }
    }
    
    func swipeConfiguration(completion: @escaping () -> Void) -> UISwipeActionsConfiguration {
        
        var action: UIContextualAction?
       
        let bin = UIContextualAction(style: .normal, title: nil) { action, view, completionHandler in
            
            completion()
        }
        
        bin.image = UIImage(systemName: "trash.fill")
        bin.backgroundColor = .systemPink
        
        action = bin

        guard let action = action else {
            return UISwipeActionsConfiguration()
        }

        let pinConfiguration: UISwipeActionsConfiguration = {
            
            let configuration = UISwipeActionsConfiguration(actions: [action])
            return configuration
        }()
        
        return pinConfiguration
    }
}

//extension DiaryListViewController: UISearchBarDelegate {
//
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        searchBar.showsCancelButton = true
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        guard let text = searchBar.text else { return }
//
//        diaryList = repository.search(text: text)
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        mainView.searchBar.resignFirstResponder()
//        mainView.searchBar.isHidden = true
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        mainView.searchBar.resignFirstResponder()
//    }
//
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        mainView.searchBar.resignFirstResponder()
//    }
//}

