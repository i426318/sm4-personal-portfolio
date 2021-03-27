//
//  ModelData.swift
//  Landmarks
//
//  Created by Nathanael William on 27/03/21.
//

/*
 "You use a do-catch statement
 to handle errors by running a block of code.
 
 If an error is thrown by the code in the do clause,
 it’s matched against the catch clauses to
 determine which one of them can handle the error."
 
 - Swift Documentation
 
 guard statement is like an early if statement; (early) returns a function when a condition isn't satisfied.
 
 */



import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
   
    else { // error: no filename found.
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch { // error: couldn't load filename.
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
        
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
