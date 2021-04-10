//
//  collegeFormViewController.swift
//  coreData
//
//  Created by Adsum MAC 3 on 10/04/21.
//

import UIKit


class collegeFormViewController: UIViewController {
    
    
    @IBOutlet weak var txtClgName: UITextField!
    @IBOutlet weak var txtClgUniversity: UITextField!
    @IBOutlet weak var txtClgCity: UITextField!
    @IBOutlet weak var txtClgAdd: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    var isUpdate = false
    var indexRow = Int()
    
    var collegeDetails:College?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.txtClgName.text = collegeDetails?.name
        self.txtClgUniversity.text = collegeDetails?.university
        self.txtClgCity.text = collegeDetails?.city
        self.txtClgAdd.text = collegeDetails?.address
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate{
            saveBtn.setTitle("Update", for: .normal)
        }else{
            saveBtn.setTitle("Save", for: .normal)
        }
    }
    
    @IBAction func saveBtnClick(_ sender: UIButton) {
        CollegeSaveData()
        self.navigationController?.popViewController(animated: true)
    }
    
    func CollegeSaveData(){
        
        guard let collegeName = txtClgName.text else {
            return
        }
        guard let collegeUniversity = txtClgUniversity.text else {
            return
        }
        guard let collegeCity = txtClgCity.text else {
            return
        }
        guard let collegeAddress = txtClgAdd.text else {
            return
        }
        
        let collegeDic = [
        
            "collegeName":collegeName,
            "collegeUniversity":collegeUniversity,
            "collegeCity":collegeCity,
            "collegeAddress":collegeAddress
            
        ]
        
        if isUpdate{
            dataBaseHelper.shareInstance.editCollegeData(collegeDic: collegeDic, index: indexRow)
        }else{
            dataBaseHelper.shareInstance.saveCollegeData(collegeDic: collegeDic)
        }
        
        
    }
    

}
