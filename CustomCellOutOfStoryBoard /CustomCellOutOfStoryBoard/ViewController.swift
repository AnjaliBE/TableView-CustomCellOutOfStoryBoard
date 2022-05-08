//
//  ViewController.swift
//  CustomCellOutOfStoryBoard
//
//  Created by Mac on 18/04/22.
//

import UIKit

class ViewController: UIViewController {
@IBOutlet weak var snackTableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        snackTableView.dataSource = self
        snackTableView.delegate = self
        
        let nibFileName = UINib(nibName: "MainCourceTableViewCell", bundle: nil)
        snackTableView.register(nibFileName, forCellReuseIdentifier: "MainCourseCell")
    }
}
extension ViewController:UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    10
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row%2 == 0{
        guard let snackCell = self.snackTableView.dequeueReusableCell(withIdentifier: "snackCell") else {
            return UITableViewCell()
        }
        snackCell.textLabel?.text = "Upma"
        snackCell.detailTextLabel?.text = "Rs-15"
        snackCell.backgroundColor = .magenta
        return snackCell
          
    } else{
        guard let mainCourseCell = self.snackTableView.dequeueReusableCell(withIdentifier: "MainCourseCell")as?  MainCourceTableViewCell else {
            return UITableViewCell()
        }
        mainCourseCell.label1.text = "Fish Curry"
        mainCourseCell.label2.text = "Rs-210"
        mainCourseCell.label3.text = "Spicy"
        mainCourseCell.backgroundColor = .brown
        return mainCourseCell
    }
  }
}
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}


