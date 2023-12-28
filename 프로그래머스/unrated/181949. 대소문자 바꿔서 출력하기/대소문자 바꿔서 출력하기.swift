import Foundation

let s1 = readLine()!


var changeWord = ""
for i in s1 {
    
    if i.isLowercase {
         changeWord += i.uppercased()
    } else {
        changeWord += i.lowercased()
    }
    
}

print(changeWord)