//
//  ChatScreen.swift
//  OSChat
//
//  Created by Abdallah Mahameed on 15/09/2024.
//

import SwiftUI
import UIKit
struct ChatScreen: View {
    
    @State private var searchText = ""
    @State private var scrollOffset: CGFloat = 0
    @State private var showHeader: Bool = true
    @EnvironmentObject var coordinator: Coordinator
    
    private let chats: [ChatBubbleItem] = Array(repeating: ChatBubbleItem(), count: 20)
    
    var body: some View {
        NavigationView {
            VStack {
                if showHeader {
                    HStack {
                        Text("Chats")
                            .font(.largeTitle)
                            .bold()
                        
                        Spacer()
                        
                        OSButton(image: "gearshape.fill")
                        OSButton(image: "bell.fill")
                        OSButton(image: "phone.badge.waveform.fill")
                    }
                    .padding()
                }
                
                ZStack(alignment: .leading) {
                    // Placeholder Text
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.gray)
                        if searchText.isEmpty {
                            Text("Search in my chats")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.leading, 10)
                    
                    // Actual TextField
                    TextField("", text: $searchText)
                        .padding(7)
                        .padding(.leading, 30)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                        .frame(height: 40)
                }
                .padding()
                
                HStack {
                    OSButtonSmall(image: "map.circle")
                    Text("All")
                    
                    Spacer()
                    
                    OSButtonSmall(image: "books.vertical")
                    OSButtonSmall(image: "line.3.horizontal.decrease.circle")
                }
                .padding([.leading, .trailing], 10)
                
                ScrollView {
                    GeometryReader { geometry in
                        Color.clear
                            .onChange(of: geometry.frame(in: .global).minY) { _,newValue in
                                let shouldShowHeader = newValue > 0
                                if showHeader != shouldShowHeader {
                                    withAnimation(.bouncy) {
                                        showHeader = shouldShowHeader
                                    }
                                }
                            }
                    }
                    .frame(height: 0)
                    ForEach(chats) { chat in
                        NavigationLink(destination: ChatRoomScreen(coordinator: coordinator)) {
                            ChatBubbleView()
                                .padding()
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

struct ChatRoomScreen: View {
    
    var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Text("Profile View")
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    ZStack(alignment: .bottomLeading) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(Color.green)
                    }
                    VStack(alignment: .leading) {
                        Text("Ali Shaker")
                            .font(.callout)
                        Text("active")
                            .font(.caption2)
                    }
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    coordinator.showPostVC()
                }) {
                    Text("Details")
                }
            }
        }
    }
}

struct OSButton:View {
    var image: String
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: image)
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundStyle(Color.black)
        })
        .padding(.horizontal, 5)
    }
}

struct OSButtonSmall:View {
    var image: String
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: image)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(Color.black)
        })
        .padding(.horizontal, 5)
    }
}

struct ChatBubbleItem: Identifiable, Equatable {
    var id: UUID = UUID()
    
    var title: String = ""
    var subtitle: String = ""
    var date: String = ""
    var postTitle: String = ""
}

#Preview {
    ChatScreen().environmentObject(Coordinator(viewController: ViewController()))
}
