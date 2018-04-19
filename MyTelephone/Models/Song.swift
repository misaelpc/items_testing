//
//  Song.swift
//  MyTelephone
//
//  Created by Misael Pérez Chamorro on 4/18/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import Foundation

struct Song {
  var artist: String
  var name: String
  
  static func create(dict: NSDictionary) -> Song {
    let name = dict["trackName"] as! String
    let artist = dict["artistName"] as! String
    return Song(artist: artist, name: name)
  }
  
}
