import Foundation

let fileManager = FileManager.default
let repositoryURL = URL(string: "https://github.com/powerline/fonts.git")!
let cloneDirectory = URL(fileURLWithPath: fileManager.currentDirectoryPath).appendingPathComponent("powerline-fonts")

// Check if Git is installed
let whichTask = Process()
whichTask.launchPath = "/usr/bin/which"
whichTask.arguments = ["git"]

let pipe = Pipe()
whichTask.standardOutput = pipe
whichTask.launch()
whichTask.waitUntilExit()

let data = pipe.fileHandleForReading.readDataToEndOfFile()
let output = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .newlines)

guard output == "/usr/bin/git" else {
    print("Git is not installed on this machine.")
    exit(1)
}

// Step 1: Clone the repository
let cloneTask = Process()
cloneTask.launchPath = "/usr/bin/git"
cloneTask.arguments = ["clone", repositoryURL.absoluteString, cloneDirectory.path]
cloneTask.launch()
cloneTask.waitUntilExit()

// Step 2: Execute install.sh
let installScript = cloneDirectory.appendingPathComponent("install.sh")
let installTask = Process()
installTask.launchPath = installScript.path
installTask.arguments = []
installTask.launch()
installTask.waitUntilExit()

// Step 3: Delete the cloned repository
do {
    try fileManager.removeItem(at: cloneDirectory)
} catch {
    print("Error deleting the cloned repository: \(error)")
}
