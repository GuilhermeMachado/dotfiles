import Foundation

print("Installing bundler...")

let task = Process()
task.launchPath = "/usr/bin/env"
task.arguments = ["gem", "install", "bundler"]

let pipe = Pipe()
task.standardOutput = pipe
task.standardError = pipe
task.launch()
task.waitUntilExit()

let data = pipe.fileHandleForReading.readDataToEndOfFile()
let output = String(data: data, encoding: .utf8)

if task.terminationStatus == 0 {
    print("Bundler installed successfully.")
    
    let bundleTask = Process()
    bundleTask.launchPath = "/usr/bin/env"
    bundleTask.arguments = ["bundle", "install"]
    
    let bundlePipe = Pipe()
    bundleTask.standardOutput = bundlePipe
    bundleTask.standardError = bundlePipe
    bundleTask.launch()
    bundleTask.waitUntilExit()
    
    let bundleData = bundlePipe.fileHandleForReading.readDataToEndOfFile()
    let bundleOutput = String(data: bundleData, encoding: .utf8)
    
    if bundleTask.terminationStatus == 0 {
        print("Dependencies installed successfully.")
    } else {
        print("Failed to install dependencies.")
        print(bundleOutput!)
    }
} else {
    print("Failed to install bundler.")
    print(output!)
}