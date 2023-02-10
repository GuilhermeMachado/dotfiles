import Foundation

let fileManager = FileManager.default
let ohMyZshThemesDirectory = "~/.oh-my-zsh/themes"
let destinationPath = NSString(string: ohMyZshThemesDirectory).expandingTildeInPath + "/agnoster.zsh-theme"
let sourcePath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath).appendingPathComponent("agnoster.zsh-theme").path

do {
    if !fileManager.fileExists(atPath: NSString(string: ohMyZshThemesDirectory).expandingTildeInPath) {
        try fileManager.createDirectory(atPath: NSString(string: ohMyZshThemesDirectory).expandingTildeInPath, withIntermediateDirectories: true, attributes: nil)
    }
    if fileManager.fileExists(atPath: destinationPath) {
        try fileManager.removeItem(atPath: destinationPath)
    }
    try fileManager.copyItem(atPath: sourcePath, toPath: destinationPath)
    print("agnoster.zsh-theme installed successfully to \(destinationPath)")
} catch {
    print("Error installing agnoster.zsh-theme: \(error)")
}
