//
//  webkitViewController.swift
//  toolsEk
//
//  Created by 전은규 on 2022/08/25.
//
//
import UIKit
import WebKit

class webkitViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet var myWebKitView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebKitView.load(myRequest)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebKitView.navigationDelegate = self
        
        loadWebPage("https://github.com/Eunkyu-Jeon")
        // Do any additional setup after loading the view.
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    @IBAction func stopBtn(_ sender: UIBarButtonItem) {
        myWebKitView.stopLoading()
    }
    @IBAction func refreshBtn(_ sender: UIBarButtonItem) {
        myWebKitView.reload()
    }
    @IBAction func rewindBtn(_ sender: UIBarButtonItem) {
        myWebKitView.goBack()
    }
    @IBAction func fastFowardBtn(_ sender: UIBarButtonItem) {
        myWebKitView.goForward()
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
