import SwiftUI

struct DetailView: View {
    let post: PostModel

    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: post.thumbnailURL), content: { returnedImage in
                returnedImage
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)

                .overlay(ImageOverlayContent(post: post), alignment: .bottomTrailing)
                

            }, placeholder: {
                ProgressView()
            })

            VStack {
                Spacer()
                Text("KPhotoShare")
                    .font(.largeTitle)
                    .fontWeight(.light)
                Divider().background(Color.white)
                Text("This image was created At.\n\n \(post.formatDate)")
                    .fontWeight(.light)
                Divider().background(Color.white)

            }
            .foregroundColor(.white)
            .padding()
            .padding(.bottom, 64)

        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(post: dev.post)
    }
}


struct ImageOverlayContent: View {
    let post: PostModel
     var body: some View {
         LinearGradient(gradient:
                            Gradient(stops: [
                                .init(color: Color.black.opacity(0.9), location: 0),
                                .init(color: Color.black.opacity(0.2), location: 1.0)
                            ]),
                           startPoint: .bottom,
                           endPoint: .top
            )
             .edgesIgnoringSafeArea(.all)

    }
}
