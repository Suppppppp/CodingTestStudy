import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    
    
    let A = String(a) + String(b)
    let B = String(b) + String(a)
    
    let result = Int(A)! > Int(B)! ? Int(A)! : Int(B)!
    
    
    return result
}