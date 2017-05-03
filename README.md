[![Build Status](https://travis-ci.org/visualNACert/StringUtilities.svg?branch=master)](https://travis-ci.org/visualNACert/StringUtilities) [![codecov](https://codecov.io/gh/visualNACert/StringUtilities/branch/master/graph/badge.svg)](https://codecov.io/gh/visualNACert/StringUtilities) [![documentation](https://visualnacert.github.io/StringUtilities/badge.svg)](https://visualnacert.github.io/StringUtilities/) ![pod platforms](https://img.shields.io/cocoapods/p/StringUtilities.svg) ![pod version](https://img.shields.io/cocoapods/v/StringUtilities.svg) ![pod license](https://img.shields.io/cocoapods/l/StringUtilities.svg)

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
