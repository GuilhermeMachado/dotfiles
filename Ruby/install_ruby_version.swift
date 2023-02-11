import Foundation

guard CommandLine.arguments.count == 2 else {
    print("Error: Missing Ruby version argument.")
    exit(1)
}

let rubyVersion = CommandLine.arguments[1]

// Check if rbenv is installed
let rbenvCheckTask = Process()
rbenvCheckTask.launchPath = "/bin/bash"
rbenvCheckTask.arguments = ["-c", "rbenv --version"]

let rbenvCheckPipe = Pipe()
rbenvCheckTask.standardOutput = rbenvCheckPipe
rbenvCheckTask.launch()

let rbenvCheckData = rbenvCheckPipe.fileHandleForReading.readDataToEndOfFile()
let rbenvCheckOutput = String(data: rbenvCheckData, encoding: .utf8)!

if rbenvCheckOutput.contains("rbenv not found") {
    print("Error: rbenv is not installed.")
    exit(1)
}

// Install and set Ruby version as global
let installAndSetTask = Process()
installAndSetTask.launchPath = "/bin/bash"
installAndSetTask.arguments = ["-c", "rbenv install \(rubyVersion) -s && rbenv global \(rubyVersion)"]

let installAndSetPipe = Pipe()
installAndSetTask.standardOutput = installAndSetPipe
installAndSetTask.launch()

let installAndSetData = installAndSetPipe.fileHandleForReading.readDataToEndOfFile()
let installAndSetOutput = String(data: installAndSetData, encoding: .utf8)!

print("Installing and setting Ruby \(rubyVersion) as global...")
print(installAndSetOutput)