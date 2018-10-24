//
//  ViewController.swift
//  Clima
//
//  Created by Alumno on 18/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    let urlCiudad = "https://api.openweathermap.org/data/2.5/weather?q=ciudad+obregon&APPID=3326d4de85a204e001116973cc1e557a&units=metric"
    
    @IBOutlet weak var lblGrados: UILabel!
    @IBOutlet weak var aiCargarClima: UIActivityIndicatorView!
    @IBAction func doTapActualizarClima(_ sender: Any) {
        lblGrados.text = "-"
        aiCargarClima.startAnimating()
        Alamofire.request(urlCiudad).responseJSON { response in
            //Diccionario Respuesta
            if let  dictRespuesta = response.result.value as? NSDictionary {
                
                //Diccionario Main
                if let dictMain = dictRespuesta.value(forKey: "main") as? NSDictionary {
                    if let temp = dictMain.value(forKey: "temp") as? Double {
                        self.lblGrados.text = "\(temp)"
                        self.aiCargarClima.stopAnimating()
                    }
                    
                }
            } else {
                //Avisarle al usuario que no se pudo leer la respuesta
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aiCargarClima.startAnimating()
        
        

        Alamofire.request(urlCiudad).responseJSON { response in
            //Diccionario Respuesta
            if let  dictRespuesta = response.result.value as? NSDictionary {
                
                //Diccionario Main
                if let dictMain = dictRespuesta.value(forKey: "main") as? NSDictionary {
                    if let temp = dictMain.value(forKey: "temp") as? Double {
                        self.lblGrados.text = "\(temp)"
                        self.aiCargarClima.stopAnimating()
                    }
                    
                }
            } else {
                //Avisarle al usuario que no se pudo leer la respuesta
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
