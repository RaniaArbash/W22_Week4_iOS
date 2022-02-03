//
//  StudentLogInManager.swift
//  Week4Project
//
//  Created by Rania Arbash on 2022-02-03.
//

import Foundation

class StudentLogInManager {
    var allStudents : [Student] = [Student]()
    
    
    func addNewStudent(name: String, password : String){
        
        allStudents.append(Student(na: name, pa: password))
    }
    
}
