
# Steps to Run the App

1. Build in Xcode 16.0.
	a. If you wish to enable the Debug UI which enables a picker at the top to force a particular state (Valid response, Empty response, Invalid API response, or choose at random), uncomment line 21 in `FetchMobileRecipesApp.swift`.
	b. By default, the SwiftUI Preview for `FetchMobileRecipesView` has the debug UI enabled, so this can be an alternative to enabling in the app itself.
2. Run in simulator. 

# Focus Areas

- Focus was placed on building out a solid architecture by leveraging the Model-View-ViewModel (MVVM) paradigm, utilizing Dependency Injection (DI) to create more testable/mockable components, and by separating the XCode project into relevant groups. This priority was made to provide a template for clean iOS app architecture to allow for easier refactoring and testability.
- Dependencies were moved to the topmost App level in order to achieve Dependency Injection, with protocols implemented in order to create clean code that can be testable through the ability to inject Mocks (for SwiftUI Previews, XCTests unit tests) and mock implementations (for API client, etc).
- App-level dependencies were moved into a top-level `Configuration` object that is created in `FetchMobileRecipesApp` and passed into the parent SwiftUI View as an `@EnvironmentObject`.
- Also, some more refactoring was done to separate all the necessary subviews within `FetchMobileRecipesView` into their own classes for easier maintainability.
- Unit tests focused on testing the output state of `FetchRecipesViewModel` by testing each of the various endpoints: Valid, Invalid, and Empty responses.

# Time Spent

- About 5 hours was allocated to this project.

- Initial implementation only took 2 hours, however in keeping good architecture in mind for re-usability / refactoring, the code was broken up into multiple source files separated by class/struct type (in keeping in alignment with MVVM).

# Trade-offs and Decisions

- Due to the current scope of this project only requiring a single screen displaying list of recipes, the assumption was made to use smaller thumbnails provided by the API response in order to minimize data as well as increase performance.

- As more SwiftUI screens are added to the project, it would be pertinent to consider the use of a Router/Coordinator pattern to separate out the navigation logic between screens and allow that logic to be tested separately of inter-dependent SwiftUI Views.

- A trade-off of using SwiftUI List instead of UITableView/UICollectionView is the lack of built-in functionality to pre-fetch data using `UITableViewDataSourcePrefetching`/`UICollectionViewDataSourcePrefetching` protocols, which could have been leveraged along with the Nuke library to prefetch images outside the current visible scroll area for even better performance. However this does increase network bandwidth and could over-fetch images and bloat the image cache unnecessarily.

- Also left out was the ability to re-sort the list by different criteria (e.g. by cuisine type), instead using the default ascending sort by recipe name.

- Unit tests currently access the API endpoints directly using the API Client. It would've been better to isolate Networking through a Mock service that loads static JSON files locally to rule out network fluctuations, however for the sake of time, this was left out to prioritize app architecture.

# Weakest Part of the Project

- Due to the smaller scale of this project involving one single screen, no architecture was implemented to handle an extensible Router/Coordinator pattern.

- Extra mocking to stub out the networking code for a local-JSON-reading mock API would've made for a better testing framework, but was left out due to time constraints.

# External Code and Dependencies

- Only external library / dependency used was [Nuke](https://github.com/kean/Nuke) for the image caching. Ease of use, flexibility, SwiftUI support, well-documented and maintained, and providing the ability to switch caching types (in-memory, disk, URL) to force disk caching only, these features were a huge consideration in considering this library to handle the image caching details in order to focus on the app itself.

# Additional Information

- None
