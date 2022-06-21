//
//  startScreen.swift
//  BookMark-UIKit
//
//  Created by Nail Kamilov on 01.06.2022.
//

import UIKit

class startScreen: UIViewController {
    
    let button2: UIButton = {
        let button2 = UIButton()
        button2.setTitle("Let’s start collecting", for: .normal)
        button2.titleLabel?.textColor = .white
        button2.layer.cornerRadius = 12
        button2.layer.masksToBounds = true
        button2.backgroundColor = .black
        return button2
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Bookmark App"
        setMainUI()
    }
    
    
    // Creating Title of Screen and button
    private func setMainUI() {
        
        self.view.addSubview(button2)
        button2.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        button2.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        button2.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 56 ).isActive = true
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.addTarget(self, action: #selector(alertFunc), for: .touchUpInside)
    
    }
    
    @objc func alertFunc() {
        let alert = UIAlertController(title: "Change", message: nil, preferredStyle: .alert)
        
        alert.addTextField { field in
            field.placeholder = "Bookmark title"
            field.layer.borderColor = UIColor.darkGray.cgColor
            field.returnKeyType = .next
            
        }
        
        alert.addTextField { field in
            field.placeholder = "Bookmark link"
            field.returnKeyType = .next
            field.keyboardType = .URL
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: {_ in
            guard let fields = alert.textFields, fields.count == 2 else {
                return
            }
            let bookmarktitle = fields[0]
            let bookmarkurl = fields[1]
            guard let title = bookmarktitle.text, !title.isEmpty,
                  let Bookurl = bookmarkurl.text, !Bookurl.isEmpty  else{
                print("Invalid entries")
                return
            }
            print("Bookmark title: \(title)")
            print("Bookmark url: \(Bookurl)")
            let lS = listScreen()
            lS.modalPresentationStyle = .fullScreen
            self.navigationController?.present(lS, animated: true, completion: nil)
        }))
        self.present(alert, animated: true)
           
    }
}
