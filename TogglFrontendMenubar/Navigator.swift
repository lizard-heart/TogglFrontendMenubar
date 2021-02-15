//
//  Navigator.swift
//  TogglFrontendMenubar
//
//  Created by Henry Gustafson on 2/9/21.
//

import Foundation

protocol NavigatorType {

    func present(_ scene: Scene, transition: Transition)
}

enum Scene {

    case login
    case project
}

enum Transition {

    case rootController
    case pushDetail
}

final class Navigator: NavigatorType {

    func present(_ scene: Scene, transition: Transition) {

    }
}
