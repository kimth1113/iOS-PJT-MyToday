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
    
    let headerView: DiaryHeaderView = {
        let view = DiaryHeaderView()
        
        return view
    }()
    
    let emoticonCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: imageCollectionViewLayout())
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = Constants.BaseColor.TabBar.background
        return view
    }()
    
    let diaryTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        return view
    }()
    
    override func configureUI() {
        [backgroundImage, headerView, emoticonCollectionView, diaryTableView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self).inset(0)
        }
        
        emoticonCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.underline).offset(1)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(76)
        }
        
        diaryTableView.snp.makeConstraints { make in
            make.top.equalTo(emoticonCollectionView.snp.bottom)
            make.leading.trailing.bottom.equalTo(self)
        }
    }
    
    static func imageCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        return layout
    }
}
