//
//  MusicViewController.swift
//  MyTelephone
//
//  Created by Misael Pérez Chamorro on 4/18/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var songs: [Song] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Music.fetchSongs { (songs) in
      self.songs = songs
      self.tableView.reloadData()
    }
    // Do any additional setup after loading the view.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    tableView.isAccessibilityElement = true
    tableView.accessibilityIdentifier = "MusicTableView"
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */

}

extension MusicViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return songs.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath)
    let song = songs[indexPath.row]
    cell.textLabel?.text = song.name
    cell.detailTextLabel?.text = song.artist
    return cell
  }
  
}
