//
//  ProfileView.swift
//  deepLink_SwiftUI_tutorial
//
//  Created by Seokhyun Kim on 2021-03-05.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var body: some View {
        Rectangle().foregroundColor(Color.init(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .cornerRadius(15)
            .overlay(
                Text("Profile")
                    .font(.system(size: 23))
                    .fontWeight(.black)
                    .foregroundColor(.white)
            )
    }
}

struct ProfileView_Previews: PreviewProvider {
    
    static var previews : some View {
        ProfileView()
    }
}
