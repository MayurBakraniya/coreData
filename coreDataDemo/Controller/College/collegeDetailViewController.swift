//
//  collegeDetailViewController.swift
//  coreDataDemo
//
//  Created by Adsum MAC 3 on 10/04/21.
//

import UIKit

class collegeDetailViewController: UITableViewController {

    @IBOutlet weak var lblCollegeName: UILabel!
    @IBOutlet weak var lblCollegeAddress: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblUniversity: UILabel!
    @IBOutlet weak var lblStudent: UILabel!
    
    var collegeDetail : College?
    var indexRow = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
       // tableSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblCollegeName.text = collegeDetail?.name
        lblCollegeAddress.text = collegeDetail?.address
        lblCity.text = collegeDetail?.city
        lblUniversity.text = collegeDetail?.university
        
        if let student = collegeDetail?.students?.allObjects as? [Student]{
            lblStudent.text = "\(student.count)"
        }else{
            lblStudent.text = "0"
        }
        
    }
    
    @IBAction func editBtnClick(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detail:collegeFormViewController = storyboard.instantiateViewController(withIdentifier: "collegeFormViewController") as! collegeFormViewController
        detail.isUpdate = true
        detail.collegeDetails = collegeDetail
        detail.indexRow = indexRow
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detail:studentListViewController = storyboard.instantiateViewController(withIdentifier: "studentListViewController") as! studentListViewController
            detail.college = collegeDetail
            self.navigationController?.pushViewController(detail, animated: true)
        }
    }
    
}
