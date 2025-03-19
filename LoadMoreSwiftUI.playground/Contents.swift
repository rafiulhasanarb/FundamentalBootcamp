import UIKit

import SwiftUI
struct ContentView: View {
    @State private var data = Array(1...20)
    @State private var isLoadMore = false
    private let gridSpacing: CGFloat = 5
    private let gridItemPadding: CGFloat = 5
    private let loadMoreDelay: Double = 1.5
    
    @State var itemColors: [Int: Color] = [:]
    
    private var gridColumn: [GridItem] {
        [GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 3 - gridItemPadding * 2))]
    }
    
    let threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: threeColumnGrid, spacing: gridSpacing) {
                ForEach(data, id: \.self) { item in
                    Text(String(item))
                        .frame(width: UIScreen.main.bounds.width / 3 - gridSpacing, height: 150)
                        .background(getColor(for: item))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.title)
                        .onAppear {
                            loadMoreIfNeeded(currentItem: item)
                        }
                }
            }
            .padding(.horizontal, gridItemPadding)
            
            if isLoadMore {
                ProgressView("Loading more...")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .padding(.vertical)
            }
        }.onAppear(perform: setupColors)
    }
    
    private func loadMoreIfNeeded(currentItem: Int) {
        guard !isLoadMore, currentItem == data.last else { return }
        loadMore()
    }
    
    private func loadMore() {
        isLoadMore = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + loadMoreDelay) {
            let nextItems = data.count + 1...data.count + 20
            data.append(contentsOf: nextItems)
            setupColors()
            isLoadMore = false
        }
    }
    
    private func setupColors() {
        for index in data {
            if itemColors[index] == nil {
                itemColors[index] = randomColor()
            }
        }
    }
    
    private func getColor(for index: Int) -> Color {
        return itemColors[index] ?? Color.clear
    }
    
    private func randomColor() -> Color {
        Color(hue: .random(in: 0...1), saturation: .random(in: 0.5...1), brightness: .random(in: 0.6...1))
    }
}

#Preview {
    ContentView()
}
