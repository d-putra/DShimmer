
![shimmer](https://github.com/user-attachments/assets/428751f4-fe0b-45ef-acf9-75d1745034af)

A lightweight and customizable shimmer loading view for iOS — built with UIView and SwiftUI support.

## ✨ Features

- ✅ Simple API with SwiftUI chaining
- 🎨 Customizable shimmer color, base color, corner radius
- 🔁 Dynamic rotation angle (0° to 360°)
- 🧱 Lightweight and fast — works with both UIKit & SwiftUI
## 🚀 Usage/Examples

**SwiftUI**

![shimmerview](https://github.com/user-attachments/assets/fbf1beee-d16d-4cec-9111-ea774ae40c49)
```swift
DShimmerView()
    .baseColor(.lightGray.withAlphaComponent(0.4))
    .shimmerColor(.white.withAlphaComponent(0.3))
    .rotationDegree(20)
    .frame(maxWidth: 140)
    .frame(height: 120)
```

![shimmer2](https://github.com/user-attachments/assets/663fbd42-6af8-4439-8f16-0e83cdcae04c)
```swift
Button {} label: {
    Text("Button With Text Shimmer")
        .foregroundColor(.white)
        .padding(.horizontal, 12)
        .padding(.vertical, 16)
        .bold()
        .dshimmer(baseColor: .clear, shimmerColor: .gray)
}
```
**UIKit**

## 🛠️ Installation 

 **Swift Package Manager**
 
File > Swift Packages > Add Package Dependency
- Search **DShimmer** or Add Package URL [https://github.com/d-putra/DShimmer.git](https://github.com/d-putra/DShimmer.git)

- Select "Up to Next Major" with "1.0"

 **Cocoapods**

Add this to your Podfile :
```swift
pod 'DShimmer', :git => 'https://github.com/d-putra/DShimmer.git', :tag => '1.0'
```
