struct AppState {
    var searchState: SearchState
}

struct SearchState {
    var keyword: String?
}

var appState = AppState(searchState: .init())

var keyPath = \AppState.searchState

appState[keyPath: \AppState.searchState] // = appState.searchState

func reducer(state: inout SearchState) {
    state.keyword = "London"
}

func higherOrderReducer(keyPath: WritableKeyPath<AppState, SearchState>) {
    reducer(state: &appState[keyPath: keyPath])
}

higherOrderReducer(keyPath: \AppState.searchState)

print(appState)
