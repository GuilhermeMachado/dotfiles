import Foundation

let fileManager = FileManager.default

if fileManager.fileExists(atPath: "~/.oh-my-zsh") {
    print("oh-my-zsh is already installed")
} else {
    print("Installing oh-my-zsh...")
    
    let installTask = Process()
    installTask.launchPath = "/bin/sh"
    installTask.arguments = ["-c", "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"]
    
    installTask.launch()
    installTask.waitUntilExit()
    
    if installTask.terminationStatus == 0 {
        print("oh-my-zsh installed successfully")

        // Get the URL of the .zshrc file in the home directory
        let zshrcHomeDirectoryURL = fileManager.homeDirectoryForCurrentUser.appendingPathComponent(".zshrc")
        if fileManager.fileExists(atPath: zshrcHomeDirectoryURL.path) {
            // Get the URL of the .zshrc file in the same directory as the script
            let zshrcScriptDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath).appendingPathComponent(".zshrc")

            do {
                // Replace the .zshrc file in the home directory with the .zshrc file in the same directory as the script
                try fileManager.removeItem(at: zshrcHomeDirectoryURL)
                try fileManager.copyItem(at: zshrcScriptDirectoryURL, to: zshrcHomeDirectoryURL)

                print(".zshrc file successfully replaced")
            } catch let error {
                print("Error replacing .zshrc file: \(error)")
            }
        } else {
            print(".zshrc file in home directory not found")
        }
    } else {
        print("oh-my-zsh installation failed")
    }
}
