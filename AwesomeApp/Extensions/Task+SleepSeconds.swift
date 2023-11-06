//
//  TaskAwaiter.swift
//  AwesomeApp
//
//  Created by Thisura Dodangoda on 2023-11-07.
//

import Foundation

/**
 https://stackoverflow.com/a/68715267
 */
extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: Double) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
    }
}
