#!/bin/bash

xcodebuild archive -scheme AldAnalytics -destination "generic/platform=iOS" only_active_arch=no -archivePath Device GCC_GENERATE_DEBUGGING_SYMBOLS=no SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE="mh_dylib"

xcodebuild archive -scheme AldAnalytics -destination "generic/platform=iOS Simulator" only_active_arch=no -archivePath Simulator GCC_GENERATE_DEBUGGING_SYMBOLS=no SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE="mh_dylib"

xcodebuild -create-xcframework -framework Device.xcarchive/Products/Library/Frameworks/AldAnalytics.framework -framework Simulator.xcarchive/Products/Library/Frameworks/AldAnalytics.framework -output "AldAnalytics.xcframework"
