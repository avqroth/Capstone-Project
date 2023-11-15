//
//  ErrorView.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/13/23.
//

import SwiftUI

struct ErrorView: View {
  let error: Error

  var body: some View {
    VStack(alignment: .center, spacing: 12) {
      Image("error")
        .resizable()
        .scaledToFit()
        .padding(.leading, 20)
        .frame(width: 150, height: 150)
      Text("Ooops!")
        .font(.largeTitle)
        .bold()
      Text(error.localizedDescription)
        .multilineTextAlignment(.center)
    }
    .frame(maxWidth: .infinity)
    .listRowSeparator(.hidden)
    .padding()
  }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: AppError.general)
    }
}
