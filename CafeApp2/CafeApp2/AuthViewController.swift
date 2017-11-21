//
//  AuthViewController.swift
//  CafeApp2
//
//  Created by John Hayden on 11/20/17.
//  Copyright © 2017 Austin Patton. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthViewController: UIViewController {

    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBAction func RegisterAccount(_ sender: Any) {
        
        if let user = Username.text, let password = Password.text
        {
            
            
            Auth.auth().createUser(withEmail: user, password: password, completion:
                { user, error in
                
                if let firebaseError = error
                    {
                    
                        print(firebaseError.localizedDescription)
                        return
                    }
                    print("success!")
                })
            }
            
        }
    
    //this is the login
    @IBAction func CreateAccount(_ sender: Any)
    {
        if let user = Username.text, let password = Password.text
        {
            Auth.auth().signIn(withEmail: user, password: password, completion:
                { user, error in
                    
                    if let firebaseError = error
                    {
                        
                        print(firebaseError.localizedDescription)
                        return
                    }
                    print("success!")
            })
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
