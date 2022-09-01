import SwiftUI

struct ImageView: View {
    @StateObject var vm: ImageViewModel

    init(post: PostModel) {
        _vm = StateObject(wrappedValue: ImageViewModel(post: post))
    }
    var body: some View {
        VStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 120, height: 120)
                   .clipShape(RoundedRectangle(cornerRadius: 5))

            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(post: dev.post)
    }
}
