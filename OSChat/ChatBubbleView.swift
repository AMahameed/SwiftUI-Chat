//
//  ChatBubbleView.swift
//  OSChat
//
//  Created by Abdallah Mahameed on 15/09/2024.
//

import SwiftUI

struct ChatBubbleView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .cornerRadius(8)
                .shadow(radius: 4)
                .foregroundStyle(Color.white)
            
            VStack {
                HStack(alignment: .top) {
                    ZStack(alignment: .bottomLeading) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(Color.black)
                        
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(Color.green)
                    }
                    .padding([.top, .leading], 5)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Abdallah Mahameed")
                            .foregroundStyle(Color.black)
                        Text("You can call me whenever suitable for you Mr. Ali Shaker suitable for you Mr. Ali Shaker suitable for you Mr. Ali Shaker" )
                            .font(.footnote)
                            .foregroundStyle(Color.gray)
                            .multilineTextAlignment(.leading)
                        
                        Text("13-09-2024")
                            .font(.footnote)
                            .foregroundStyle(Color.gray)
                    }
                    
                    Spacer()
                }
                .padding(10)
                
                // Dashed separator line
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [1.5]))
                    .foregroundColor(Color.gray.opacity(0.5))
                    .frame(height: 0.4)
                    .padding(.horizontal)
                
                // Second row with the image and text
                HStack {
                    Image(systemName: "rectangle.3.group.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.leading, 20)
                        .foregroundStyle(Color.black)
                    
                    Text("Rolex 47mm with Gold Strap")
                        .lineLimit(1)
                        .font(.subheadline)
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                }
                .padding([.top,.trailing, .bottom], 10)
            }
        }
        .frame(maxHeight: .none)
    }
}

#Preview {
    ChatBubbleView()
}
