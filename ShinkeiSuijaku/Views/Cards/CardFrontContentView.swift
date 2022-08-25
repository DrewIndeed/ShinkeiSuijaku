//
//  CardFrontContentView.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 25/08/2022.
//

import SwiftUI

struct CardFrontContentView: View {
    var content: CardContentModel
    
    var body: some View {
        content.image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct CardFrontContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardFrontContentView(content: .ace_of_hearts)
    }
}
