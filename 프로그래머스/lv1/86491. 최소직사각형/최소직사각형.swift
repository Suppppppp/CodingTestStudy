import Foundation

func solution(_ sizes:[[Int]]) -> Int {

    var first = [0]
    var second = [0]

    for i in sizes {
        
        if i[0] > i[1] {
            first.append(i[0])
            second.append(i[1])
        } else {
            first.append(i[1])
            second.append(i[0])
        }
           
    }
    
    return first.max()! * second.max()!
}