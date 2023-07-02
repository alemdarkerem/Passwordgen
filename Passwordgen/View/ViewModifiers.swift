//
//  ViewModifiers.swift
//  Passwordgen
//
//  Created by Kerem Alemdar on 23.12.2022.
//

import Foundation
import SwiftUI

extension View {
    // -> ifadesi return anlamına geliyor. Yani output.
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
            
        }
    }
    
    func addNavigarionView(title: String) -> some View {
        NavigationView {
            self
                .navigationTitle(title)
        }
    }
}
