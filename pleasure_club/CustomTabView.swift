import SwiftUI
import SwiftData

struct CustomTabView: View {
    
    var body: some View {
        TabView {
                Text("Favourites Screen")
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favourites")
                }
                Text("Friends Screen")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Friends")
                }
                Text("Nearby Screen")
                    .tabItem {
                        Image(systemName: "mappin.circle.fill")
                        Text("Nearby")
                }
            }.navigationBarBackButtonHidden(true)
    }
}
