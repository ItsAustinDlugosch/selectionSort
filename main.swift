func swap(words: inout [String], one: Int, two: Int) {
    let temp = words[one]
    words[one] = words[two]
    words[two] = temp
}

func selectionSort(words: inout [String]) {
    if words.count == 1 {
        return
    }
    for i in 0 ..< words.count {
        var minIndex = i
        for j in i + 1 ..< words.count {
            if words[minIndex] > words[j] {
                minIndex = j
            }
        }
        swap(words: &words, one: i, two: minIndex)        
    }
}

func main() {
    var wordsList : [String] = []
    while let input = readLine() {
        wordsList.append(input)
    }
    selectionSort(words: &wordsList)
    for word in wordsList {
        print(word)
    }
}

main()
