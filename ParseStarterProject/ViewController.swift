/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {
    var signupmode = true
    
    @IBOutlet var uname: UITextField!
    @IBOutlet var pwd: UITextField!
    @IBOutlet var x1: UIButton!
    @IBOutlet var x2: UIButton!
    @IBOutlet var label: UILabel!
    @IBAction func y1(_ sender: Any) {
        if uname.text == "" || pwd.text == "" {
            print("enter username and password")
            
        }else{
            if signupmode{
                let user = PFUser()
                user.username = uname.text
                user.password = pwd.text
                user.signUpInBackground(block: { (success, error) in
                    if error != nil {
                        print("error signing up")
                        
                    }else{
                        
                        print("user signed up")
                    }
                })
                
                
            }else{
                PFUser.logInWithUsername(inBackground: uname.text!, password: pwd.text!, block: { (user, error) in
                    if error != nil{
                        
                        print("error logging in")
                    }else{
                        
                        print("user logged in ")
                    }
                })
                
                
            }
            
            
        }
    }
    @IBAction func y2(_ sender: Any) {
        if signupmode{
            x1.setTitle("Login", for: [])
            x2.setTitle("Signup", for: [])
            label.text = "Don't have an account?"
            signupmode = false
        }else{
            x1.setTitle("Signup", for: [])
            x2.setTitle("Login", for: [])
            label.text = "Already have an account?"
            signupmode = true
            
            
        }
    }
    
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      //  print("hello my name is akin")
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
