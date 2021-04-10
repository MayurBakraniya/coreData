//
//  collegeViewController.swift
//  coreData
//
//  Created by Adsum MAC 3 on 10/04/21.
//

import UIKit

class collegeViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var arrCollege = [College]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        arrCollege = dataBaseHelper.shareInstance.getAllCollegeData()
        tableSetup()
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        arrCollege = dataBaseHelper.shareInstance.getAllCollegeData()
        tableView.reloadData()
    }
    
    func tableSetup(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .clear
        tableView.register(UINib(nibName: "clgTableViewCell", bundle: nil), forCellReuseIdentifier: "clgTableViewCell")
    }
    
    @IBAction func addCollegeDataBtn(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detail:collegeFormViewController = storyboard.instantiateViewController(withIdentifier: "collegeFormViewController") as! collegeFormViewController
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

extension collegeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCollege.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clgTableViewCell", for: indexPath) as! clgTableViewCell
        cell.clgName.text = arrCollege[indexPath.row].name
        cell.clgUniversity.text = arrCollege[indexPath.row].university
        cell.clgCity.text = arrCollege[indexPath.row].city
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detail:collegeDetailViewController = storyboard.instantiateViewController(withIdentifier: "collegeDetailViewController") as! collegeDetailViewController
        detail.collegeDetail = arrCollege[indexPath.row]
        detail.indexRow = indexPath.row
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arrCollege = dataBaseHelper.shareInstance.deleteCollegeData(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension collegeViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText.isEmpty{
            var tmp = [College]()
            tmp = arrCollege.filter({($0.name?.contains(searchText.lowercased().uppercased()))!})
            arrCollege = tmp
            arrCollege = dataBaseHelper.shareInstance.getAllCollegeData()
        }else{
            var tmp = [College]()
            tmp = arrCollege.filter({($0.name?.contains(searchText))!})
            arrCollege = tmp
        }
        tableView.reloadData()
    }
    
}

