//
//  ViewController.swift
//  BookMark-UIKit
//
//  Created by Nail Kamilov on 31.05.2022.
//

import UIKit

class ViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "Save all interesting links in one app"
        label.textColor = .white
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Let’s start collecting", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        
        return button
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgro")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    
    private func setUI() {
        [imageView, button, label].forEach {self.view.addSubview($0) }
        
        imageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 56 ).isActive = true
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        label.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        label.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -80).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func handleButton() {
        let sS = startScreen()
        sS.modalPresentationStyle = .fullScreen
        navigationController?.present(sS, animated: true, completion: nil)
    }
}

