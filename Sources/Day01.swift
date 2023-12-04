import Algorithms
import Foundation
import Parsing

/*
 --- Day 1: Trebuchet?! ---
 
 Something is wrong with global snow production, and you've been selected to take a look. The Elves have even given you a map; on it, they've used stars to mark the top fifty locations that are likely to be having problems.
 
 You've been doing this long enough to know that to restore snow operations, you need to check all fifty stars by December 25th.
 
 Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!
 
 You try to ask why they can't just use a weather machine ("not powerful enough") and where they're even sending you ("the sky") and why your map looks mostly blank ("you sure ask a lot of questions") and hang on did you just say the sky ("of course, where do you think snow comes from") when you realize that the Elves are already loading you into a trebuchet ("please hold still, we need to strap you in").
 
 As they're making the final adjustments, they discover that their calibration document (your puzzle input) has been amended by a very young Elf who was apparently just excited to show off her art skills. Consequently, the Elves are having trouble reading the values on the document.
 
 The newly-improved calibration document consists of lines of text; each line originally contained a specific calibration value that the Elves now need to recover. On each line, the calibration value can be found by combining the first digit and the last digit (in that order) to form a single two-digit number.
 */

struct Day01: AdventDay {
  var data: String
  
  static let letters = Many {
    Parse(Character.self) {
      OneOf {
        "a"
        "b"
        "c"
        "d"
        "e"
        "f"
        "g"
        "h"
        "i"
        "g"
        "h"
        "j"
        "k"
        "l"
        "m"
        "n"
        "o"
        "p"
        "q"
        "r"
        "s"
        "t"
        "u"
        "v"
        "w"
        "x"
        "y"
        "z"
      }
    }
  }
  
  static let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    return formatter
  }()
  
  static let digits = Parse(input: Substring.self) {
    Many(1...) {
      OneOf {
        Optionally {
          AlphaDigit.parser().map { $0.value }
          First().map { $0.isNumber ? Int(String($0)) : nil }
        }
      }
    }
    //  separator: {
    //      Not {
    //        AlphaDigit.parser().map { $0.value }
    //      }
    //    }
    .compactMap { $0 }
  }
  
  static let calibrationValue = Parse(input: Substring.self) {
    Skip { Optionally { Whitespace() } }
    Many {
      OneOf {
        Optionally {
          AlphaDigit.parser().map {
            String($0.value)
          }
//          Digits(1)
          First().map { $0.isNumber ? String($0) : nil }
        }
      }
    } separator: {
      ""
    }
    .compactMap {
      print($0)
      return $0.compactMap { $0 }
    }
    .compactMap {
      if let first = $0.first,
         let last = $0.last,
         let value = Int("\(first)\(last)")
      {
        print(value)
        return value
      } else {
        
        print("-- \($0)")
        return nil
      }
    }
    Skip { Optionally { CharacterSet.letters } }
  }
  
  static let calibrationValues = Many(into: 0, +=) {
    calibrationValue
  } separator: {
    "\n"
  }
  
  func part1() -> Any {
    return try! Day01.calibrationValues.parse(data[...])
  }
  
  func part2() -> Any {
    return try! Day01.calibrationValues.parse(data[...])
  }
}

