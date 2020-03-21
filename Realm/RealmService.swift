//
//  RealmService.swift
//  dailyDiary
//
//  Created by Apple on 2020/03/12.
//  Copyright © 2020 minjae. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {

    private init() {}

    static let shared = RealmService()

    var realm = try! Realm()

    func create<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            post(error)
        }
    }
    func read() {

    }

    func update<T: Object>(_ object: T, with dictionary: [String: Any?]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }

            }
        } catch {
            post(error)
        }
    }
    func delete<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            post(error)
        }
    }

    func post(_ error: Error) {
        NotificationCenter.default.post(name: NSNotification.Name("Realm Error"), object: error)
    }
    func observeRealmErrors(in vc: UIViewController, completion: @escaping (Error?) -> Void) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("RealmError"), object: nil, queue: nil) { (notification) in
            completion(notification.object as? Error)
        }
    }

    func stopObservingErrors(in vc: UIViewController) {
        NotificationCenter.default.removeObserver(vc, name: NSNotification.Name("RealmError"), object: nil)
    }

}
