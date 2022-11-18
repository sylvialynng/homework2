//
//  DetailViewControllerlViewController.swift
//  HomeWorkBasicApp
//
//  Created by Consultant on 11/14/22.
//
import UIKit


class DetailViewController: UIViewController {
    var imageName = ""
    var label1 = ""
    var label2 = ""
    //Basic Table View For Scrolling
    var tableView: UITableView?
    var iamgeView: UIImageView?
    var label_one = UILabel()
    var label_two = UILabel()

    init(imageName: String, label1: String, label2: String){
        super.init(nibName: nil, bundle: nil)
        self.imageName = imageName
        self.label_one.text = label1
        self.label_two.text = label2
        print ("********************************** \(imageName) ************************************")
        self.setupUI()
    }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
                  
    }
    func setupUI(){
        self.view.backgroundColor = .systemPurple
        self.title = "Pirates of the Gulf of Galveston"

        
        //iamge
        let imageName = self.imageName
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)


        self.view.backgroundColor = .systemTeal
        self.title = "Pirates of the Gulf of Galveston"
        let table = UITableView(frame: .zero)
        
        //translate....Constraints is defaulted to true
        //allows us to use programatic constraints
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemYellow
        
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

        table.addSubview(imageView)
        
        
        //Label

        label_one.text = label1
        label_two.text = label2
        
        let stackView = UIStackView(frame: .zero)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.addArrangedSubview(self.label_one)
        stackView.addArrangedSubview(self.label_two)
        
        stackView.distribution = .equalSpacing

        //add the stackView to the cell
        table.addSubview(stackView)
        
        //stackView.addArrangedSubview(bufferViewTop)
        stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: table.trailingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: table.trailingAnchor, constant: -8).isActive = true 
  }
    
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
