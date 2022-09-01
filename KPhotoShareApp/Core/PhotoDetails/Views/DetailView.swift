import SwiftUI

struct DetailView: View {
    let post: PostModel

    var body: some View {
        Text("\(post.size)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(post: dev.post)
    }
}
