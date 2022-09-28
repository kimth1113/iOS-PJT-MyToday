//
//  DairyRepository.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/16.
//

import Foundation
import RealmSwift

class DiaryRepository {
    
    let localRealm = try! Realm()
    
    func create(diary: Diary) {
        do {
            try localRealm.write {
                localRealm.add(diary)
            }
        } catch let error {
            print(error)
        }
    }
    
    func updateDiary(diary: Diary, newEmoticonId: Int, newContent: String?) {
        do {
            try localRealm.write {
                diary.emoticonId = newEmoticonId
                diary.content = newContent
            }
        } catch let error {
            print(error)
        }
    }
    
    func getDiary(date: String) -> Diary? {
        return localRealm.object(ofType: Diary.self, forPrimaryKey: date)
    }
    
    func getDiaryList(emoticonId: Int?) -> Results<Diary> {
        
        if let emoticonId = emoticonId {
            return localRealm.objects(Diary.self).filter("emoticonId=\(emoticonId)").sorted(byKeyPath: "objectId", ascending: false)
        }
        return localRealm.objects(Diary.self).sorted(byKeyPath: "objectId", ascending: false)
    }
    
    func search(text: String) -> Results<Diary> {
        return localRealm.objects(Diary.self).filter("content CONTAINS[c] '\(text)'").sorted(byKeyPath: "objectId", ascending: false)
    }
}
