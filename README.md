# SwiftKnife

`SwiftKnife` is a collection of extension, classes, structs and UI elements to help you code faster.

![Documentation](https://theinkedengineer.github.io/SwiftKnife/docs/1.x/badge.svg)
![PodVersion](https://img.shields.io/cocoapods/v/SwiftKnife.svg)
![SwiftLang badge](https://img.shields.io/badge/language-Swift%205.0-orange.svg)
![Platform](https://img.shields.io/cocoapods/p/SwiftKnife.svg)

[![codebeat badge](https://codebeat.co/badges/93a3c652-416d-40fc-835e-3d53b945e1d1)](https://codebeat.co/projects/github-com-theinkedengineer-swiftknife-master)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
![License](https://img.shields.io/github/license/theinkedengineer/SwiftKnife.svg)
[![Twitter](https://img.shields.io/twitter/url/https/theinkedgineer.svg?label=TheInkedgineer&style=social)](https://twitter.com/theinkedgineer)

# 1. Requirements and Compatibility
| Swift               | SwiftKnife     |  iOS     |
|-----------------|----------------|---------|
|       5.0            | 2.x                |  10+     |

# 2. Installation

## Cocoapods

Add the following line to your Podfile
` pod 'SwiftKnife' ~> '2.0' `


# 3. Documentation
`SwiftKnife` is fully documented. Checkout the documentation [**here**](https://theinkedengineer.github.io/SwiftKnife/docs/2.x/index.html).

# 4. Contribution

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github)

## Generate the project
You might notice the abscence of the `.xcodeproj` file. That is because I rely on [xcodegen](https://github.com/yonaskolb/XcodeGen) to generate the project correctly. It is a great tool to customize a project and generate it on the go.

You can either install it manually following their steps, or just run my `setup.sh` script. It automatically installs [Homebrew](https://brew.sh) if it is missing, installs `xcodegen`, removes existing (if present) `.xcodeproj`, run `xcodegen` and moves configuratiom files to their appropriate place.
