# SwiftChallenge

Instructions:

1. Download or clone repository
2. Open CodingChallenge.xcworkspace file in Xcode
3. Build and run the current scheme in simulator **(works on iPhone 4s, iPhone 5, iPhone 5s, iPhone 6, iPhone 6 Plus, iPhone 6s and iPhone 6s Plus in both Portrait and Landscape mode)**

###3rd Party Dependencies

This small application incorporates four 3rd party dependencies via CocoaPods:

1. KeychainSwift (**to securely store image clinic ids and names as _values_ in tandem with the _key_ clinic type**)
2. SwiftyJSON (**to facilicate simplified parsing of JSON data**) 
3. AwesomeCache (**for performant caching and retrieval of clinic data with NSCache**)
4. UIColor_Hex_Swift (**to wrap UIColor, making work with backgrounds and gradients easier**)

###MVC

A basic MVC structure is used here:

1. The data **model** is relegated to two classes: Clinic.swift and ClinicStorage.swift, the former with a number of convenience methods to get information associated with an image clinic (as well as initializers for clinic, location and geolocation), and the latter handling the parsing and caching of clinic JSON data, as well as the secure storage of clinic id and name properties.
2. The **view** class is minimal but useful, abiding by the decorator pattern via an extension and wrapping a UIColor_Hex_Swift method. A convenience method for UIButton is provided to promote easy, painless application of layer gradients: 

```swift
mapButton.layer.borderColor = UIColor(rgba: "#5284c2").CGColor
```

3. The **controller** classes are kept as barebones as possible, aiming to seperate a good amount of the data model business logic and view wizardry. CollectionViewController.swift takes the JSON data from cache after app launch and renders it in a UICollectionView via a UICollectionViewCell, which transitions to the size of a mobile screen accordingly. DetailViewController.swift pulls relevant details from the data model on a per image clinic basis and displays a UIButton with an applied gradient layer, allowing the user to segue to the final view controller in the navigation stack. The MapViewController uses Apple Maps, taking the lat/long data from the appropriate clinic, and providing a point annotation for it, centered on the screen.
