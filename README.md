# SwiftKnife

This repository contains a collection of helpers and extensions that I use in my personal Swift projects to make my life easier. 

## Generate the project
You might notice the abscence of the `.xcodeproj` file. That is because I rely on [xcodegen](https://github.com/yonaskolb/XcodeGen) to generate the project correctly. It is a great tool to customize a project and generate it on the go.

You can either install it manually following their steps, or just run my `setup.sh` script. It automatically installs [Homebrew](https://brew.sh) if it is missing, installs `xcodegen`, removes existing (if present) `.xcodeproj`, run `xcodegen` and moves configuratiom files to their appropriate place.
