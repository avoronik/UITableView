//
//  ViewController.swift
//  HW.UITableView
//
//  Created by Anastasia on 11/03/24.
//

import UIKit

class ViewController: UIViewController {

    let language: [String] = [
    "Swift",
    "Java",
    "Python",
    "C++",
    "PHP",
    "JavaScript",
    "SQL",
    "Ruby",
    "Objective-C",
    "Kotlin"
    ]
    
    private lazy var tableView = makeTableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0...9:
            
            let cell = UITableViewCell()
            
            var content = cell.defaultContentConfiguration()
            content.text = "\(indexPath.row)"
            content.secondaryText = "\(indexPath.section)"
            //        cell.textLabel?.text = "\(indexPath.row)"
            //        cell.textLabel?.numberOfLines = 2
            //        cell.detailTextLabel?.text = "\(indexPath.section)"
            
            cell.contentConfiguration = content
            
            return cell
            
        case 10...19:
            let language = language[indexPath.row - language.count]
            let cell = UITableViewCell()
            cell.textLabel?.text = language
            
            return cell
            
        default:
            
            let cell = UITableViewCell()
            return cell
        }
    }
}

    private extension ViewController {
        
        func setupUI() {
            
            view.addSubview(tableView)
            
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
        
        func makeTableView() -> UITableView {
            
            let table = UITableView(frame: .zero, style: .plain)
            table.translatesAutoresizingMaskIntoConstraints = false
            table.delegate = self
            table.dataSource = self
            
            
            return table
        }
    }

