import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    
    var playerToRank = [String: Int]()
    var chPlay = players
    
    for (i, n) in players.enumerated() {
        playerToRank[n] = i
    }
    
    for name in callings {
        // 순위를 찾기
        if let nameIndex = playerToRank[name] {
            chPlay.swapAt(nameIndex , nameIndex - 1)
            
            // 딕셔너리도 업데이트
            let swappedName = chPlay[nameIndex]
            playerToRank[name] = nameIndex - 1
            playerToRank[swappedName] = nameIndex
        }
    }
    
    return chPlay
}


