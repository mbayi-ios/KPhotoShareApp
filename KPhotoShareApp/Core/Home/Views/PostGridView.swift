import SwiftUI

struct PostGridView: View {
    var body: some View {
        VStack {
            Image("profile")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 120, height: 120)
               .clipShape(RoundedRectangle(cornerRadius: 5))

        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
            .previewLayout(.sizeThatFits)
    }
}
