//
//  DrinkData.swift
//  DrinkApp
//
//  Created by Yoga on 2022/11/5.
//

import Foundation
//讀取資料
//第一層
struct DrinkData:Codable{
    let records:[StoreItem]
}

//第二層
struct StoreItem:Codable{
    let fields:Fields
}

//第三層
struct Fields:Codable{
    let country:String
    let pricel:String?
    let hotprice:String?
    let hot:Bool?
    let description:String
    let princem:String?
    let bubble:Bool?
    let category:String
    let name:String
    let sugar:[String]
    let ice:[String]
}
    

