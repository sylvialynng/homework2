//
//  DetailViewControllerlViewController.swift
//  HomeWorkBasicApp
//
//  Created by Consultant on 11/14/22.
//

import UIKit


class DetailViewController: UIViewController {


    override func loadView(){
        super.loadView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBrown
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(true)
    }
    override func  viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
    }
        
    override func viewDidDisappear(_ animated: Bool){
            super.viewDidDisappear(animated)
     }
}
