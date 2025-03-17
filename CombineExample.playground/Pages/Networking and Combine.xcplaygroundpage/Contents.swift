import Combine
import Foundation

struct Contact: Codable {
    let id: Int
    let fullName: String
    let userEmail: String
    
    // Define custom coding keys to match JSON keys
    private enum CodingKeys: String, CodingKey {
        case id
        case fullName = "name"
        case userEmail = "email"
    }
}

struct ServerResponse: Codable {
    let responseID: String
    let timestamp: String
    let orgID: String
    let contact: Contact
}

class ContactRequest {
    func fetchData() -> AnyPublisher<Contact, Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/1")!
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: Contact.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

class DataStore {
    @Published var contacts: [Contact] = []
}

class ContactsSync {
    let contactRequest = ContactRequest()
    let dataStore = DataStore()
    private var cancellables = Set<AnyCancellable>()
    
    func syncContacts() {
        contactRequest.fetchData()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("Data fetch completed successfully")
                    case .failure(let error):
                        print("Error fetching data: \(error)")
                    }
                }, receiveValue: { contact in
                    self.dataStore.contacts.append(contact)
                }
            )
            .store(in: &cancellables)
    }
}
