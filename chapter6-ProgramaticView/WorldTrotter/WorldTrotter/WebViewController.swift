//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Nithi Prasanpanich on 2/16/16.
//  Copyright © 2016 Nithi. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
	
	var webView: WKWebView!
	
	
	override func loadView() {
		//Create a web view
		webView = WKWebView()


		view = webView
		

		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

		print("WebViewController loaded its view")

		


	}
	
	override func viewWillAppear(thing: Bool) {
		super.viewWillAppear(thing);
		let url = NSURL (string: "https://www.google.com");
		let requestObj = NSURLRequest(URL: url!);
		webView.loadRequest(requestObj);
		print(url)
		
	}
	

}

