//
// ViewController.swift
// Aviator Aces
//
// Created by Viktor Kulia on 29.01.2024.
//  

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showSwitUIView()
    }


    private func showSwitUIView() {
        print("Showing TabBarView")
        // Создаем новый UIHostingController с TabBarView
        let swiftUIViewController = UIHostingController(rootView: ContentView())
        
        // Добавляем новый контроллер как дочерний
        addChild(swiftUIViewController)
        view.addSubview(swiftUIViewController.view)
        swiftUIViewController.didMove(toParent: self)
        
        // Настраиваем ограничения для tabBarViewController
        swiftUIViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            swiftUIViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            swiftUIViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            swiftUIViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            swiftUIViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

