//
//  ContentView.swift
//  NavView_Picker
//
//  Created by Evhen Lukhtan on 14.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var section = 0
    @State var procents = 0
    @State var isOn = false
    var settingsTime = ["1 min", "2 min", "3 min", "30 min", "35 min", "60 min", "75 min", "90 min"]
    
    var body: some View {
        NavigationView {
            Form {
                NavigationLink(destination: PickerDetailView(selection: $section, options: settingsTime, title: "TimeMaan")) {
                    HStack {
                        Text("TimeMaan")
                        Spacer()
                        Text(settingsTime[section])
                            .foregroundColor(.gray)
                    }
                }

                Toggle(isOn: $isOn, label: {
                    Text("Airplane mode")
                })
                .foregroundStyle(isOn ? .orange : .blue)
                .toggleStyle(SwitchToggleStyle(tint: .red))
                
                NavigationLink(destination: PickerDetailView(selection: $procents, options: Array(0...100).map { "item - \($0)" }, title: "Light bright")) {
                    HStack {
                        Text("Light bright")
                        Spacer()
                        Text("item - \(procents)")
                            .foregroundColor(.gray)
                    }
                }

                Text("Selected time - \(settingsTime[section])")
            }
            .navigationTitle("Mamba")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct PickerDetailView: View {
    @Binding var selection: Int
    var options: [String]
    var title: String

    var body: some View {
        List {
            ForEach(0..<options.count, id: \.self) { index in
                HStack {
                    Text(options[index])
                    Spacer()
                    if index == selection {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selection = index
                }
            }
        }
        .navigationTitle(title)
    }
}


#Preview {
    ContentView()
}
