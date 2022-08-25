//
//  CardBackContentView.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 25/08/2022.
//

import SwiftUI

struct CardBackContentView: View {
    var body: some View {
        Image("back")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct CardBackContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardBackContentView()
    }
}
