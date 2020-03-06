---
layout: post
title: "[Swift] ARC(Automatic Reference Counting)"
subtitle: "참조 메모리 관리에 관하여 배우기 "
data: 2020-03-06
---
## 들어가기전에 
오늘 공부하려는 내용은 Swift의 ARC입니다. ARC는 <span style ="color:red">__*Automatic Reference Counting*__</span> 의 약자로 자동 참조 카운팅을 의미합니다. 그래서 자동 참조 카운팅이 뭐냐? 바로 메모리를 자동으로 관리해 주는 시스템입니다..! 클래스의 인스턴스가 생성될때 자동으로 할당하고 더이상 필요하지 않다고 판단되면 자동으로 메모리를 해제해줍니다. 이렇게 swift에서는 자동으로 메모리를 관리해줍니다. 하지만 예외도 있기 때문에! 오늘 ARC에 대하여 공부를 해봅시다.😀
## How ARC Works
 - Swift는 ARC를 통해 클래스의 인스터스가 생성될때 메모리를 할당해줍니다. 할당된 메모리 안에는 인스턴스의 타입정보,인스턴스와 연관된 stored property의 값들입니다. 😊
 ---
 - 클래스의 인스턴스가 더이상 필요가 없을때 ARC는 할당된 해당 메모리를 해제합니다
 ---
 - ARC는 아직 사용중인 인스턴스가 해제되지 않도록 관리해줍니다. 이렇게 해서 충동위험을 줄여줍니다. 
 ---
 ```swift
 class Person {
     let name: String

     init(name: String) {
         self.name = name
         print("\(name) init")
     }

     deinit {
         print("\(name) deinit")
     }
     var reference1: Person?
     var reference2: Person?
     var reference3: Person?

     reference1 = Person(name: "devRacoon")//reference1에 devRacoon initializing
     //변수에 클래스의 인스턴스가 할당되면 strong 참조 

     reference2 = reference1
     reference3 = reference1
     //devRacoon의 인스턴스에 대한 strong참조가 총 3개가 됨 

     reference1 = nil
     reference2 = nil
     //참조를 해체했기 때문에 strong참조는 1개가 됨

     reference3 = nil //print deinit
     //앞서 할당된 인스턴스가 다 해체되면서 어떤 strong 참조도 없음 
 }
 ```
 ## Strong Reference
 클래스의 인스턴스를 string으로 참조하고 있는 수가 0이 되면 deinit을 한다는 점을 위에서 배웟다. 그런데 strong 참조수가 끝까지 0이 되지 않아 deinit이 되지 않는 경우도 있다. 이럴때는 메모리 누수로 이어질 수 있다. 따라서 이런점을 해결하기 위해서는 weak참조, unowned 참조이다. 
- weak: 참조하는 대상이 메모리가 할당되어있는 동안 nil이 될수도 있을때 
- unowned: 참조하는 대상이 초기화가 된 이후 nil이 될일이 없을때 
### weak
---
- 약한 참조를 의미한다. 
- 참조대상이 nil이 돨 수 있을때 사용
- 할당중이여도 ARC에 의해 해제될 가능성이 있다. 이럴때 nil반환
- nil이 할당될 수 있어야 해서 optional 타입이아야 하고 반드시 var로 선언되어야 한다.
---

```swift
class Person {
    let name: String
    var devRacoon: Apartment?

    init(name: String) {
        self.name = name
    }
    deinit {
        print("Person \(name) deinit")
    }
}
class Apartment {
    let unit: String
    weak var test: Person?
    
    init(unit: String) {
        self.unit = unit
    }
    deinit {
        print("Apartment \(unit) deinit")
    }
}
var ref1: Person?
var ref2: Apartment?

ref1 = Person(name: "jonh")
ref2 = Apartment(unit: "rc")

ref1!.devRacoon = ref2
ref2!.test = ref1

ref1 = nil // print("Person ref deinit")
ref2 = nil // print("Apartment ref2 deinit)
```
---
Person이 Apartment를 strong으로 잡고있기 때문에 Person이 죽기전까지 Apartment가 죽지 않습니다. 그렇기 때문에 ref2를 먼저 해제해도 persondl 해제되지 않으면 deinit이 출력되지 않습니다. 
### unowned
---
- 미소유참조 
- 참조 대상이 nil이 될 일이 없기 때문에 항상 값을 가지고 있을때만 사용합니다. 그렇기 때문에 non-optional타입을 사용합니다
예시로 [찜토끼](https://wlaxhrl.tistory.com/51)님의 블로그 소스를 인용하였습니다.
---
```swift

class Customer { 
    let name: String 
    var card: CreditCard? 
    init(name: String) { 
        self.name = name 
    } 
    deinit { 
            print("\(name) deinit") 
    } 
}
class CreditCard { 
    let number: UInt64 
    unowned let customer: Customer // strong 참조가 아니다 
    init(number: UInt64, customer: Customer) { 
        self.number = number 
        self.customer = customer 
        } 
        deinit { 
            print("Card #\(number) deinit") 
        } 
} 
var john: Customer? john = Customer(name: "John Appleseed") 
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)

john = nil // print "John Appleseed deinit" 
// (Customer Instance를 strong으로 참조하는 녀석이 하나도 없어서 해제) 
//print "Card #1234_5678_9012_3456 deinit" 
// (CreditCard Instance도 마찬가지)
출처: https://wlaxhrl.tistory.com/51 [찜토끼의 Swift 블로그]

```
---
## 마무리
이렇게 ARC에 대하여 알아보았습니다. 두 클래스가 서로 참조를 하게되면 strong reference가 발생할 수 있기 때문에 weak,unowned를 적절하게 사용해야 한다는 것을 알게되었습니다. 아직 제대로 써보지를 못해서 와닿지는 않네요...😅 오늘은 여기까지 적고 다음에 이 두 타입을 사용해야 할 case들을 분류해서 글을 적어보도록 하겠습니다. 글을 보시고 잘못된점이나 오타가 있으면 피드백 부탁드립니다!  감사합니다😄
