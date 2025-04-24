//
//  DashboardVC.swift
//  AddingViewsTrhoughCode
//
//  Created by Naveed Ur Rahman MOHAMMED on 12/03/25.
//

import UIKit

protocol ProfileVCDelegate: AnyObject {
    func sendDataBack(name: String) -> Void
}

class ProfileVC: UIViewController {
   
    //    weak var delegate: ProfileVCDelegate?
    
    var callBackMethod: ((String) -> Void)?
    

    private lazy var navigateToPreviousScreen: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Navigate to Dashboard Screen", for: .normal)
        b.addTarget(self, action: #selector(navigateToDashboardScreenAction), for: .touchUpInside)
        return b
    }()
    
    @objc func navigateToDashboardScreenAction() {
//        delegate?.sendDataBack(name: "Sending data from profile screen")
        callBackMethod?("Sending data from profile screen")
        navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true)
      
    }
    
    var data: ProfileData = ProfileData()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        print(data)
        
        view.addSubview(navigateToPreviousScreen)
        
        NSLayoutConstraint.activate([
            navigateToPreviousScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigateToPreviousScreen.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            navigateToPreviousScreen.widthAnchor.constraint(equalToConstant: 300),
            navigateToPreviousScreen.heightAnchor.constraint(equalToConstant: 50),
        ])
       
    }
}

struct ProfileData {
    var name: String = ""
    var age: Int = 0
}


class DashboardVC: UIViewController, ProfileVCDelegate {
   
    
    private lazy var navigateToProfileScreenBtn: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Navigate to Profile Screen", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.addTarget(self, action: #selector(navigateToProfileScreenAction), for: .touchUpInside)
        return b
    }()
    
    @objc func navigateToProfileScreenAction() {
        let profileVC = ProfileVC()
        profileVC.data.name = "xyz"
        profileVC.data.age = 10
        profileVC.callBackMethod = {(value) in
            print(value)
        }
//        profileVC.delegate = self
        navigationController?.pushViewController(profileVC, animated: true)
        
    }
    
    func sendDataBack(name: String) {
        print("Name:", name)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        navigationController?.navigationBar.barTintColor = UIColor.blue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        navigationItem.title = "Dashboard Screen"
        view.backgroundColor = .white
        view.addSubview(navigateToProfileScreenBtn)
        
        NSLayoutConstraint.activate([
            navigateToProfileScreenBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigateToProfileScreenBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            navigateToProfileScreenBtn.widthAnchor.constraint(equalToConstant: 300),
            navigateToProfileScreenBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}



