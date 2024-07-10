//
//  Responseable.swift
//  Session21
//
//  Created by Naufal Al-Fachri on 01/07/24.
//

protocol Responseable: Decodable {
  var message: String { get }
  var success: Bool { get }
}
