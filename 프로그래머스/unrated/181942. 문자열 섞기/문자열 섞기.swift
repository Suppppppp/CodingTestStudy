import Foundation

func solution(_ str1:String, _ str2:String) -> String {
    
    var resultWord = ""
    
    for (i,j) in zip(str1, str2) {
        
        resultWord += String(i)
        resultWord += String(j)
    }
    
    
    return resultWord
}