import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
// vn = 2의 배수    
// ( brwon - vn ) / 2   = brwonWidth
// brwonWidth * ( (vn/2) + 2) - brown = yellow
    
    var answer = [Int]()
    
    for i in 1...brown {
        
        var vn = 2 * i
        let brownWidth = ( brown - vn ) / 2
        let check = (brownWidth * ((vn / 2) + 2 )) - brown
        
        if yellow == check  {
            answer.append(brownWidth)
            answer.append((vn/2) + 2)
            
            return  answer
        }
        
    }

    return answer
}


