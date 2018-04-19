//
//  Music.swift
//  MyTelephone
//
//  Created by Misael Pérez Chamorro on 4/18/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import Foundation

class Music {
  static var urlSession = URLSession(configuration: URLSessionConfiguration.default)

  static func fetchSongs(onFetchSongs: @escaping ([Song]) -> Void ){
    let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
    let dataTask = urlSession.dataTask(with: url!) { data, response, error in
      if error == nil {
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {return}
        if statusCode == 200 {
          guard let json = parseData(data: data!) else {return}
          let songs = songsFrom(json: json)
          onFetchSongs(songs)
        }
      } else {
        return
      }
    }
    dataTask.resume()
  }
  
  static func parseData(data: Data) -> NSDictionary? {
    let json = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
    return json
  }
  
  static func songsFrom(json: NSDictionary) -> [Song] {
    let results = json["results"] as! [NSDictionary]
    var songs:[Song] = []
    for dataResult in results {
      let song = Song.create(dict: dataResult)
      songs.append(song)
    }
    return songs
  }
}
