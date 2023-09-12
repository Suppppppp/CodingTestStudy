import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var result:[Int] = []
    var infoDic = [String : ([String], Int, Int ) ]()
            //     본인   :[신고한사람목록] , 신고당한 횟수 , 연락받을 횟수  
    
    for i in id_list {
        infoDic[i] = ([], 0, 0 )
    }
    
    //동일인이 여러번 신고 제거 
    let uniquedReport = Array(Set(report))
    
    for j in uniquedReport {
        
        //신고자랑 피의자
        let singoja = String( j.split(separator:" ")[0] )
        let pchair = String( j.split(separator:" ")[1] ) 
        
        infoDic[singoja]?.0.append(pchair) //신고한 사람목록추가
        infoDic[pchair]?.1 += 1 // 신고당한 횟수 추가
         
    }
    
    // k 기준을 넘은 사람을 신고한 사람에게 연락받을 횟수 추가
    for (key, value) in infoDic {
        let newMailCount = value.0.filter { 
            guard let reportCount = infoDic[$0]?.1 else { return false }
            return reportCount >= k 
        }.count
        infoDic[key]?.2 += newMailCount
    }
    
    for r in id_list {
        if let a = infoDic[r]?.2 {
            result.append(a)
        }
        
    }
    
    return result
}