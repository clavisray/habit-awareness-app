//
//  HomeView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 06/09/2026.
//

import SwiftUI

struct HomeView: View {
    
    @State private var count = 0;
    // @State private var totalActivities = totalActivities + count
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Today")
            Text("Stay aware")
                        
            HStack{
                VStack {
                    Text("Przejadanie")
                        .fontWeight(.bold)
                    Text("Dzisiaj \(count)")
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Button("+") {
                    count += 1;
                }
                .frame(width: 40, height: 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                
            }
            .padding()
            .background(.gray.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            HStack{
                VStack {
                    Text("Słodycze")
                        .fontWeight(.bold)
                    Text("Dzisiaj \(count)")
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Button("+") {
                    count += 1;
                }
                .frame(width: 40, height: 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                
            }
            .padding()
            .padding()
            .background(.gray.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            HStack{
                VStack {
                    Text("Doomscrolling")
                        .fontWeight(.bold)
                    Text("Dzisiaj \(count)")
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Button("+") {
                    count += 1;
                }
                .frame(width: 40, height: 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                
            }
            .padding()
            .padding()
            .background(.gray.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            HStack{
                VStack {
                    Text("Papierosy")
                        .fontWeight(.bold)
                    Text("Dzisiaj \(count)")
                        .foregroundStyle(.secondary)
                }
                Spacer()
                
                Button("+") {
                    count += 1;
                }
                .frame(width: 40, height: 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
            }
            .padding()
            .padding()
            .background(.gray.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
    }
    
}

#Preview {
    HomeView()
}
