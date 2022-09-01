import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allPosts: [PostModel] = []

    private let dataService = PostDataService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    func addSubscribers() {
        dataService.$allPosts
            .sink{[weak self] (returnedPosts) in
                self?.allPosts = returnedPosts
            }
            .store(in: &cancellables)
    }
}
