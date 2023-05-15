////@main
//import SQLite
//import UIKit
//
//let path = NSSearchPathForDirectoriesInDomains(
//    .documentDirectory, .userDomainMask, true
//).first!
//
//let db = try! Connection("\(path)/db.sqlite3")
//
//func createPostsTable() {
//    let posts = Table("posts")
//    let postID = Expression<Int64>("postID")
//    let name = Expression<String>("name")
//    let title = Expression<String>("title")
//
//    do{
//        try db.run(posts.create { t in
//            t.column(postID, primaryKey: .autoincrement)
//            t.column(name)
//            t.column(title)
//        })
//    }
//    catch{
//        print("Table already created.")
//    }
////    let posts = Table("posts")
//    
////    try! db.run(posts.drop())
//
////    try! db.run(posts.insert(name <- "AP"))
//}
//
//
//
//
//func insertPost(userName: String, postTitle: String) {
//    do{
//        let posts = Table("posts")
//        let name = Expression<String>("name")
//        let title = Expression<String>("title")
//        try db.run(posts.insert(name <- userName, title <- postTitle))
//    }
//    catch{
//        print("Error inserting user: \(error.localizedDescription)")
//    }
//}
//    
//    
//func getAllUsers() {
//    let posts = Table("posts")
//    let postID = Expression<Int64>("postID")
//    let name = Expression<String>("name")
//    let title = Expression<String>("title")
//
//    do {
//        for user in try db.prepare(posts) {
//            print("postID: \(user[postID]), name: \(user[name]) title: \(user[title])")
//        }
//    } catch {
//        print(error)
//    }
//}
//
