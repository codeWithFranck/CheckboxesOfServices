//
//  ContentView.swift
//  CheckboxesOfServices
//
//  Created by Franck Dalin Mbeutcha Tchuisseu on 2024-02-03.
//

import SwiftUI

struct ServiceItem {
    var title: String
    var description: String
    var isSelected: Bool
}

struct CheckboxView: View {
    @Binding var serviceItem: ServiceItem
    
    var body: some View {
        HStack {
            Image(systemName: serviceItem.isSelected
                  ? "checkmark.square.fill"
                  : "square")
                .foregroundColor(
                    serviceItem.isSelected
                    ? .green : .gray)
                .font(.system(size: 30))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(serviceItem.title)
                    .font(.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text(serviceItem.description)
                    .font(.body)
                    .lineLimit(1)
            }
        }
        .onTapGesture {
            serviceItem.isSelected.toggle()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct ContentView: View {
    
    @State private var mockServiceItems = [
        ServiceItem(title: "Catering Services", description: "Provide food and beverages for events such as weddings, corporate gatherings, and parties.", isSelected: false),
        
        ServiceItem(title: "Cleaning Services", description: "Offer residential and commercial cleaning", isSelected: false),
        
        ServiceItem(title: "Consulting Services", description: "Offer expert advice and strategies to organizations or individuals to improve efficiency", isSelected: false),
        
        ServiceItem(title: "Delivery Services", description: "Include the transportation and delivery of goods.", isSelected: false),
        
        ServiceItem(title: "Legal Services", description: "These are provided by lawyers or legal experts and include advice, representation, and the preparation of legal documents for individuals, businesses, or organizations.", isSelected: false),
    ]
    var body: some View {
        NavigationView {
            List($mockServiceItems, id: \.title){ $item in
                CheckboxView(serviceItem: $item)
                    .listRowInsets(EdgeInsets())
                    .background(
                        item.isSelected
                        ? Color.green.opacity(0.2)
                        : Color.clear)
            }
            .navigationTitle("Our Services")
        }
    }
}

#Preview {
    ContentView()
}
