# SwiftUIPhoneNumber

This is a pure SwiftUI implementation of phone number TextField, which is highly customizable.

![alt text](preview.gif)


## Minimal usage:
```swift

//
@State var countryCode = ""
@State var phoneNumber = UserModel.shared.phoneNumber

// 
SwiftUIPhoneNumber(countryCode: $countryCode, phoneNumber: $phoneNumber)

```

It takes country code (without +) and phone number. The code can be further customized by implementing extended functions like regex/validation etc. to the phone number.




## Full implementation:
```swift

// 
SwiftUIPhoneNumber(countryCode: Binding<String>, phoneNumber: Binding<String>, height: CGFloat, backgroundColor: Color, textColor: Color, textFont: Font, titleColor: Color, countryColor: Color, titleFont: Font, countryFont: Font)

```



### Some important notes:

1. This library is just for iOS platfrom.
2. Do not make height too small (passing height parameter). Find a suitable number and test it by giving various inputs(height).
3. If in ZStack, make sure to set the outer view zIndex(1) or higher; e.g.,

```swift

//
HStack {
    SwiftUIPhoneNumber(countryCode: $countryCode, phoneNumber: $phoneNumber)
}
.frame(height: 60)
.zIndex(1) // <- THIS

```


[@shanezzar](https://www.shanezzar.com).
