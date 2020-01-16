//
//  ViewController.swift
//  CoreData Demo
//
//  Created by MacStudent on 2020-01-16.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //First step: An instance of app delegate

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        /*
         second step :- context
         this context is manager like location manager, audio manager etc
         */
        
        let context = appDelegate.persistentContainer.viewContext
//
//        //3rd step:- write into the context
//        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
//        newUser.setValue("Ali", forKey: "name")
//        newUser.setValue(4168412862, forKey: "phone")
//        newUser.setValue("Ali@gmail.com", forKey: "email")
//        newUser.setValue(15, forKey: "Age")

        // 4th step:- save context
//
//        do {
//           try  context.save()
//            print(newUser, "is saved")
//
//        }
//        catch
//        {
//            print(error)
//
//        }

    // fetch request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
     request.predicate = NSPredicate(format: "name=%@","Ali")
  // request.predicate = NSPredicate(format: "name=%@","@gmail.com")
        
        request.returnsObjectsAsFaults = false
        // let result
        do{
            let results = try context.fetch(request)
            if results.count > 0
            {
                for result in results as! [NSManagedObject]{
//                   /*if let name = result.value(forKey: "name")
//                    {
//                          print(name)
//                    }
//                      */
//                    if let email = result.value(forKey: "email")
//                    {
//                        print(email)
//
//                        // update email address to "mo@EXAMPLE.CA"
//                        let email = email as! String
//                        //update core data
//                        result.setValue(email.dropLast(2) + "a", forKey: "email")
//                        do{
//                            print(result, "is saved")
//                        }
//                        catch{
//                            print (error)
//                        }
//                        print(email)
//                    }
                    //Delete the user kamal
                    if let name = result.value(forKey: "name") as? String
                    {
                        context.delete(result)
                        
                            do {
                                try context.save()
                            }
                        catch
                        {
                            print(error)
                        }
                        print(name)
                        
                    }
                }
            }
            }
        catch
        {
            print(error)
        }
        
    }


}

