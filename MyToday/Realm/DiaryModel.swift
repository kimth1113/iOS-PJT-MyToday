//
//  DiaryModel.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/16.
//

import Foundation
import RealmSwift

class Diary: Object {
    
    @Persisted(primaryKey: true) var objectId: String
    @Persisted var emoticonId: Int
    @Persisted var content: String?
    
    convenience init(objectId: String, emotionId: Int, content: String?) {
        self.init()
        self.objectId = objectId
        self.emoticonId = emotionId
        self.content = content
    }
}
