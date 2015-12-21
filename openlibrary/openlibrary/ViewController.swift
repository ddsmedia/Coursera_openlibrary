//
//  ViewController.swift
//  openlibrary
//
//  Created by ANGEL GABRIEL RAMIREZ ALVA on 20/12/15.
//  Copyright © 2015 DDS.media. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var isbn: UITextField!
    @IBOutlet var respuesta: UITextView!
    
    func busca(){
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"+isbn.text!
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        let texto = NSString(data:datos!, encoding:NSUTF8StringEncoding)
        respuesta.text! = texto as! String
        print(texto!)
    }
    
    @IBAction func buscar(sender: AnyObject) {
        busca()
    }
    
    @IBAction func limpiar(sender: AnyObject) {
        isbn.text = "";
        respuesta.text = ""
        isbn.focused
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == isbn{
            busca()
        }
        
        self.view.endEditing(true)
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

