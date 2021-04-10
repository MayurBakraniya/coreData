//
//  studentFormViewController.swift
//  coreDataDemo
//
//  Created by Adsum MAC 3 on 10/04/21.
//

import UIKit

class studentFormViewController: UIViewController {

    @IBOutlet weak var txtStudentName: UITextField!
    @IBOutlet weak var txtStudentEmail: UITextField!
    @IBOutlet weak var txtStudentNumber: UITextField!
    
    var college:College?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBtnClick(_ sender: UIButton) {
        CollegeSaveData()
        self.navigationController?.popViewController(animated: true)
    }
    
    func CollegeSaveData(){
        
        guard let studentName = txtStudentName.text else {
            return
        }
        guard let studentEmail = txtStudentEmail.text else {
            return
        }
        guard let studentPhone = txtStudentNumber.text else {
            return
        }
        guard let mainCollege = college else {
            return
        }
        
        let studentDic = [
            "studentName":studentName,
            "studentEmail":studentEmail,
            "studentPhone":studentPhone
        ]
      
        dataBaseHelper.shareInstance.saveStudentDetail(studentDic: studentDic, college: mainCollege)

    }

}
