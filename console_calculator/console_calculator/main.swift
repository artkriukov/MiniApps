print("Добро пожаловать в  калькулятор!")

var history: [String] = []

while true {
    let action = getDataFromUser(description: "Что вы хотите сделать: с - расчет примера. q - завершение работы. h - просмотр истории" )
    
    switch action {
    case "c": calculate()
    case "q": exit(0)
    case "h": showHistory()
    default: print("Недопустимое значение")
    }
    print("")
    print("------------------------")
    print("")
}


func calculate() {
    let operation = getDataFromUser(description: "Выберите операцию: +, -, * или /.")
    guard operation == "+" || operation == "-" || operation == "*" || operation == "/" else{
        print("Вы ввели неверное значение")
        return
    }
    
    let firstNum = getDataFromUser(description: "Введите первое число")
    guard let firstNum = Int(firstNum) else {
        print("Вы ввели неверное число")
        return
    }
    
    let secondNum = getDataFromUser(description: "Введите второе число")
    guard let secondNum = Int(secondNum) else {
        print("Вы ввели неверное второе число")
        return
    }
    
    let example = String(firstNum) + " " + operation + " " + String(secondNum)
    print("Программа делает вычисление примера: " + example)
    
    let result = calculate(operation: operation, firstNumber: firstNum, secondNumber: secondNum)
    guard let result = result else { return }
    showResult(result)
    history.append(example + " = " + String(result))
}

func getDataFromUser(description: String) -> String{
    print(description)
    return readLine() ?? ""
}

func showResult(_ result: Int){
    print("Результат: " + String(result))
}

func calculate(operation: String, firstNumber: Int, secondNumber: Int ) -> Int? {
    switch operation{
    case "+" : 
        return firstNumber + secondNumber
    case "-" :
        return firstNumber - secondNumber
    case "*" :
        return firstNumber * secondNumber
    case "/" where secondNumber == 0:
        print("Деление на 0 запрещенно")
        return nil
    case "/" :
        return firstNumber / secondNumber
    default: print("Вы ввели неверную операцию")
        return nil
    }
}

func showHistory(){
    for example in history {
        print(example)
    }
}
