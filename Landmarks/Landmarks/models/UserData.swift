//
//  UserData.swift
//  Landmarks
//
//  Created by David Lee on 27/04/20.
//  Copyright © 2020 David Lee. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
