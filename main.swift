import Foundation

var wordsList : [String] = []
while let input = readLine() {
    wordsList.append(input)
}

func swap(arr: inout [String], one: Int, two: Int) {
    let placeholder = arr[one]
    arr[one] = arr[two]
    arr[two] = placeholder
}

func selectionSort(arr: inout [String]) -> [String] {
    if arr.count == 1 {
        return arr
    }
    for i in 0 ..< arr.count {
        var minIndex = i
        for j in i + 1 ..< arr.count {
            if arr[minIndex] > arr[j] {
                minIndex = j
            }
        }
        swap(arr: &arr, one: i, two: minIndex)        
    }
    return arr
}
let sortedWords = selectionSort(arr: &wordsList)
for i in sortedWords {
    print(i)
}
