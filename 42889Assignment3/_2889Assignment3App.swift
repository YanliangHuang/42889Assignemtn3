//
//  _2889Assignment3App.swift
//  42889Assignment3
//
//  Created by Graham Huang on 23/4/2024.
//

import SwiftUI

@main
struct _2889Assignment3App: App {
    @StateObject var dataProvider = DataProvider()
    @StateObject var authModel: AuthenticationModel
    
    init() {
        //init everything. dataprovider should be database related in future update
        //authmodel is responsible for login, logout and register
        let dataProvider = DataProvider()
        let authModel = AuthenticationModel(dataProvider: dataProvider)

        _dataProvider = StateObject(wrappedValue: dataProvider)
        _authModel = StateObject(wrappedValue: authModel)
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(authModel).environmentObject(dataProvider)
        }
    }
}
