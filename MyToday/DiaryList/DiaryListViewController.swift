//
//  DiaryListViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/20.
//

import UIKit
import RealmSwift
import SnapKit
import Alamofire
import SwiftyJSON

class DiaryListViewController: BaseViewController {
    
    let mainView = DiaryListView()
    
    private let repository = DiaryRepository()
    
    var moveToReadVC: ((ReadViewController, Diary) -> Void)?
    
    lazy var reloadDiaryList: (() -> Void) = {
        self.mainView.diaryTableView.reloadData()
    }
    
    let emotionList = ["전체", "행복", "화남", "아픔", "절망", "사랑", "긴장", "슬픔", "피곤", "당황"]
    
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
        
        mainView.searchBar.delegate = self
        
        mainView.emoticonCollectionView.delegate = self
        mainView.emoticonCollectionView.dataSource = self
        mainView.emoticonCollectionView.register(EmotionCollectionViewCell.self, forCellWithReuseIdentifier: EmotionCollectionViewCell.reuseIdentifier)
        
        mainView.diaryTableView.delegate = self
        mainView.diaryTableView.dataSource = self
        mainView.diaryTableView.register(DefaultCell.self, forCellReuseIdentifier: DefaultCell.reuseIdentifier)
        mainView.diaryTableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.reuseIdentifier)
        mainView.diaryTableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.reuseIdentifier)
        mainView.diaryTableView.register(FullCell.self, forCellReuseIdentifier: FullCell.reuseIdentifier)
//        mainView.diaryTableView.rowHeight = UITableView.automaticDimension
//        mainView.diaryTableView.estimatedRowHeight = UITableView.automaticDimension
        mainView.diaryTableView.separatorStyle = .none
        mainView.diaryTableView.contentInset.top = 8
        mainView.diaryTableView.contentInset.bottom = 40
        
        diaryList = repository.getDiaryList(emoticonId: nil)
        
        // 버튼 등록
        mainView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    override func configure() {
        
    }
    
    
}

extension DiaryListViewController {
    
    func setLineSpacing(lbl: UILabel) -> Void {
        let attrString = NSMutableAttributedString(string: lbl.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        lbl.attributedText = attrString
    }
    
    @objc
    private func searchButtonTapped(_ sender: UIButton) {
        mainView.searchBar.isHidden = false
        diaryList = repository.getDiaryList(emoticonId: nil)
        mainView.searchBar.searchTextField.becomeFirstResponder()
    }
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
            cell.emotionLabel.backgroundColor = .systemBlue
        } else {
            cell.emotionLabel.backgroundColor = UIColor(red: 34/255, green: 166/255, blue: 179/255, alpha: 0.5)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row, "선택")
        
        if indexPath.row == 0 {
            diaryList = repository.getDiaryList(emoticonId: nil)
        } else {
            diaryList = repository.getDiaryList(emoticonId: indexPath.row)
        }
        
        currentEmotion = indexPath.row
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(indexPath.row, "미선택")
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
        guard let imageCell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reuseIdentifier) as? ImageCell else {
            return UITableViewCell()
        }
        guard let contentCell = tableView.dequeueReusableCell(withIdentifier: ContentCell.reuseIdentifier) as? ContentCell else {
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
            fullCell.cellDefaultView.emoticonImageView.image = Constants.BaseImage.emotion2[diary.emoticonId]
            fullCell.cellImageView.diaryImageView.image = diaryImage
            fullCell.cellContentView.diaryContentlabel.text = diaryContent
            setLineSpacing(lbl: fullCell.cellContentView.diaryContentlabel)
            fullCell.cellDefaultView.yearLabel.text = year
            fullCell.cellDefaultView.dateLabel.text = "\(month)월 \(date)일"
            fullCell.cellDefaultView.eDateLabel.text = "\(eDate)요일"
            return fullCell
        } else if let diaryImage = loadImageFromDocument(fileName: diaryList[indexPath.row].objectId) {
            imageCell.cellDefaultView.emoticonImageView.image = Constants.BaseImage.emotion2[diary.emoticonId]
            imageCell.cellImageView.diaryImageView.image = diaryImage
            imageCell.cellDefaultView.yearLabel.text = year
            imageCell.cellDefaultView.dateLabel.text = "\(month)월 \(date)일"
            imageCell.cellDefaultView.eDateLabel.text = "\(eDate)요일"
            return imageCell
        } else if let diaryContent = diary.content {
            contentCell.cellDefaultView.emoticonImageView.image = Constants.BaseImage.emotion2[diary.emoticonId]
            contentCell.cellContentView.diaryContentlabel.text = diaryContent
            setLineSpacing(lbl: contentCell.cellContentView.diaryContentlabel)
            contentCell.cellDefaultView.yearLabel.text = year
            contentCell.cellDefaultView.dateLabel.text = "\(month)월 \(date)일"
            contentCell.cellDefaultView.eDateLabel.text = "\(eDate)요일"
            return contentCell
        } else {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let diary = diaryList[indexPath.row]
        
        if let _ = loadImageFromDocument(fileName: diaryList[indexPath.row].objectId), let _ = diary.content, diary.content != "" {
            return 384
        } else if let _ = loadImageFromDocument(fileName: diaryList[indexPath.row].objectId) {
            return 284
        } else if let _ = diary.content {
            return 184
        } else {
            return 80
        }
    }
    
    
}

extension DiaryListViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }
        
        diaryList = repository.search(text: text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        mainView.searchBar.resignFirstResponder()
        mainView.searchBar.isHidden = true
    }
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainView.searchBar.resignFirstResponder()
        print("검색 버튼 클릭")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        mainView.searchBar.resignFirstResponder()
        print("편집 끝")
    }
}

