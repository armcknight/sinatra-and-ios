#  ios

The `ios` component of `sinatra-and-ios` communicates with the `sinatra` component to download a description of some sushi.

## Development

The project is set up to use `rbenv` and has a local `bundler` configuration. All gems are installed locally to `vendor/bundle`, and their cached versions at `vendor/bundle` are checked into source control. `Pods/` is also checked in.

`cocoapods-keys` manages the endpoint with which to communicate over the network. You must run `pod install` to set a value before building the app for the first time. 

## Implementation

Once the root view controller is loaded, a new `dataTask` is constructed from a private `URLSession` property and resumed after displaying an activity indicator on screen. Upon receiving a response, the indicator is hidden, basic error checking is done (displaying messages to screen in case) and the payload data is decoded. This uses a `Codable` `struct` named `Sushi`, which just has one property: an `Array` of `String`s named `types`. Because its name differs from the payload's JSON key, the `CodingKey` `enum` is provided to translate. Once decoded, the contents are written to screen. 
