//
//  LeerNoticias.swift
//  VideoNoticia
//
//  Created by alicharlie on 12/05/16.
//  Copyright © 2016 codepix. All rights reserved.
//

import Foundation


class LeerNoticias{


    func getNoticias(termino:(_ datos:[String])-> Bool){
     let urlS : NSString  = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/arts/30.json?api-key=d76250fe444545b2bae2a5a1161584df" as NSString
            print(urlS)
            let urlStr = urlS
            let searchURL : NSURL = NSURL(string: urlStr as String)!
            var request = URLRequest(url: searchURL as URL)
            // Request
            request.httpMethod = "GET"
            let Session = URLSession.shared
            Session.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    var titulos:[String] = []
                    do {
                        
                        let resultado = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                                                
                                                    for valor in resultado["results"] as! [NSDictionary]{
                                                      titulos.append(valor["title"] as! String)
                                                    }
                        
                            termino(titulos)
                        
                        
                       
                        // Error on get
                    } catch {
                            print("Error en lectura")
                    }
                }
                
        }.resume()
        
    }

}


