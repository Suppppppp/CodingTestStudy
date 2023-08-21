import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    var scoreOne = 0
    var scoreTwo = 0
    var scoreThree = 0

    let one = [1,2,3,4,5]
    let two = [2,1,2,3,2,4,2,5]
    let three = [3,3,1,1,2,2,4,4,5,5]
    
    
    for (idx, num) in answers.enumerated() {
        
        if idx != 0 {
            scoreOne = one[ idx % one.count ] == num ? scoreOne + 1 : scoreOne
            scoreTwo = two[idx % two.count] == num ? scoreTwo + 1 : scoreTwo
            scoreThree = three[idx % three.count] == num ? scoreThree + 1 : scoreThree
      
        } else  {
            scoreOne = one[idx] == num ? scoreOne + 1 : scoreOne
            scoreTwo = two[idx] == num ? scoreTwo + 1 : scoreTwo
            scoreThree = three[idx] == num ? scoreThree + 1 : scoreThree
            
        }
    }
    
    // 정답 맞힌 갯수 수포자1,2,3와 점수 각각 dictionary로 모으기
    let dic = [1: scoreOne, 2: scoreTwo, 3: scoreThree]
    
    // score점수 기준으로 정렬하고 값이 같은 경우 key값으로 정렬
    let sortedDic = dic.sorted {
        //score가 같으면
        if $0.1 == $1.1 {
            // key값을 오름차순 정렬
            return $0.0 < $1.0
        }
        // score가 안같으면 score값으로 오름차순 정렬
        return $0.1 < $1.1
    }
    
    // 정렬된 dic에서 제일 큰 점수 뽑기 
    let maxScore = sortedDic.last!.value
    // 제일 큰 점수랑 같은 key값들을 뽑아 오름차순 정렬의 array로 반환
    let keysWithMaxScore = dic.filter { $0.value == maxScore }
                          .map { $0.key }
                          .sorted()
    
    return keysWithMaxScore
}