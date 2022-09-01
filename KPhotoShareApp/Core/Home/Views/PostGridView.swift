import SwiftUI

struct PostGridView: View {
    let post: PostModel

    var body: some View {
        VStack {
            ImageView(post: post)
                .frame(width: 120, height: 120)
                .overlay(ImageOverlay(post: post), alignment: .bottomTrailing)
        }
    }
}


struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(post: dev.post)
            .previewLayout(.sizeThatFits)
    }
}


struct ImageOverlay: View {
    let post: PostModel
     var body: some View {
         ZStack {
             Text("\(post.mbSize)")
                 .font(.caption2)
                 .padding(6)
                 .foregroundColor(.white)
         }
         .background(Color.black)
         .cornerRadius(5)

    }
}
