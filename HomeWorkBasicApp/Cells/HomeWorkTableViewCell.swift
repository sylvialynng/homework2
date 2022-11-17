//
//  HomeWorkTableViewCell.swift
//  HomeWorkBasicApp
//
//  Created by Consultant on 11/13/22.
//

import UIKit

class HomeWorkTableViewCell: UITableViewCell {
    
    
    //setting to a closure which is unique to lazy ={}()
    //contents inside {} is the initialization block
    lazy var HomeWorkImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemPink
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "crab")
        self.imageView?.heightAnchor.constraint(equalToConstant: 75).isActive = true
        self.imageView?.widthAnchor.constraint(equalToConstant: 75).isActive = true
        return imageView
    }()
    lazy var HomeWorkTopLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemYellow
        label.text = "Crabby"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints  = false
        
        return label
    }()
    lazy var HomeWorkMidLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemOrange
        label.text = "Patty Pirate"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints  = false
        
        return label
    }()
    lazy var HomeWorkBottomLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemMint
        label.text = "says 'ARG'"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints  = false
        
        return label
    }()
    
    func setUpUI(){
        self.contentView.backgroundColor = .systemGreen
        
        //fires the lazy block on imageView
        self.contentView.addSubview(self.HomeWorkImageView)
        self.contentView.addSubview(self.HomeWorkMidLabel)
        
        //Anchors
        self.HomeWorkImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        self.HomeWorkImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        self.HomeWorkImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true

        //size constraints
        self.HomeWorkImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.HomeWorkImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true

        let stackView = UIStackView(frame: .zero)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.addArrangedSubview(self.HomeWorkTopLabel)
        stackView.addArrangedSubview(self.HomeWorkMidLabel)
        stackView.addArrangedSubview(self.HomeWorkBottomLabel)
        
        stackView.distribution = .equalSpacing

        //add the stackView to the cell
        self.contentView.addSubview(stackView)
        
        //stackView.addArrangedSubview(bufferViewTop)
        stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.HomeWorkImageView.trailingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        //stackView.addArrangedSubview(bufferViewBottom)

       // stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    //So it knows we're not looking for XML file
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     */

}
