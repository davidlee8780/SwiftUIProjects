//
//  TabBarView.swift
//  SwiftUI-CoreData
//
//  Created by David Lee on 22/04/20.
//  Copyright © 2020 David Lee. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            UsersView()
                .tabItem({
                    Text("Users")
                })
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
