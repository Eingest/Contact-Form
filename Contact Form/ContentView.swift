//
//  ContentView.swift
//  Contact Form
//
//  Created by Andreas Kiesel on 25.05.22.
//

import SwiftUI

struct ContentView: View {
    @State private var emailAdress = ""
    @State private var phoneNumber = ""
    @State private var message = "Write your message here..."
    @State private var includeLogs: Bool = false
    @State private var subject = "Help"
    
    @State private var preferredContactMethod = ContactMethod.email
    
    enum ContactMethod {
        case email, phone
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("How can we reach you?")) {
                    Picker("Contact Method", selection: $preferredContactMethod) {
                        Text("Email").tag(ContactMethod.email)
                        Text("Phone").tag(ContactMethod.phone)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    switch preferredContactMethod {
                    case .email:
                        TextField("Email Adress", text: $emailAdress)
                    case .phone:
                        TextField("Phone Number", text: $phoneNumber)
                    }
                    
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
            .navigationTitle("Contact Us")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
