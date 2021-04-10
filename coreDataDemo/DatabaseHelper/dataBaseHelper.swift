//
//  dataBaseHelper.swift
//  coreData
//
//  Created by Adsum MAC 3 on 10/04/21.
//

import UIKit
import CoreData

class dataBaseHelper: NSObject {
    
    static var shareInstance = dataBaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Mark : collegeDetail Database Setup
    
    func saveCollegeData(collegeDic : [String:String]) {
        
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        
        college.name = collegeDic["collegeName"]
        college.university = collegeDic["collegeUniversity"]
        college.city = collegeDic["collegeCity"]
        college.address = collegeDic["collegeAddress"]
        
        do{
            try context.save()
        }catch let err{
            print("college save error : \(err.localizedDescription)")
        }
    }
    
    func getAllCollegeData() -> [College]{
    
        var arrClgData = [College]()
        let fatchRequest = NSFetchRequest<NSManagedObject>(entityName:"College")
        do{
            arrClgData = try context.fetch(fatchRequest) as! [College]
        }catch let err{
            print("error in college Fatch : \(err.localizedDescription)")
        }
        
        return arrClgData
    }

    
    func deleteCollegeData(index:Int) -> [College]{
        
        var collegeData = self.getAllCollegeData() //getData
        context.delete(collegeData[index])  //remove from the data
        collegeData.remove(at: index) //remove from table
        
        do{
            try context.save()
        }catch let err{
            print("error in deleteData : \(err.localizedDescription)")
        }
        return collegeData
    }
    
    
    func editCollegeData(collegeDic : [String:String],index:Int){
        let college = self.getAllCollegeData()
        college[index].name = collegeDic["collegeName"]
        college[index].university = collegeDic["collegeUniversity"]
        college[index].city = collegeDic["collegeCity"]
        college[index].address = collegeDic["collegeAddress"]
        
        do{
            try context.save()
        }catch let err{
            print("error in edit Data : \(err.localizedDescription)")
        }
        
    }
    
    //Mark : StudentDetail Database Setup
  
    func saveStudentDetail(studentDic : [String:String],college:College) {
        
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        
        student.name = studentDic["studentName"]
        student.email = studentDic["studentEmail"]
        student.phone = studentDic["studentPhone"]
        student.university = college
        
        do{
            try context.save()
        }catch let err{
            print("student save error : \(err.localizedDescription)")
        }
    }
    
    func getAllStudentData() -> [Student]{
    
        var arrStudData = [Student]()
        let fatchRequest = NSFetchRequest<NSManagedObject>(entityName:"Student")
        do{
            arrStudData = try context.fetch(fatchRequest) as! [Student]
        }catch let err{
            print("error in Student Fatch : \(err.localizedDescription)")
        }
        
        return arrStudData
    }
    
    func deleteStudentData(index:Int) -> [Student]{
        
        var studentData = self.getAllStudentData() //getData
        context.delete(studentData[index])  //remove from the data
        studentData.remove(at: index) //remove from table
        
        do{
            try context.save()
        }catch let err{
            print("error in deleteData : \(err.localizedDescription)")
        }
        return studentData
    }
    
}
