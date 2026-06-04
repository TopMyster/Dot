//
//  Note.swift
//  Dot
//
//  Created by Toope Oladunjoye on 6/3/26.
//

import SwiftUI

struct Note: Identifiable {
    var id = UUID()
    var date: String = Date().formatted(date: .abbreviated, time: .shortened)
    var title: String
    var content: String
}
