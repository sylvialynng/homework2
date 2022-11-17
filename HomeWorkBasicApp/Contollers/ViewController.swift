//
//  ViewController.swift
//  HomeWorkBasicApp
//
//  Created by Sylvia Graham on 11/13/22.
//

import UIKit

class ViewController: UIViewController {
    //Basic Table View For Scrolling
    var tableView: UITableView?
    
    //Initializer
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setUpUI()
    }
    init(){
        super.init(nibName: nil, bundle: nil )
        self.setUpUI()
    }
    required init?(coder: NSCoder) {
        //Boiler Plate
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setUpUI()
    }
    
    //called from init
    private func setUpUI(){
        self.view.backgroundColor = .systemTeal
        self.title = "Pirates of the Gulf of Galveston"
        let table = UITableView(frame: .zero)
        table.delegate = self
        
        //translate....Constraints is defaulted to true
        //allows us to use programatic constraints
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.dataSource = self
        table.delegate = self
        
        table.backgroundColor = .systemPink
        
        //register the data
        table.register(HomeWorkTableViewCell.self, forCellReuseIdentifier: "HWCell")
        //Add view to Heirarchy
        self.view.addSubview(table)

        
        //table constraints
        table.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8).isActive = true
        table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8).isActive = true
        table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 8).isActive = true
        table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 8).isActive = true

    
        
        //Add height constraints between the UITableViewCell’s elements and its contentView
        let topConstraint = table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let leadingConstraint = table.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8)
        let trailingConstraint = table.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        let bottomConstraint = table.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        
        //bind them with to the layoutConstraint
         NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
       
        self.tableView = table
        
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HWCell", for: indexPath) as? HomeWorkTableViewCell
        else{
            fatalError("deque reusable does not match registered name")
        }
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let detailVC = DetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

