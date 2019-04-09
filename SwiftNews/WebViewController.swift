//
//  WebViewController.swift
//  SwiftNews
//
//  Created by seijiro on 2019/04/09.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {


  var newsURL:String! = String()

  @IBOutlet var toolbar: UIToolbar!
  @IBOutlet var backBtn: UIBarButtonItem!
  @IBOutlet var forwardBtn: UIBarButtonItem!
  @IBOutlet var refreshBtn: UIBarButtonItem!


  var webView:WKWebView!
  var urlString:String! = String()
  var indicator:UIActivityIndicatorView!


    override func viewDidLoad() {
        super.viewDidLoad()
      // webviewの初期化
      setWKWebView()
      // インディケーターの初期化
      setIndicator()
      //ボタン類
      backBtn.isEnabled = webView.canGoBack
      forwardBtn.isEnabled = webView.canGoForward
      webView.allowsLinkPreview = true

        // Do any additional setup after loading the view.
    }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // URLのロード
    guard let url = URL(string: newsURL) else {
      return dismiss(animated: true, completion: nil)
    }
    let req = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 100)
    self.webView.load(req)

  }
    
  @IBAction func back(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }

  func setWKWebView(){
    var frame = view.bounds
    frame.size.height = frame.height - UIApplication.shared.statusBarFrame.height - toolbar.frame.height - (navigationController?.navigationBar.frame.height ?? 0)
    webView = WKWebView(frame: frame)
    view.addSubview(webView)
    webView.navigationDelegate = self
  }

  func setIndicator(){
    indicator = UIActivityIndicatorView()
    indicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    indicator.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
    indicator.hidesWhenStopped = true
    indicator.style = .gray
    webView.addSubview(indicator)
  }

  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    decisionHandler(.allow)
  }

  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    indicator.startAnimating()
  }
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    print("finish load")
    indicator.stopAnimating()
    backBtn.isEnabled = webView.canGoBack
    forwardBtn.isEnabled = webView.canGoForward
  }

  @IBAction func tapBack(_ sender: Any) {
    self.webView.goBack()
  }


  @IBAction func tapForward(_ sender: Any) {
    self.webView.goForward()
  }

  @IBAction func tapRefresh(_ sender: Any) {
    self.webView.reload()
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
