//
//  main.swift
//  NumberBaseballGame
//
//  Created by shinyoungkim on 3/10/25.
//

import Foundation

class NumberBaseballGame {
    var numArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    var userNumArray: [Int] = []
    var answerNumArray: [Int] = []
    var num = 0
    var tmp = 0
    var strikeCount = 0
    var ballCount = 0
    var attemptCountsPerGame: [Int] = []
    var attemptCount = 0
    
    func generateUniqueAnswerNumbers() {
        while answerNumArray.count < 3 {
            num = numArray.randomElement()!
            if answerNumArray.isEmpty && num == 0 {
                continue
            }
            if answerNumArray.contains(num) {
                continue
            }
            answerNumArray.append(num)
        }
    }
    
    func startNumberBaseballGame() {
        print("< 게임을 시작합니다 >")
        print("정답: \(answerNumArray)")
        while true {
            print("숫자를 입력하세요")
            guard let userInput = readLine(),
                  let userNum = Int(userInput), userNum / 1000 == 0
            else {
                print("올바르지 않은 입력값입니다")
                continue
            }
            attemptCount += 1
            
            tmp = userNum
            print(userNumArray)
            userNumArray = []
            
            while tmp > 0 {
                if !userNumArray.contains(tmp % 10) {
                    userNumArray.insert(tmp % 10, at: 0)
                    tmp /= 10
                } else {
                    print("올바르지 않은 입력값입니다2")
                    break
                }
                if userNumArray.count == 2 && tmp == 0 {
                    print("올바르지 않은 입력값입니다4")
                    break
                }
            }
            print(userNumArray)
                
            if userNumArray.count != 3 {
                print("올바르지 않은 입력값입니다3")
                continue
            }
            
            print(strikeCount)
            print(ballCount)
            strikeCount = 0
            ballCount = 0
            
            for (index, num) in userNumArray.enumerated() {
                if num == answerNumArray[index] {
                    strikeCount += 1
                } else if answerNumArray.contains(num) {
                    ballCount += 1
                }
            }
            print(userNumArray)
            
            if strikeCount == 0 && ballCount == 0 {
                print("Nothing")
            } else {
                print("\(strikeCount)스트라이크 \(ballCount)볼")
            }
            
            if strikeCount == 3 {
                print("정답입니다!")
                attemptCountsPerGame.append(attemptCount)
                break
            }
        }
    }
    
    func showGameRecords() {
        print("< 게임 기록 보기 >")
        for (index, item) in attemptCountsPerGame.enumerated() {
            print("\(index + 1)번째 게임 : 시도 횟수 - \(item)")
        }
    }
}
