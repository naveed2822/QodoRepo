//
//  ViewController.swift
//  StackViewExample
//
//  Created by Naveed Ur Rahman MOHAMMED on 04/04/25.
//

import UIKit

//Axis
//Distribution:
//Aligment

class HorizontalStackView: UIViewController {
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .white
        sv.spacing = 8
     
        sv.axis = .horizontal
        
//        sv.distribution = .fill//defalult
//        sv.distribution = .fillEqually
//        sv.distribution = .fillProportionally
//        sv.distribution = .equalSpacing
        sv.distribution = .fillEqually
        
        sv.alignment = .center //
    
        return sv
    }()
    
    private let label1: UILabel = {
        let l = UILabel()
        l.text = "1233453534543"
        l.backgroundColor = .red
        return l
    }()
    
    private let label2: UILabel = {
        let l = UILabel()
        l.text = "123"
        l.backgroundColor = .red
        return l
    }()
    
    private let label3: UILabel = {
        let l = UILabel()
        l.text = "123"
        
        l.backgroundColor = .red
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }
    
    func setupStackView()  {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
        stackView.addArrangedSubview(label1)
        
        stackView.addArrangedSubview(label2)
        
        stackView.addArrangedSubview(label3)
        
        NSLayoutConstraint.activate([label1.heightAnchor.constraint(equalToConstant: 100)])
        
        
    }
    
    
}
