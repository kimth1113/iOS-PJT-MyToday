//
//  DiaryListView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/20.
//

import UIKit

class DiaryListView: BaseView {
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = Constants.BaseImage.background
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let searchButton: UIButton = {
        let view = UIButton()
        view.setTitle("검색", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    let headerLabel: UILabel = {
        let view = UILabel()
        view.text = "일기리스트"
        view.font = Constants.BaseFont.DiaryList.header
        view.textColor = .black
        view.layer.opacity = 0.6
        return view
    }()
    
    
    let emoticonCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: imageCollectionViewLayout())
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
    
    let diaryTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0)
        return view
    }()
    
    let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.backgroundColor = .clear
        view.tintColor = .white
        view.barTintColor = .clear
        view.searchTextField.textColor = .white
        view.searchTextField.placeholder = "기억나는 키워드를 입력해주세요."
        view.isHidden = true
        view.showsCancelButton = true
        view.layer.cornerRadius = 16
        return view
    }()
    
    override func configureUI() {
        [backgroundImage, searchButton, headerLabel, emoticonCollectionView, diaryTableView, searchBar, searchButton].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.trailing.equalTo(self).offset(-20)
            make.height.width.equalTo(40)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(safeAreaLayoutGuide)
        }
        
        searchBar.snp.makeConstraints { make in
            make.edges.equalTo(emoticonCollectionView)
        }
        
        emoticonCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(48)
        }
        
        diaryTableView.snp.makeConstraints { make in
            make.top.equalTo(emoticonCollectionView.snp.bottom)
            make.leading.trailing.bottom.equalTo(self)
        }
        
//        searchButton.snp.makeConstraints { make in
//            make.edges.equalTo(headerView.leftButtonView)
//        }
    }
    
    static func imageCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: 50, height: 32)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return layout
    }
}
