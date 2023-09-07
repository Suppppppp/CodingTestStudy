import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var termsPair: [String: Int] = [ : ]
    
    for tm in terms {
        termsPair[String(tm.split(separator: " ")[0])] = Int(tm.split(separator: " ")[1])
    }
    
    ///
    
    
    var prDate:[String] = []
    var prtm:[String] = []
    
    for pv in privacies {
        prDate.append(String(pv.split(separator: " ")[0]))
        prtm.append(String(pv.split(separator: " ")[1]))
    }
    
    //
    
    for (index, term) in prtm.enumerated() {
        if let monthsToAdd = termsPair[term] {
            if index < prDate.count {
                var components = prDate[index].split(separator: ".")
                if components.count > 1 {
                    if var month = Int(components[1]), var year = Int(components[0]) {
                        month += monthsToAdd
                        year += (month - 1) / 12
                        month = (month - 1) % 12 + 1
                        components[0] = Substring("\(year)")
                        components[1] = Substring(String(format: "%02d", month))
                        prDate[index] = components.joined(separator: ".")
                    }
                }
            }
        }
    }
    // pastIndices 배열을 만들어서 today보다 이전인 날짜의 인덱스를 저장
    var pastIndices: [Int] = []
    
    // DateFormatter를 사용하여 문자열을 날짜로 변환
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy.MM.dd"
    
    // today를 Date 객체로 변환
    let todayDate = dateFormatter.date(from: today)
    
    // prDate 배열의 각 날짜와 today를 비교
    for (index, dateString) in prDate.enumerated() {
        if let date = dateFormatter.date(from: dateString) {
            if date <= todayDate! {
                pastIndices.append(index+1)
            }
        }
    }
    
    
    
    return pastIndices
}