enum AlphaDigit: String, CaseIterable {
  case eleven
  case twelve
  case thirteen
  case fourteen
  case fifteen
  case sixteen
  case seventeen
  case eighteen
  case nineeteen
  case twenty
  case twentyone
  case thirtyone
  case fourtyone
  case fiftyone
  case sixtyyone
  case seventyone
  case eightyone
  case ninetyone
  case twentytwo
  case thirtytwo
  case fourtytwo
  case fiftytwo
  case sixtytwo
  case seventytwo
  case eightytwo
  case ninetytwo
  case twentythree
  case thirtythree
  case fourtythree
  case fiftythree
  case sixtythree
  case seventythree
  case eightythree
  case ninetythree
  case twentyfour
  case thirtyfour
  case fourtyfour
  case fiftyfour
  case sixtyfour
  case seventyfour
  case eightyfour
  case ninetyfour
  case twentyfive
  case thirtyfive
  case fourtyfive
  case fiftyfive
  case sixtyfive
  case seventyfive
  case eightyfive
  case ninetyfive
  case twentysix
  case thirtysix
  case fourtysix
  case fiftysix
  case sixtysix
  case seventysix
  case eightysix
  case ninetysix
  case twentyseven
  case thirtyseven
  case fourtyseven
  case fiftyseven
  case sixtyseven
  case seventyseven
  case eightyseven
  case ninetyseven
  case twentyeight
  case thirtyeight
  case fourtyeight
  case fiftyeight
  case sixtyeight
  case seventyeight
  case eightyeight
  case ninetyeight
  case twentynine
  case thirtynine
  case fourtynine
  case fiftynine
  case sixtynine
  case seventynine
  case eightynine
  case ninetynine
  case ten
  case one
  case two
  case three
  case four
  case five
  case six
  case seven
  case eight
  case nine
  
  var value: Int {
    switch self {
    case .eleven: 11
    case .twelve: 12
    case .thirteen: 13
    case .fourteen: 14
    case .fifteen: 15
    case .sixteen: 16
    case .seventeen: 17
    case .eighteen: 18
    case .nineeteen: 19
    case .twenty: 20
    case .twentyone: 21
    case .thirtyone: 31
    case .fourtyone: 41
    case .fiftyone: 51
    case .sixtyyone: 61
    case .seventyone: 71
    case .eightyone: 81
    case .ninetyone: 91
    case .twentytwo: 22
    case .thirtytwo: 32
    case .fourtytwo: 42
    case .fiftytwo: 52
    case .sixtytwo: 62
    case .seventytwo: 72
    case .eightytwo: 82
    case .ninetytwo: 92
    case .twentythree: 23
    case .thirtythree: 33
    case .fourtythree: 43
    case .fiftythree: 53
    case .sixtythree: 63
    case .seventythree: 73
    case .eightythree: 83
    case .ninetythree: 93
    case .twentyfour: 24
    case .thirtyfour: 34
    case .fourtyfour: 44
    case .fiftyfour: 54
    case .sixtyfour: 64
    case .seventyfour: 74
    case .eightyfour: 84
    case .ninetyfour: 94
    case .twentyfive: 25
    case .thirtyfive: 35
    case .fourtyfive: 45
    case .fiftyfive: 55
    case .sixtyfive: 65
    case .seventyfive: 75
    case .eightyfive: 85
    case .ninetyfive: 95
    case .twentysix: 26
    case .thirtysix: 36
    case .fourtysix: 46
    case .fiftysix: 56
    case .sixtysix: 66
    case .seventysix: 76
    case .eightysix: 86
    case .ninetysix: 96
    case .twentyseven: 27
    case .thirtyseven: 37
    case .fourtyseven: 47
    case .fiftyseven: 57
    case .sixtyseven: 67
    case .seventyseven: 77
    case .eightyseven: 87
    case .ninetyseven: 97
    case .twentyeight: 28
    case .thirtyeight: 38
    case .fourtyeight: 48
    case .fiftyeight: 58
    case .sixtyeight: 68
    case .seventyeight: 78
    case .eightyeight: 88
    case .ninetyeight: 98
    case .twentynine: 29
    case .thirtynine: 39
    case .fourtynine: 49
    case .fiftynine: 59
    case .sixtynine: 69
    case .seventynine: 79
    case .eightynine: 89
    case .ninetynine: 99
    case .ten: 10
    case .one: 1
    case .two: 2
    case .three: 3
    case .four: 4
    case .five: 5
    case .six: 6
    case .seven: 7
    case .eight: 8
    case .nine: 9
    }
  }
}
