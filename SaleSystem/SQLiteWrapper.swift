//
//  SQLiteWrapper.swift
//  SaleSystem
//
//  Created by 林世豐 on 9/4/16.
//
//

import Foundation
import SQLite

class SQLiteWrapper {
    
    let path: String?
    
    init() {
        path = Bundle.main.path(forResource: "sample", ofType: "db")
        print(path)
        
    }
    
    func loadCompanyList() -> [COMPANY] {
        var retArray: [COMPANY] = []

        do {
            if let rPath = path {
                let db = try Connection(rPath)
            
                let users = Table("company")
                let id = Expression<Int64>("ID")
                let name = Expression<String?>("NAME")
                                
                for user in try db.prepare(users) {
                    print("id: \(user[id]), name: \(user[name])")
                    // id: 1, name: Optional("Alice")
                    let com = COMPANY(aId: Int(user[id]), aName: String(describing: user[name]!))
                    retArray.append(com)
                }
                // SELECT * FROM "users"
            }
        }
        catch {
            print("db load fail")
        }
        return retArray
    }
    
    func loadProductList() -> [PRODUCT] {
        var retArray: [PRODUCT] = []
        
        do {
            if let rPath = path {
                let db = try Connection(rPath)
                
                let users = Table("product")
                let id = Expression<Int64>("ID")
                let name = Expression<String?>("NAME")
                
                for user in try db.prepare(users) {
                    print("id: \(user[id]), name: \(user[name])")
                    // id: 1, name: Optional("Alice")
                    let com = PRODUCT(aId: Int(user[id]), aName: String(describing: user[name]!))
                    retArray.append(com)
                }
                // SELECT * FROM "users"
            }
        }
        catch {
            print("db load fail")
        }
        return retArray
    }
    
    func loadUnitPriceList() -> [UNITPRICE] {
        var retArray: [UNITPRICE] = []
        
        do {
            if let rPath = path {
                let db = try Connection(rPath)
                
                let users = Table("unitprice")
                let id = Expression<Int64>("ID")
                let comId = Expression<Int64>("COMP_ID")
                let proId = Expression<Int64>("PROD_ID")
                let price = Expression<Double>("UNIT_PRICE")
                
                for user in try db.prepare(users) {
                    print("id: \(user[id]), comp_id: \(user[comId]), prod_id: \(user[proId]), unit_price: \(user[price])")
                    // id: 1, name: Optional("Alice")
                    let com = UNITPRICE(aId: Int(user[id]), aComId: Int(user[comId]), aProId: Int(user[proId]), aUnitPrice: Float(user[price]))
                    retArray.append(com)
                }
                // SELECT * FROM "users"
            }
        }
        catch {
            print("db load fail")
        }
        return retArray
    }
    
}

let dbManager: SQLiteWrapper = SQLiteWrapper()