[![Build Status](https://www.bitrise.io/app/d46e720d40bb06a2.svg?token=1ixdj23dbZJgJ3rjHcqkSg&branch=swift-2)](https://www.bitrise.io/app/d46e720d40bb06a2) ![platform iOS](https://img.shields.io/badge/platform-iOS-blue.svg) ![platform macOS](https://img.shields.io/badge/platform-macOS-blue.svg) ![swift2 compatible 0.0.5](https://img.shields.io/badge/swift2-0.0.5-brightgreen.svg) ![swift3 compatible](https://img.shields.io/badge/swift3-compatible-brightgreen.svg) ![pod 0.0.5](https://img.shields.io/badge/pod-0.0.5-blue.svg)

# String Utilities

This is a small collection of utilities to work with strings easily, including:

- Removing multiple occurrences of multiple strings.
- Retrieving regex capture groups.
- Trimming strings.

# API

```swift

// Range based subscript...
let string = "Lorem ipsum dolor sit amet"
let lorem = string[0..<5]

// Readable join...
let characters = ["Obi Wan-Kenobi", "Darth Vader", "Luke Skywalker"]
print(characters..joined(separator: ", ", lastElementSeparator: " and "))
// Obi Wan-Kenobi, Darth Vader and Luke Skywalker

// Remove substrings...
let string = "Lorem ipsum dolor sit amet"
let withoutLorem = string.removing("Lorem")
let withoutVowels = string.removing(["a", "e", "i", "o", "u"])

// Trim...
let string = "Lorem ipsum dolor sit amet   "
print(string.trimmed) // Lorem ipsum dolor sit amet

// Regex...
let html = "<img src=\"image_src\" title=\"An image\" alt=\"Some text\" />"

let matches = try! html.matches(for: "<img.*src=\\\"([^\"]*)\\\".*\\/>")

print(matches[0]) // <img src="image_src" title="An image" alt="Some text" />
print(matches[1]) // image_src

```
