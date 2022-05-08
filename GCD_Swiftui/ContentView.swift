//
//  ContentView.swift
//  GCD_Swiftui
//
//  Created by Hankyu Lee on 2022/05/08.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        VStack{
            Text("\(viewModel.data)")
                .padding()
            Button {
                viewModel.isBackgroundYello.toggle()
            } label: {
                Text("change color")
            }.buttonStyle(.bordered)
            Button {
                viewModel.fetchData()
            } label: {
                Text("Fetch data")
            }


        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(viewModel.isBackgroundYello ? .yellow : .red)
        
    }
}
extension ContentView {
    class ViewModel : ObservableObject {
        @Published var isBackgroundYello = false
        @Published var data = "GCD"
        func fetchData(){
            
            DispatchQueue.global().async {
                sleep(4)
                let data = "GCD Fetch"
                DispatchQueue.main.async {
                    self.data = data
                }
            }   
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
