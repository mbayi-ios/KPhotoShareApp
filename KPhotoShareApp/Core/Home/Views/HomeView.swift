
import SwiftUI

struct HomeView: View {

    let columns:[GridItem] =  Array(repeating: .init(.flexible(), spacing:2), count: 3)

    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 10){
                ForEach(0..<10) {index in
                    Rectangle()
                        .frame( height: 150)
                }
            }
        }

    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView()
    }

}
