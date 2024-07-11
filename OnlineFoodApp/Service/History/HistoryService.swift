////
////  HistoryService.swift
////  OnlineFoodApp
////
////  Created by Naufal Al-Fachri on 10/07/24.
////
//
//import Foundation
//
//class HistoryService {
//  
//  static let shared: HistoryService = .init()
//  private init() {}
//  var listOfHistory: [Set<CartItem>] = []
//  
//  
//  func addItem(setOfCart: Set<CartItem>) {
//    listOfHistory.append(setOfCart)
//  }
//  
//}

import Foundation

class HistoryService {
    
    static let shared: HistoryService = .init()
    private init() {
        loadHistory()
    }

    private let userDefaultsKey = "listOfHistory"
    var listOfHistory: [Set<CartItem>] = []

    func addItem(setOfCart: Set<CartItem>) {
        listOfHistory.append(setOfCart)
        saveHistory()
    }

    private func saveHistory() {
        do {
            let encodedData = try JSONEncoder().encode(listOfHistory)
            UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
        } catch {
            print("Failed to encode list of history: \(error)")
        }
    }

    private func loadHistory() {
        guard let savedData = UserDefaults.standard.data(forKey: userDefaultsKey) else {
            return
        }

        do {
            let decodedHistory = try JSONDecoder().decode([Set<CartItem>].self, from: savedData)
            listOfHistory = decodedHistory
        } catch {
            print("Failed to decode list of history: \(error)")
        }
    }
}

