import SwiftUI

struct PostGridView: View {
    let post: PostModel

    var body: some View {
        VStack {
            ImageView(post: post)
                .frame(width: 120, height: 120)

            Text(post.id)
                .font(.caption)
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(post: dev.post)
            .previewLayout(.sizeThatFits)
    }
}
