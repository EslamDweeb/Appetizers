//
//  AccountView.swift
//  Appetizers
//
//  Created by eslam dweeb on 23/10/2023.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTxtFields:FormTxtFields?
    enum FormTxtFields{
        case firstName,lastName,email
    }
    var body: some View {
        
        NavigationView{
            Form {
                Section {
                    TextField("First name", text: $viewModel.user.firstName)
                        .focused($focusedTxtFields, equals: .firstName)
                        .onSubmit { focusedTxtFields = .lastName }
                        .submitLabel(.next)
                    TextField("Last name", text: $viewModel.user.lastName)
                        .focused($focusedTxtFields, equals: .lastName)
                        .onSubmit { focusedTxtFields = .email }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTxtFields, equals: .email)
                        .onSubmit { focusedTxtFields = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.none)
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthday,displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                            .foregroundColor(Color.brandPrimary)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }

                }header: {
                    Text("Personal Info")
                        .font(.headline)
                }
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                } header: {
                    Text("REQUESTS")
                        .font(.headline)
                }
                .toggleStyle(SwitchToggleStyle.init(tint: .brandPrimary))

            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItem(placement:.keyboard) {
                    Button("Done") { focusedTxtFields = nil }
                }
            }
           
        }
        .task {
            viewModel.getUser()
        }
        .alert(item: $viewModel.alertItem) { item in
            Alert(title: item.title,message: item.message,dismissButton: item.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
