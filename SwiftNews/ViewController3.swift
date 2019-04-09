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

class ViewController3: UIViewController,UITableViewDelegate,UITableViewDataSource {
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
    // high light dismiss
    if let indexPathRow = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: indexPathRow, animated: true)
    }
    // move ViewController
    performSegue(withIdentifier: "webView", sender: nil)


  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "webView" {
      let vc = segue.destination as! WebViewController
      vc.newsURL = posts[selectedNumber].newsURL
    }
  }


  //@IBOutlet var refreshBtn: UIButton!

  //@IBOutlet var tableView: UITableView!

  @IBOutlet var tableView: UITableView!

  @IBOutlet var refreshBtn: UIButton!

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

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetchPosts()
    tableView.reloadData()
  }


  func fetchPosts(){
    self.posts = [Post]()
    self.post = Post()
    // https://swiftnews-3c1cc.firebaseio.com
    let ref = Database.database().reference()
    ref.child("post2").queryLimited(toFirst: 10).observeSingleEvent(of: .value) { (snap, error) in
      let snapPosts = snap.value as? [String:NSDictionary]
      if snapPosts == nil {
        return
      }
      self.posts = [Post]()
      
      for (_, p) in snapPosts! {
              self.post = Post()
        if let title = p["title"] as? String,let newsURL = p["newsURL"] as? String {
          self.post.title = title
          self.post.newsURL = newsURL
        }
        self.posts.append(self.post)
      }
      self.tableView.reloadData()
    }
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }

  @IBAction func refresh(_ sender: Any) {
    fetchPosts()
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
