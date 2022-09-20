//
//  DiaryListViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/20.
//

import UIKit
import RealmSwift

class DiaryListViewController: BaseViewController {
    
    let mainView = DiaryListView()
    
    private let repository = DiaryRepository()
    
    var moveToReadVC: ((ReadViewController, Diary) -> Void)?
    
    private var diaryList: Results<Diary>! {
        didSet {
            mainView.diaryTableView.reloadData()
        }
    }
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.emoticonCollectionView.delegate = self
        mainView.emoticonCollectionView.dataSource = self
        mainView.emoticonCollectionView.register(EmotionCollectionViewCell.self, forCellWithReuseIdentifier: EmotionCollectionViewCell.reuseIdentifier)
        
        mainView.diaryTableView.delegate = self
        mainView.diaryTableView.dataSource = self
        mainView.diaryTableView.register(DiaryTableViewCell.self, forCellReuseIdentifier: DiaryTableViewCell.reuseIdentifier)
        mainView.diaryTableView.rowHeight = UITableView.automaticDimension
        mainView.diaryTableView.estimatedRowHeight = UITableView.automaticDimension
        mainView.diaryTableView.separatorStyle = .none

        
        diaryList = repository.getDiaryList()
    }
    
    override func configure() {
        
    }
}

extension DiaryListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.BaseImage.emotion.count - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmotionCollectionViewCell.reuseIdentifier, for: indexPath) as? EmotionCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setCellDate(indexPath: indexPath)
        
        return cell
    }
}

extension DiaryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiaryTableViewCell.reuseIdentifier) as? DiaryTableViewCell else {
            return UITableViewCell()
        }
        
        let diary = diaryList[indexPath.row]
        
        guard let date = FormatterRepository.formatter.date(from: diary.objectId) else { return UITableViewCell() }
        cell.dateLabel.text = FormatterRepository.diaryListFormatter.string(from: date)

        cell.emoticonImageView.image = Constants.BaseImage.emotion[diary.emoticonId]
        
        if let diaryContent = diary.content {
            cell.diaryContentLabel.text = diaryContent
        }
        
        if let diaryImage = loadImageFromDocument(fileName: diaryList[indexPath.row].objectId) {
            cell.diaryImageView.image = diaryImage
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(222)
        guard let moveToReadVC = moveToReadVC else { return }
        print(111)
        let vc = ReadViewController()
        
        moveToReadVC(vc, diaryList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let diary = diaryList[indexPath.row]
        
        if let _ = diary.content {
            return 196
        }
        
        if let _ = loadImageFromDocument(fileName: diary.objectId) {
            return 196
        }
        
        return 80
    }
}
