//
//  StartViewController.swift
//  SwiftNews
//
//  Created by seijiro on 2019/04/09.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var nextButton: UIButton!
  @IBOutlet var background: UIImageView!
  override func viewDidLoad() {
        super.viewDidLoad()

    background.addBackgroundPxEffect(strength: .Mid)
    titleLabel.addMiddlegroundPxEffect()
    nextButton.addForegroundPxEffect(strength: .High)
        // Do any additional setup after loading the view.
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
