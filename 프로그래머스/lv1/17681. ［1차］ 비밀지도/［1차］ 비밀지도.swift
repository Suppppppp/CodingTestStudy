func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    for i in 0..<n {
        let binary1 = String(arr1[i], radix: 2)
        let binary2 = String(arr2[i], radix: 2)

        let paddedBinary1 = String(repeating: "0", count: n - binary1.count) + binary1
        let paddedBinary2 = String(repeating: "0", count: n - binary2.count) + binary2

        var rowString = ""

        for j in 0..<n {
            let index = paddedBinary1.index(paddedBinary1.startIndex, offsetBy: j)
            if paddedBinary1[index] == "1" || paddedBinary2[index] == "1" {
                rowString += "#"
            } else {
                rowString += " "
            }
        }

        answer.append(rowString)
    }

    return answer
}