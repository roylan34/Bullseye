//
//  AboutViewController.swift
//  Bullseye
//
//  Created by Vananaz Developer on 8/10/20.
//  Copyright © 2020 Roe Developer. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
   
   
   @IBOutlet weak var webView: WKWebView!

   override func viewDidLoad() {
      super.viewDidLoad()
      renderWebView()
   }
   
   @IBAction func close(){
      dismiss(animated: true, completion: nil)
   }
   
   func renderWebView(){
      if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
         let url = URL(fileURLWithPath: htmlPath);
         let request = URLRequest(url: url);
         webView.load(request);
      }
   }
   

}
