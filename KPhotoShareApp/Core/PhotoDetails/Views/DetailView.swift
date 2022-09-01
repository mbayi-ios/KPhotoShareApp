import SwiftUI

struct DetailView: View {
    let post: PostModel

    var body: some View {
        VStack{
            AsyncImage(url: URL(string: post.thumbnailURL), content: { returnedImage in
                returnedImage
                    .resizable()
                    .scaledToFit()
            }, placeholder: {
                ProgressView()
            })

            Text(post.createdAt)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(post: dev.post)
    }
}
