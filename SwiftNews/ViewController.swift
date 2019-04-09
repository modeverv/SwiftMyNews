//
//  ViewController.swift
//  SwiftNews
//
//  Created by seijiro on 2019/04/05.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit

class ViewController: AMPagerTabsViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    settings.tabBackgroundColor = UIColor.green
    settings.tabButtonColor = UIColor.green

    tabFont = UIFont.systemFont(ofSize: 17, weight: .bold)

    self.viewControllers = getTabs()
  }

  func getTabs() -> [UIViewController] {
    let vc2 = storyboard?.instantiateViewController(withIdentifier: "vc2") as! ViewController2
    let vc3 = storyboard?.instantiateViewController(withIdentifier: "vc3") as! ViewController3
    let vc4 = storyboard?.instantiateViewController(withIdentifier: "vc4") as! ViewController4
    vc2.title = "本日のトピック"
    vc3.title = "本日のエンタメ動画"
    vc4.title = "おもしろ"

    return [vc2,vc3,vc4]


  }


}

