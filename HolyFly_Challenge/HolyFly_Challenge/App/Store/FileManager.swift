//
//  FileManager.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 25/04/24.
//

import Foundation

func saveDataToDisk(_ data: Data, fileName: String) {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let fileURL = documentsDirectory.appendingPathComponent(fileName)
    
    do {
        try data.write(to: fileURL)
    } catch {
        print("Error saving data to disk: \(error)")
    }
}

func loadDataFromDisk(fileName: String) -> Data? {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let fileURL = documentsDirectory.appendingPathComponent(fileName)
    
    do {
        let data = try Data(contentsOf: fileURL)
        return data
    } catch {
        print("Error loading data from disk: \(error)")
        return nil
    }
}
