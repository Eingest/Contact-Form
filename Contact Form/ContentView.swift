//
//  ContentView.swift
//  Contact Form
//
//  Created by Andreas Kiesel on 25.05.22.
//

import SwiftUI

struct ContentView: View {
    @State private var emailAdress = ""
    @State private var message = "Write your message here..."
    @State private var includeLogs: Bool = false
    @State private var subject = "Help"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("How can we reach you?")) {
                    TextField("Email Adress", text: $emailAdress)
                }
                Section(header: Text("What can we help you with?")) {
                    Picker("Subject", selection: $subject) {
                        ForEach(["Help", "Suggestion", "Bug Report"], id: \.self) { subject in
                            Text(subject)
                        }
                    }
                }
                Section(header: Text("Briefly explain what's going on")) {
                    TextEditor(text: $message)
                }
                Section(header: Text("This information will be sent anonymously")) {
                    Toggle("Include Logs", isOn: $includeLogs)
                }
                Button("Submit") {
                    print("Submit Button Tapped")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
