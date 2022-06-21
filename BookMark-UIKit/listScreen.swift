//
//  listScreen.swift
//  BookMark-UIKit
//
//  Created by Nail Kamilov on 06.06.2022.
//

import UIKit

class listScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var callBack: ((String) -> Void)?

    let tableView = UITableView()
    let names = ["Aidar", "Nail", "Merey", "Temirlan"]
    let links = ["https://google.com"]
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Go Back", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        return button
    }()
    
    let imageView: UIImageView = {
        let linkImage = UIImageView()
        linkImage.image = UIImage(systemName: "square.and.arrow.up")
        return linkImage
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "List"
        setListUI()
    }
    
    private func setListUI() {
    
        [tableView, button].forEach { self.view.addSubview($0)}
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(customCell.self, forCellReuseIdentifier: "customCell")
        
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 56 ).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    
    @objc func handleButtonTap() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = names[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? customCell else { UITableViewCell() }
        return cell
    }
}


class customCell: UITableViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.text = "Save all interesting links in one app"
        label.textColor = .white
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
}
