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
    var records:[StoreItem]
    //第二層
    struct StoreItem:Codable{
        let fields:Fields
    }//第三層
    struct Fields:Codable{
        var country:String
        var pricel:Int?
        var hotprice:Int?
        var hot:Bool?
        var description:String
        var princem:Int?
        var bubble:Bool?
        var category:String
        var name:String
        var sugar:[String]
        var ice:[String]
    }

    

}
