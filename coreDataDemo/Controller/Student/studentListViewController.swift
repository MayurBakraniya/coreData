//
//  studentListViewController.swift
//  coreDataDemo
//
//  Created by Adsum MAC 3 on 10/04/21.
//

import UIKit

class studentListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrStudent = [Student]()
    
    var college:College?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        arrStudent = dataBaseHelper.shareInstance.getAllStudentData()
        tableSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if college?.students?.allObjects != nil{
            arrStudent = college?.students?.allObjects as! [Student]
        }
//        arrStudent = dataBaseHelper.shareInstance.getAllStudentData()
        tableView.reloadData()
    }
    
    func tableSetup(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "studentTableViewCell", bundle: nil), forCellReuseIdentifier: "studentTableViewCell")
    }
    
    @IBAction func addStudentBtn(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detail:studentFormViewController = storyboard.instantiateViewController(withIdentifier: "studentFormViewController") as! studentFormViewController
        detail.college = college
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
}

extension studentListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentTableViewCell", for: indexPath) as! studentTableViewCell
        cell.studNameLbl.text = arrStudent[indexPath.row].name
        cell.studContactLbl.text = arrStudent[indexPath.row].phone
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arrStudent = dataBaseHelper.shareInstance.deleteStudentData(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    
}
