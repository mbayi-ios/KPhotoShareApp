import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedPost: PostModel? = nil
    
    let columns:[GridItem] =  Array(repeating: .init(.flexible(), spacing:2), count: 3)
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 10){
                    ForEach(vm.allPosts) {post in
                        NavigationLink(destination: DetailView(post: post), label: {
                            PostGridView(post: post)
                        })
                        
                    }
                }
            }
            .navigationTitle("KPhotos")
        }

    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
        .environmentObject(dev.homeVM)
    }
    
}
