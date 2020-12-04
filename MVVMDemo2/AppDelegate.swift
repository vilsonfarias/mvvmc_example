//
//  AppDelegate.swift
//  MVVMDemo2
//
//  Created by Jose Vilson de Farias on 12/4/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let service = MockService()
        coordinator = Coordinator(service: service)

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = coordinator?.presenter
        window.makeKeyAndVisible()
        self.window = window

        return true
    }
}
