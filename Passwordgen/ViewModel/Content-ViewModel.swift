//
//  Content-ViewModel.swift
//  Passwordgen
//
//  Created by Kerem Alemdar on 23.12.2022.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        // MARK: 1 4 tane değişken tanımlıyıcaz. ( [] ifadesi array anlamına geliyor)
        @Published var passwords: [Password] = []
        @Published var containsSymbols = true
        @Published var containsUppercase = false
        @Published var length = 10
        
        // MARK: 2 İnit komutunun kullanım amacı: insert some sample data into password
        init(){
            createPassword()
            
        }
        
        // Bu fonksiyon sürekli yeni random bir şifre oluşturmamızı sağlıyor
        
        func createPassword() {
            let alphabet = "abdefghijklmnopqrstuvwxyz"
            var base = alphabet + "1234567890"
            var newPassword = ""
            
            
            // Eğer sembol içermesini istiyorsak base e sembol ekliyoruz.
            // Base i değiştirebilmek adına let komutu yerine var(variable) komutunu kullanıyoruz.
            if containsSymbols {
                base += "!^+%&/()=?-_,.:;*?"
            }
            // Eğer büyük harf içeriyorsa base e büyük harfleri ekliyoruz.
            if containsUppercase {
                base += alphabet.uppercased()
            }
            // Alttaki for döngüsü şifre uzunluğu boyunca base içerisinden random karakter seçip randChar a atıyor. Devamında ise atılan bu harfleri dizi şeklinde newPassword a aktarıyor.
            for _ in 0..<length {
                let randChar = base.randomElement()!
                newPassword += String(randChar)
            }
            let password = Password(password: newPassword, containsSymbols: containsSymbols, containsUppercase: containsUppercase)
            
            withAnimation(){
                passwords.insert(password, at: 0)
            }
            
            
        }
        
    }
}
