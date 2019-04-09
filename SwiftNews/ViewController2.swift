//
//  ViewController2.swift
//  SwiftNews
//
//  Created by seijiro on 2019/04/09.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit
import Firebase
import DTGradientButton

class ViewController2: UIViewController,UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let textLabel = cell.viewWithTag(1) as! UILabel
    textLabel.text = posts[indexPath.row].title
    return cell
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //タッチされたcell
    selectedNumber = indexPath.row

  }



  @IBOutlet var refreshBtn: UIButton!

  @IBOutlet var tableView: UITableView!

  var posts = [Post]()
  var post = Post()
  var selectedNumber = 0

  override func viewDidLoad() {
        super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    refreshBtn.setGradientBackgroundColors([UIColor.init(hex: "FF8960"),UIColor(hex: "FF62A5")], direction: .toRight, for: .normal)
    refreshBtn.layer.cornerRadius = refreshBtn.frame.height / 2
    refreshBtn.layer.masksToBounds = true

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
