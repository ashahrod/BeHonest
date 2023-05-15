//@main
import SQLite
import MapKit
import UIKit

let path = NSSearchPathForDirectoriesInDomains(
    .documentDirectory, .userDomainMask, true
).first!

let db = try! Connection("\(path)/db.sqlite3")

func createPostsTable() {
    let posts = Table("posts")
    let postID = Expression<Int64>("postID")
    let caption = Expression<String>("caption")
    let longitude = Expression<String>("longitude")
    let latitude = Expression<String>("latitude")

    do{
        try db.run(posts.create { t in
            t.column(postID, primaryKey: .autoincrement)
            t.column(caption)
            t.column(longitude)
            t.column(latitude)
        })
    }
    catch{
        print("Table already created.")
    }
//    let posts = Table("posts")
    
//    try! db.run(posts.drop())

//    try! db.run(posts.insert(name <- "AP"))
}




func insertPost(dbcaption: String, dblongitude: String, dblatitude: String) {
    do{
        let posts = Table("posts")
        let caption = Expression<String>("caption")
        let longitude = Expression<String>("longitude")
        let latitude = Expression<String>("latitude")
        try db.run(posts.insert(caption <- dbcaption, longitude <- dblongitude, latitude <- dblatitude))
    }
    catch{
        print("Error inserting user: \(error.localizedDescription)")
    }
}
    
    
func printAllUsers() {
    let posts = Table("posts")
    let postID = Expression<Int64>("postID")
    let caption = Expression<String>("caption")
    let longitude = Expression<String>("longitude")
    let latitude = Expression<String>("latitude")

    do {
        for user in try db.prepare(posts) {
            print("postID: \(user[postID]), caption: \(user[caption]), longitude: \(user[longitude]), latitude: \(user[latitude])")
        }
    } catch {
        print(error)
    }
}


func getAllUsers() -> [Post] {
    let posts = Table("posts")
    let postID = Expression<Int64>("postID")
    let caption = Expression<String>("caption")
    let longitude = Expression<String>("longitude")
    let latitude = Expression<String>("latitude")

    var postArray: [Post] = []
    
    do {
        for user in try db.prepare(posts) {
//            Post(id: \(user[postID], caption: \(user[caption]), longitude: \(user[longitude]), latitude: \(user[latitude]))
            postArray.append(Post(id: Int(user[postID]), caption: user[caption], longitude: Double(user[longitude]) ?? 0.0, latitude: Double(user[latitude]) ?? 0.0))
            print("postID: \(user[postID]), caption: \(user[caption]), longitude: \(user[longitude]), latitude: \(user[latitude])")
        }
    } catch {
        print(error)
    }
    return postArray
}
