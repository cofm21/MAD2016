//
//  Recipe.swift
//  recipes
//
//  Created by Connor McGuinness on 3/17/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import Foundation

class Recipe {
    var name: String
    var url: String
    
    init(newname: String, newurl: String){
        name = newname
        url = newurl
    }
}