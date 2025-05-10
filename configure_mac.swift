import Foundation

let commands: [[String]] = [
    ["defaults", "write", "com.apple.dock", "show-recents", "-bool", "false"],
    ["killall", "Dock"],
    ["defaults", "write", "com.apple.dock", "minimize-to-application", "-bool", "true"],
    ["killall", "Dock"],
    ["defaults", "write", "NSGlobalDomain", "KeyRepeat", "-int", "2"],
    ["defaults", "write", "-g", "InitialKeyRepeat", "-int", "15"],
    ["defaults", "write", "-g", "com.apple.mouse.scaling", "-float", "1"],
    ["killall", "SystemUIServer"]
]

for command in commands {
    let process = Process()
    process.launchPath = "/usr/bin/env"
    process.arguments = command

    let pipe = Pipe()
    process.standardOutput = pipe
    process.standardError = pipe

    do {
        try process.run()
        process.waitUntilExit()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8), !output.isEmpty {
            print("Output: \(output)")
        }
    } catch {
        print("Erro ao executar: \(command.joined(separator: " "))")
    }
}
