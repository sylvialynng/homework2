//
//  ViewController.swift
//  HomeWorkBasicApp
//
//  Created by Sylvia Graham on 11/13/22.
//
import UIKit

class ViewController: UIViewController {
    var data: [[String]] = [
       ["Captain_Sally", "blah0", "girl"],
       ["Donald", "blah32", "duck"],
       ["Hook", "blah2", "Peter Pan"],
       ["Water", "blah3", "pretty fast"],
       ["away_maties", "blah4", "bpat"],
       ["belinda_blue", "blah5", "girl with"],
       ["corral_island", "blah6", "looks like"],
       ["parrot", "blah7", "bird with", "huge"],
       ["first_mate_suzie", "blah8", "girl"],
       ["flag", "blah9", "black and white"],
       ["galley", "blah10", "a dining table"],
       ["galley_cook", "blah11", "a girl that rocks"],
       ["island_sunrise", "blah12", "pretty sunrise"],
       ["monkey", "blah13", " ", "a monkey pirate"],
       ["octa_pirate", "blah14", "a big squid"],
       ["octapus", "blah15", " another big squid"],
       ["octapus_rum", "blah16", "another octapus"],
       ["parrot", "blah17", "a colorful bird"],
       ["parrot_pirate", "blah18", "a priate of feathers"],
       ["pirate_garfield", "blah20", "a famous kitty"],
       ["pirate_morgana", "blah21", "preety girl"],
       ["pitty_kitty", "blah22", "a messed up cat"],
       ["ruby_redhair", "blah23", "a red haired piratess"],
       ["sail_away", "blah24", "a cute boat"],
       ["schooner_sails", "blah25", "a boatload of sails"],
       ["skull_Island", "blah26", "a pirates delight"],
       ["suzy_and_cannon", "blah27", "a girl with a BIG gun"],
       ["treasure_Island", "blah28", "an island to see"],
       ["treasure_cove", "blah29", "a cave with treasure"],
       ["treasure_map", "blah30", "a map to deblooms "],
       ["volcano_island", "blah31", "an island with fire"]]

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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HWCell", for: indexPath) as?
                HomeWorkTableViewCell
        else{
            fatalError("deque reusable does not match registered name")
        }
        cell.configure(imageName: data[indexPath.row][0], label1: data[indexPath.row][1], label2: data[indexPath.row][2])
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let detailVC = DetailViewController(imageName: data[indexPath.row][0], label1: data[indexPath.row][1], label2: data[indexPath.row][2])
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

