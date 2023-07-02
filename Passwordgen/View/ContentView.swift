//
//  ContentView.swift
//  Passwordgen
//
//  Created by Kerem Alemdar on 23.12.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    @AppStorage("isDarkMode") public var isDark = false
    
    var body: some View {
        Form {
            Section("Setings") {
                Toggle("Dark mode", isOn: $isDark)
                
            }
            Section("Options") {
                
                
                Toggle("Symbols", isOn: $vm.containsSymbols)
                Toggle("Uppercase", isOn: $vm.containsUppercase)
                // $ işareti bound to anlamına geliyor. vm: ViewModel
                // Metin içerisine ("") bir değer eklemek için ters çizgi koyulmalı (\)
                Stepper("Character count: \(vm.length)", value: $vm.length, in: 6...18)
                Button("Generate password", action: vm.createPassword)
                //centerH tuşu yatay olarak ortalamak için
                    .centerH()
            }
            Section("Passwords") {
                List(vm.passwords) {
                    //passwordmodel de bulunan password u çağırdık.
                    password in
                    HStack {
                        Text("\(password.password)")
                            .padding()
                        // textselection şifreyi seçip kopyalamamızı sağlıyor
                            .textSelection(.enabled)
                        Spacer()
                        Image(systemName: "lock.fill")
                            .foregroundColor(password.strengthColor)
                            
                        
                    }
                }
            }
        }
        .environment(\.colorScheme, isDark ? .dark: .light)
        .addNavigarionView(title: "I-Pass")
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
