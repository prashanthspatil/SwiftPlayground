//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// ------------------------QUICK SORT------------------------------------------------
func quickSort(_ input: [Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }
    
    let pivotIndex = input.count / 2
    let pivot = input[pivotIndex]
    
    let less = input.filter {$0 < pivot}
    let equal = input.filter {$0 == pivot}
    let greater = input.filter {$0 > pivot}
    
    return quickSort(less) + equal + quickSort(greater)
}

let numbers = [0, 9, 6, 2, 3, 2, 1, 3]
let qsorted = quickSort(numbers)
print(qsorted)

// ------------------------MERGE SORT------------------------------------------------

func mergeSort(_ input: [Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }
    
    let splitIndex = input.count / 2
    let leftArray = mergeSort(Array(input[0..<splitIndex]))
    let rightArray = mergeSort(Array(input[splitIndex..<input.count]))
    
    return merge(leftPart: leftArray, rightPart: rightArray)
}

func merge(leftPart: [Int], rightPart: [Int]) -> [Int] {
    var sorted = [Int]()
    
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < leftPart.count && rightIndex < rightPart.count {
        if leftPart[leftIndex] < rightPart[rightIndex] {
            sorted.append(leftPart[leftIndex])
            leftIndex += 1
        } else if leftPart[leftIndex] > rightPart[rightIndex] {
            sorted.append(rightPart[rightIndex])
            rightIndex += 1
        } else {
            sorted.append(leftPart[leftIndex])
            leftIndex += 1
            sorted.append(rightPart[rightIndex])
            rightIndex += 1
        }
    }
    
    if leftIndex < leftPart.count {
        sorted.append(contentsOf: leftPart[leftIndex..<leftPart.count])
    } else if rightIndex < rightPart.count {
        sorted.append(contentsOf: rightPart[rightIndex..<rightPart.count])
    }
    
    return sorted
}
//: Test
let unsorted = [0, 9, 6, 2, 3, 2, 1, 3]
print("Unsorted \(unsorted)")
let sorted = mergeSort(unsorted)

print("Sorted with merge sort \(sorted)")

// ------------------------BUBBLE SORT------------------------------------------------
func bubbleSort(_ input:[Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }
    
    var result = input
    let count = result.count
    
    var isSwapped = false
    
    repeat {
        isSwapped = false
        for index in 1..<count {
            if result[index] < result[index - 1] {
                var lastElement = result[index]
                var lastButElement = result[index-1]
                swap(&lastButElement, &lastElement)
                isSwapped = true
            }
        }
    } while isSwapped
    
    return result
}

let unsortedArray = [10, 9, 61, 12, 14, 11, 1, 0]
print("Unsorted \(unsortedArray)")
let sortedArray = mergeSort(unsortedArray)

print("Sorted with merge sort \(sortedArray)")

