//
//  ViewController.swift
//  calculator
//
//  Created by Brandon Li on 11/1/18.
//  Copyright © 2018 Brandon Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    var text:String = ""
    var displaytext = ""
    
    @IBOutlet weak var sqrt: UIButton!
    var error = false
    var addedLength = 0
    var roundNumber = 2
    var entries = [String]()
    var entryCount = 0
    var mode = "rad"
//clear, back
    @IBOutlet weak var tenPowerSeries: UIButton!
    @IBOutlet weak var rand: UIButton!
    @IBOutlet weak var rad: UIButton!
    @IBOutlet weak var twoPowerSeries: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var pi: UIButton!
    
    @IBOutlet weak var e: UIButton!
    @IBOutlet weak var openParenthesis: UIButton!
    @IBOutlet weak var closParenthesis: UIButton!
    @IBOutlet weak var period: UIButton!
    @IBOutlet weak var back: UIButton!

    @IBOutlet weak var cubed: UIButton!

    @IBOutlet weak var cosine: UIButton!
    @IBOutlet weak var tangent: UIButton!
    @IBOutlet weak var sine: UIButton!
    @IBOutlet weak var cosecant: UIButton!
    @IBOutlet weak var cotangent: UIButton!
    // operations
    @IBOutlet weak var inversetan: UIButton!
    @IBOutlet weak var inversecosine: UIButton!
    @IBOutlet weak var mod: UIButton!
    @IBOutlet weak var inverse: UIButton!
    @IBOutlet weak var power: UIButton!
    @IBOutlet weak var inversesin: UIButton!
    @IBOutlet weak var secant: UIButton!
    @IBOutlet weak var square: UIButton!
    @IBOutlet weak var negative: UIButton!
    
    @IBOutlet weak var entry: UIButton!
    @IBOutlet weak var divide: UIButton!
    
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var subtract: UIButton!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var rnd: UIButton!
    //////////////////////////////////////
    //    helper funcitons
    //////////////////////////////////////
   
    @IBAction func Rad(_ sender: Any) {
        if mode == "rad"{
            mode = "deg"
        }
        else{
            mode = "rad"
        }
        rad.setTitle(mode, for: .normal)
    }
    func charAt( str : String,  n: Int) -> String {
        
        if n > str.count - 1{
            return "out of bounds"
        }
        let index = str.index(str.startIndex, offsetBy: n)
        return String(str[index])
    }

  
    func getUnicode(_ str : String) -> Int {//has to be a string a length 1
        if str.count != 1{
            return -1
        }
        let scalars = str.unicodeScalars
        return Int(scalars[scalars.startIndex].value)
    }
    
    //////////////////////////////////////
    //    add to text
    //////////////////////////////////////
    //+÷×‒

    @IBAction func entry(_ sender: Any) {
        if entries.isEmpty  == false{
            if entries.count - 1 - entryCount >= 0 {
                text = entries[entries.count - 1 - entryCount]
            }
            else {
                text = entries[0]
            }
            entryCount += 1
            display.text = text
            if text.range(of:"error") != nil{
                error = true
            }
            else{
                error = false
            }
            addedLength = 1
        }
    }
    @IBAction func random(_ sender: Any) {
        let fraction = Float.random(in: 0 ..< 1)
        text = String(fraction)
        display.text = text
        error = false
        addedLength = 1
        
    }
    @IBAction func sqrt(_ sender: Any) {
        if error{
            text = ""
            display.text = text
        }
        error = false
        text += "√("
        display.text = text
        addedLength = 2
    }
    @IBAction func rnd(_ sender: Any) {
        text = "rnd:"
        display.text = text
        addedLength = 4
        
    }
    @IBAction func TenPowerSeries(_ sender: Any) {
        if error{
            text = ""
            display.text = text
            error = false
        }
        error = false
        
        text += "10^("
        addedLength = 4
        display.text = text
        
    }
    @IBAction func TwoPowerSeries(_ sender: Any) {
        if error{
            text = ""
            display.text = text
            error = false
        }
        error = false
        
        text += "2^("
        addedLength = 3
        display.text = text
    }
    @IBAction func inverse(_ sender: Any) {
        if error{
            return
        }
        error = false
        if text.count == 0{ //if its length 0, there isn't a number before it
            return
        }
        let lastNumber = charAt(str: text, n: text.count-1) //+÷×‒
        if lastNumber != "÷" && lastNumber != "+" && lastNumber != "×" && lastNumber != "‒" && lastNumber != "%" && lastNumber != "^"{
            text += "^-1"
            display.text = text
            addedLength = 3
        }
    }
    @IBAction func power(_ sender: Any) {
        if error{
            return
        }
        error = false

        if text.count == 0{ //if its length 0, there isn't a number before it
            return
        }
        let lastNumber = charAt(str: text, n: text.count-1) //+÷×‒
        if lastNumber != "÷" && lastNumber != "+" && lastNumber != "×" && lastNumber != "‒" && lastNumber != "%" && lastNumber != "^"{
            text += "^"
            addedLength = 1
            display.text = text
        }
    }
    @IBAction func mod(_ sender: Any) {
        
        addOperation("%")
    }
    @IBAction func E(_ sender: Any) {
        if error{
            text = ""
            display.text = text
            error = false
        }
        error = false

        if text.count == 0{ //if its length 0, there isn't a number before it
            text += "ℯ"
            addedLength = 1
            display.text = text
            return
        }
        let lastNumber = charAt(str: text, n: text.count-1) //+÷×‒
        if lastNumber != "."{
            text += "ℯ"
            addedLength = 1
            display.text = text
        }
    }
    @IBAction func pi(_ sender: Any) {
        if error{
            text = ""
            display.text = text
            error = false
        }
        error = false

        if text.count == 0{ //if its length 0, there isn't a number before it
            text += "π"
            addedLength = 1
            display.text = text
            return
        }
        let lastNumber = charAt(str: text, n: text.count-1) //+÷×‒
        if lastNumber != "."{
            text += "π"
            addedLength = 1
            display.text = text
        }

    }
    @IBAction func cube(_ sender: Any) {
        if error{
            return
        }
        error = false

        if text.count == 0{ //if its length 0, there isn't a number before it
            return
        }
        let lastNumber = charAt(str: text, n: text.count-1) //+÷×‒
        if lastNumber != "÷" && lastNumber != "+" && lastNumber != "×" && lastNumber != "‒" && lastNumber != "%" && lastNumber != "^"{
            text += "^3"
            addedLength = 2
            display.text = text
        }
    }
    @IBAction func square(_ sender: Any) {
        if error{
            return
        }
        error = false

        if text.count == 0{ //if its length 0, there isn't a number before it
            return
        }
        let lastNumber = charAt(str: text, n: text.count-1) //+÷×‒
        if lastNumber != "÷" && lastNumber != "+" && lastNumber != "×" && lastNumber != "‒" && lastNumber != "%" && lastNumber != "^"{
            text += "^2"
            addedLength = 2
            display.text = text
        }
    }
    @IBAction func openParenthesis(_ sender: Any) {
        if error{
            text = ""
            display.text = text
            error = false
        }
        error = false

        text += "("
        addedLength = 1
        display.text = text
    }
    @IBAction func closeParenthesis(_ sender: Any) {
        if error{
            return
        }
        error = false

        text += ")"
        addedLength = 1
        display.text = text
    }
    func addTrig(_ trig:String){
        if error{
            text = ""
            display.text = text
            error = false
        }

        if text.count == 0{ //if its length 0, there isn't a number before it
            text += trig
            display.text = text
            addedLength = trig.count
            return
        }
        let lastNumber = charAt(str: text, n: text.count-1) //+÷×‒
        if lastNumber != "."{
            text += trig
            addedLength = trig.count
            display.text = text
        }
    }
    @IBAction func sine(_ sender: Any) {
        addTrig("sin(")
    }
    @IBAction func cosine(_ sender: Any) {
        addTrig("cos(")
    }
    @IBAction func tangent(_ sender: Any) {
        addTrig("tan(")

    }
    
    @IBAction func cotangent(_ sender: Any) {
        addTrig("cot(")

    }
    @IBAction func secant(_ sender: Any) {
        addTrig("sec(")

    }
    @IBAction func cosecant(_ sender: Any) {
        addTrig("csc(")

    }
    @IBAction func inverseSin(_ sender: Any) {
        addTrig("sin-1(")

    }
    @IBAction func inverseTan(_ sender: Any) {
        addTrig("tan-1(")

    }
    @IBAction func inverseCos(_ sender: Any) {
        addTrig("cos-1(")

    }
    @IBAction func clear(_ sender: Any) {
        text = ""
        display.text = text
        addedLength = 0
        error = false
 
    }
    @IBAction func negative(_ sender: Any) {
        if error{
            text = "-"
            display.text = text
            addedLength = 1
            error = false
            return
        }
        

        if text.count == 0{
            
            text += "-"
            addedLength = 1
            display.text = text
            return
        }
        
        let lastNumber = charAt(str: text, n: text.count-1)
        let unicode = getUnicode(lastNumber)
        if  lastNumber != "." && lastNumber != "-" {
            if (unicode < 48 || unicode > 57) && lastNumber != "π" && lastNumber != "ℯ"{ // cant add a negative after a number
                text += "-"
                addedLength = 1
                display.text = text
            }
        }
    }
    @IBAction func period(_ sender: Any) {
        if error{
            text = "."
            addedLength = 1
            display.text = text
            error = false
            return
        }
        error = false

        if text.count == 0{ //if its length 0, there isn't a number before it
            text += "."
            addedLength = 1
            display.text = text
            return
        }
        let lastNumber = charAt(str: text, n: text.count-1)
        let unicode = getUnicode(lastNumber)
        if unicode >= 48 && unicode <= 57{ //make sure its a number from ascii chart
            text += "."
            addedLength = 1
            display.text = text
        }
    }
    
    @IBAction func back(_ sender: Any) {
        if error{
            text = ""
            addedLength = 0
            display.text = text
            error = false
            return
        }
        if text.count == 0{
            return
        }
//        let range = text.startIndex..<text.index(before: text.endIndex)
        if text.count >= 2 && substring(text.count - 2, text.count, text) == "√("{
            text = substring(0, text.count - 2, text)
            addedLength = 1
            display.text = text
            return
        }
        if text.count >= 4 && (substring(text.count - 4, text.count, text) == "sin(" || substring(text.count - 4, text.count, text) == "cos(" || substring(text.count - 4, text.count, text) == "tan(" || substring(text.count - 4, text.count, text) == "csc(" || substring(text.count - 4, text.count, text) == "sec(" || substring(text.count - 4, text.count, text) == "cot("){
            text = substring(0, text.count - 4, text)
            addedLength = 1
            display.text = text
            return
        }
        if text.count >= 6 && (substring(text.count - 6, text.count, text) == "sin-1(" || substring(text.count - 6, text.count, text) == "cos-1(" || substring(text.count - 6, text.count, text) == "tan-1(" ){
            text = substring(0, text.count - 6, text)
            addedLength = 1
            display.text = text
            return
        }
        text = substring(0, text.count - addedLength, text) 
            
        addedLength = 1
        display.text = text

    }
    @IBAction func numbers(_ sender: UIButton) {
        if error{
            text = ""
            display.text = text
        }
        error = false
        text += String(sender.tag - 1)
        addedLength = 1
        display.text = text
        
    }
    

    func addOperation(_ operation : String){
        if error{
           return

        }
        // only add the operations to the text if there is a number before it
        if text.count == 0{ //if its length 0, there isn't a number before it
            return
        }
        let lastNumber = charAt(str: text, n: text.count-1)
        let unicode = getUnicode(lastNumber)
        if (unicode >= 48 && unicode <= 57) || lastNumber == "π" || lastNumber == "ℯ" || lastNumber == ")"{ //make sure its a number from ascii chart
            text += operation
            addedLength = operation.count
            display.text = text
        if lastNumber == ")" {
            text += operation
            addedLength = operation.count

            display.text = text
            }
        }
    }
    @IBAction func add(_ sender: Any) {
       addOperation("+")
    }
    @IBAction func subtract(_ sender: Any) {
        addOperation("‒")
    }
    @IBAction func multiply(_ sender: Any) {
        addOperation("×")
    }
    
    @IBAction func divide(_ sender: Any) {
        addOperation("÷")
    }
    //////////////////////////////////////
    //    operations functions
    //////////////////////////////////////
    //this is a comment!, comments are essential!
    func almostEquals(_ n:Double, _ i:Double) -> Bool{
        let h = n - i
        return abs(h) < 0.00000001
    }
    func charInString(_ str1: String, _ str2: String) -> (Bool, Int){ // return if a string of length 1 is in str2
        var inside = false
        var count = 0
        for i in 0..<str2.count{
            if charAt(str: str2, n: i) == str1{
                inside = true
                count += 1
            }
        }
        return (inside, count)
        
    }
    func indexAt(_ chr:String,_ str: String) -> Int {//return the index at char
        for i in 0..<str.count{
            if charAt(str: str, n: i) == chr{
                return i
            }
        }
        return -1
    }

    func substring(_ lower:Int, _ upper:Int, _ str:String) -> String {//return a substring of the string
        var result = ""
        if lower > str.count - 1 || lower < 0 {
            return "out of bounds:lower"
        }
        if upper > str.count || upper < 0 {
            return "out of bounds:upper"
        }
        for i in lower..<upper {
            result += charAt(str: str, n: i)
        }
        return result
    }
    func stringBefore(_ text: String, _ oper: String) -> String{ // return the String ahead of an operator
        // for example, stringBehind("123-4+5*23, "*") -> 5, since 5 is the number before it
        let operatorIndex = indexAt(oper, text) //get the index of the operator
        if operatorIndex == -1 {
            return "not inside"
        }
        var firstBound = operatorIndex - 1
        var current = " "
        var currentCode = getUnicode(current)
        // unicode for operators
        let plus = getUnicode("+")
        let minus = getUnicode("‒")
        //    "‒" // new minus, different character
        //    "-" // negative, dash on keyboard
        let multiply = getUnicode("×")
        let divide = getUnicode("÷")
        let mod = getUnicode("%")
        let expo = getUnicode("^")
        
        while true{
            if firstBound < 0 {
                break
            }
            current = charAt(str: text, n: firstBound)
            currentCode = getUnicode(current)
            if currentCode == plus || currentCode == minus || currentCode == multiply || currentCode == divide || currentCode == mod || currentCode == expo {
                break
            }
            firstBound -= 1
            
        }
        return substring(firstBound + 1, operatorIndex, text)
        
    }
    
    
    func stringAfter(_ text: String, _ oper: String) -> String{ // return the String after of an operator
        // for example, stringAfter("123-4+5*23, "*") -> 23, since 23 is the number after it
        let operatorIndex = indexAt(oper, text) //get the index of the operator
        if operatorIndex == -1 {
            return "not inside"
        }
        var finalBound = operatorIndex + 1
        var current = " "
        var currentCode = getUnicode(current)
        // unicode for operators
        let plus = getUnicode("+")
        let minus = getUnicode("‒")
        //    "‒" // new minus, different character
        //    "-" // negative, dash on keyboard
        let multiply = getUnicode("×")
        let divide = getUnicode("÷")
        let mod = getUnicode("%")
        let expo = getUnicode("^")
        
        while true{
            if finalBound >= text.count {
                break
            }
            current = charAt(str: text, n: finalBound)
            currentCode = getUnicode(current)
            if currentCode == plus || currentCode == minus || currentCode == multiply || currentCode == divide || currentCode == mod || currentCode == expo {
                break
            }
            finalBound += 1
            
        }
        return substring(operatorIndex+1, finalBound, text)
        
    }
    func operatorCount(_ text:String) -> Int
    {
        let multiplyCount = charInString("×", text).1
        let minusCount = charInString("‒", text).1
        let addCount = charInString("+", text).1
        let divideCount = charInString("÷", text).1
        let modCount = charInString("%", text).1
        let powerCount = charInString("^", text).1
        return multiplyCount + minusCount + addCount + divideCount + modCount + powerCount
    }
   
    func changeOperation(_ text:String, _ oper:String) -> String{ // change the text by doing the operation with the numbers before and after it
        //for example, changeOperation("1+3-5", "-") -> "1+-2" remember "‒" // new minus, different character
//        "-" // negative, dash on keyboard
        let charIn = charInString(oper, text)
        if charIn.0 == false{
            return "not inside"
        }
        
        let before = stringBefore(text, oper)
        let after = stringAfter(text, oper)
        let operIndex = indexAt(oper, text)
        let beforeCount = before.count
        let aftercount = after.count
        var result = ""
        
        if Double(before) == nil || Double(after) == nil {
            return "error:Syntax"
        }
        var new = Double(0)
        
        if oper == "+" {
            new = Double(before)! + Double(after)!
            if operatorCount(text) == 1{
                return String(new)
            }
            result += substring(0, operIndex-beforeCount, text)
            result += String(new)
            if operIndex + aftercount + 1 <= text.count - 1{
                result += substring(operIndex + aftercount + 1, text.count , text)
            }
            return result
            
        }
        if oper == "^" {
            new = pow(Double(before)!, Double(after)!)
            
            result += substring(0, operIndex-beforeCount, text)
            result += String(new)
            if operIndex + aftercount + 1 <= text.count - 1{
                result += substring(operIndex + aftercount + 1, text.count , text)
            }
            return result
            
        }
        if oper == "‒" {
            new = Double(before)! - Double(after)!
            if operatorCount(text) == 1{
                return String(new)
            }
            result += substring(0, operIndex-beforeCount, text)
            result += String(new)
            if operIndex + aftercount + 1 <= text.count - 1{
                result += substring(operIndex + aftercount + 1, text.count , text)
                
            }
            return result
        }
        if oper == "×" {
            new = Double(before)!*Double(after)!
            if operatorCount(text) == 1{
                return String(new)
            }
            result += substring(0, operIndex-beforeCount, text)
            result += String(new)
            if operIndex + aftercount + 1 <= text.count - 1{
                result += substring(operIndex + aftercount + 1, text.count , text)
            }
            return result
        }
        if oper == "÷" {
            if Double(after) == 0{
                return "error:divide by 0"
            }
            if Double(after) == 0 && Double(before) == 0{
                return "DNE"
            }
            new = (Double(before)!/Double(after)!)
            if operatorCount(text) == 1{
                return String(new)
            }
            result += substring(0, operIndex-beforeCount, text)
            result += String(new)
            if operIndex + aftercount + 1 <= text.count - 1{
                result += substring(operIndex + aftercount + 1, text.count , text)
            }
            return result
            
        }
        if oper == "%" {
            if Double(after) == 0{
                return "error:divide by 0"
            }
            new = Double(Int(Double(before)!) % Int(Double(after)!))
            if operatorCount(text) == 1{
                return String(new)
            }
            result += substring(0, operIndex-beforeCount, text)
            result += String(new)
            if operIndex + aftercount + 1 <= text.count - 1{
                result += substring(operIndex + aftercount + 1, text.count , text)
            }
            return result
            
        }
        return "error!"
        
    }
    func getOperations(_ text:String) -> String{ // getOperations returns a string in order of the operations needed
        //for example getOperations("1‒3×4+2") -> "×‒+"
        var md  = "" //multiply and divide
        var ad = ""//add and subtract
        var expo = ""
        var current = ""
        for i in 0..<text.count{
            current = charAt(str: text, n: i)
            if current == "^"{
                expo += "^"
            }
            if current == "×" || current == "÷" || current == "%"{
                md += current
            }
            if current == "+" || current == "‒"{
                ad += current
            }
        }
        return expo + md + ad
        
    }
    
    func equals(_ text:String, _ rnd:Bool) -> String{ //solves the string operation
        let orderOfOperations = getOperations(text)
        
        var result = text
        var alteredResult = 0.0
        if orderOfOperations.count > 0 {
            for i in 0..<orderOfOperations.count{
                result = changeOperation(result, charAt(str: orderOfOperations, n: i))
                if result == "error:divide by 0"{
                    return "error:divide by 0"
                }
                if result == "DNE"{
                    return "DNE"
                }
                if result == "error:Syntax"{
                    return "error:Syntax"
                }
                
            }
            
        }
        if result == "error:divide by 0"{
            return "error:divide by 0"
        }
        if result == "DNE"{
            return "DNE"
        }
        if result == "error:Syntax"{
            return "error:Syntax"
        }
        if !rnd{
            if Double(result)! >= Double(Int.max) {
                return "error:overflow"
            }
            return String(result)
        }
        if Double(result) == nil{
            return "error:Syntax"
        }
        if Double(result)! >= Double(Int.max) {
            return "error:overflow"
        }
        let rnd: Double = pow(10.0, Double(roundNumber))
        alteredResult = Double(round(rnd*Double(result)!)/rnd)

        var isInteger = floor(alteredResult)
        if (almostEquals(isInteger, alteredResult)){
            return String(Int(alteredResult))
        }
        isInteger = ceil(alteredResult)
        if (almostEquals(isInteger, alteredResult)){
            return String(Int(alteredResult))
        }
        else{
            return String(alteredResult)
        }
        
    }
    func hasBalancedParentheses(str:String) -> Bool{ // return if str has balanced parenthesis
        var amount = 0
        var current = ""
        var i = 0
        if str.count == 0{
            return true;
        }
        while i < str.count{
            current = charAt(str: str, n: i)
            if current == "(" {
                amount += 1
            }
            else if current == ")"{
                amount -= 1
            }
            
            if amount < 0 {
                return false
            }
            i += 1
            
        }
        return amount == 0
    }
    //write a function that returns that get the first "(", and returns the index of the corresponding ")", assuming there is one
    func solveParenthesis(_ text:String) ->String{ // solves the parenthesis, for example solveParenthesis("1+(3+(4+5))",2) -> "1+12"
        // do this by looping through each index over and over again. get a substring of the first parenthesis, and if there are
        // more parenthesis inside, pass and repeat, if there aren't more, then solve it, replaceing the part in the text. repeat untill there aren't any parenthesis left inside
        var i = 0
        var current = ""
        var new = ""
        var result = text
        while true{
            if charInString("(", result).1 == 0 {
                break
            }
            if charAt(str: result, n: i%result.count) == "(" {
                current = substring(i%result.count + 1, getCorrespondingCloseParenthesisIndex(result, i%text.count), result)
                if indexAt("(", current) == -1 { // if there arent any more parenthesis' inside
                    new = equals(current, false)

                    if new == "error:divide by 0"{
                        return "error:divide by 0"
                    }
                    if new == "DNE"{
                        return "DNE"
                    }
                    if new == "error:Syntax"{
                        return "error:Syntax"
                    }
                    if new == "error:overflow"{
                        return new
                    }
                    //modify result
                    // now add a × multiply if there is something before or after 4(1+2) -> 4×3
                    if i%result.count-1 >= 0 && getUnicode(charAt(str: result, n: i%result.count-1)) >= 48 && getUnicode(charAt(str: result, n: i%result.count-1)) <= 57 {
                        new = "×" + new
                    }
                    // make it times negative 1 if there is a - infront of it
                    if i%result.count-1 >= 0 && charAt(str: result, n: i%result.count-1) == "-"{
                        new = "1×" + new
                    }
                    // make it times negative 1 if there is a - behind of it
                    if getCorrespondingCloseParenthesisIndex(result, i%text.count) + 2 <= result.count - 1 && charAt(str: result, n: getCorrespondingCloseParenthesisIndex(result, i%text.count) + 1) == "-" && getUnicode(charAt(str: result, n: getCorrespondingCloseParenthesisIndex(result, i%text.count) + 2)) >= 48 && getUnicode(charAt(str: result, n: getCorrespondingCloseParenthesisIndex(result, i%text.count) + 2)) <= 57 {
                        new = new + "×"
                    }
                    // now add a × multiply if there is something before or after (1+2)4 -> 3×4
                    
                    if getCorrespondingCloseParenthesisIndex(result, i%text.count) + 1 <= result.count - 1 &&  getUnicode(charAt(str: result, n: getCorrespondingCloseParenthesisIndex(result, i%text.count) + 1)) >= 48 && getUnicode(charAt(str: result, n: getCorrespondingCloseParenthesisIndex(result, i%text.count) + 1)) <= 57{
                        
                        new = new + "×"
                    }
                    if getCorrespondingCloseParenthesisIndex(result, i%text.count) == result.count - 1 {//it is the last part
                        result = substring(0, i%result.count, result) + new
                    }
                    else {
                        result = substring(0, i%result.count, result) + new + substring(getCorrespondingCloseParenthesisIndex(result, i%text.count) + 1, result.count, result)
                    }
                    i = -1
                    
                }
            }
            
            i += 1
            
            
        }
        return result
    }
    func getCorrespondingCloseParenthesisIndex(_ text:String, _ start:Int) ->Int{
        let openIndex = start
        var count = 0
        for i in openIndex+1..<text.count {
            if charAt(str: text, n: i) == "("{
                count -= 1
            }
            if charAt(str: text, n: i) == ")"{
                count += 1
            }
            if count == 1 {
                return i
            }
            
        }
        return -1
    }
    


    func gettrig(_ text:String, _ index:Int) -> String{
        if index == 0{
            return "nothing"
        }
        if charAt(str: text, n: index - 1) == "√"{
            return "√"
        }
        if index < 3{
            return "nothing"
        }
        if substring(index - 2, index, text) == "-1" && (charAt(str: text,n: index-3) == "n" || charAt(str: text, n: index-3) == "s"){
            return substring(index - 5, index, text)
        }
        let before = substring(index - 3, index, text)
        return before
    }
    func replaceTrig(_ text:String) ->String{
        var i = 0
        var trig = ""
        var current = ""
        var new = ""
        var result = text
        var close = 0
        while true{
            if result.range(of:"cos") == nil && result.range(of:"sin") == nil && result.range(of:"tan") == nil && result.range(of:"csc") == nil && result.range(of:"sec") == nil && result.range(of:"cot") == nil && result.range(of:"sin-1") == nil && result.range(of:"cos-1") == nil && result.range(of:"tan-1") == nil && result.range(of:"√") == nil{
                return result
            }
            if indexAt("(", result) == -1{
                return result
            }
            
            if charAt(str: result, n: i%result.count) == "("{
                current = substring(i%result.count + 1, getCorrespondingCloseParenthesisIndex(result, i%result.count), result)
                if current == "" {
                    return "error:syntax"
                }
                
                
                close = getCorrespondingCloseParenthesisIndex(result, i%result.count)
                trig = gettrig(result, i%result.count)
                if current.range(of:"cos") == nil && current.range(of:"sin") == nil && current.range(of:"tan") == nil && current.range(of:"csc") == nil && current.range(of:"sec") == nil && current.range(of:"cot") == nil && current.range(of:"sin-1") == nil && current.range(of:"cos-1") == nil && current.range(of:"tan-1") == nil && current.range(of:"√") == nil && (trig == "sin" || trig == "cos" || trig == "tan" || trig == "sec" || trig == "csc" || trig == "cot" || trig == "sin-1" || trig == "tan-1" || trig == "cos-1" || trig == "√" ){ // doesnt have any trig functions
                    trig = gettrig(result, i%result.count)
                    if evalTrig(current, trig).range(of: "error") != nil{
                        return evalTrig(current, trig)
                    }
                    new = "(" + evalTrig(current, trig) + ")"
                    if new.range(of:"error:Domain") != nil{
                        return "error:Domain"
                    }
                    if trig.count == 1 {
                        if close == result.count - 1{
                            result = substring(0, i%result.count-1, result) + new
                        }
                        else{
                            result = substring(0, i%result.count-1, result) + new + substring(close + 1, result.count, result)
                        }
                    }
                    if trig.count == 3 {
                        if close == result.count - 1{
                            result = substring(0, i%result.count-3, result) + new
                        }
                        else{
                            result = substring(0, i%result.count-3, result) + new + substring(close + 1, result.count, result)
                        }
                    }
                    if trig.count == 5 {
                        if close == result.count - 1{
                            result = substring(0, i%result.count-5, result) + new
                        }
                        else{
                            result = substring(0, i%result.count-5, result) + new + substring(close + 1, result.count, result)
                        }
                    }
                    i = -1
                }
            }
            i += 1
        }
        return result
        
    }
    
    func changeSymbols(_ text:String, _ char:String) -> String {
        var current = ""
        var txt = text
        var i = 0
        while true{
            i = indexAt(char, txt)
            if i == -1{
                return txt
            }
            if i != -1{
                if char == "π"{
                    current = "(" + String(Double.pi) + ")"
                }
                if char == "ℯ"{
                    current = "(" + "2.718281828459" + ")"
                }
                if i == 0{
                    txt = current + substring(1, text.count, text)
                }
                else if i == txt.count - 1{
                    txt = substring(0, txt.count - 1, txt) + current
                }
                else {
                    txt = substring(0, i, txt) + current + substring(i+1, txt.count, txt)
                }
            }
            
        }
    }
    
    func evalTrig(_ txt:String, _ trig:String) -> String{
        var n = 0.0
        if txt.range(of:"c") != nil || txt.range(of:"s") != nil || txt.range(of:"t") != nil || txt.range(of:"√") != nil{
            return "none"
        }
        var text = solveParenthesis(txt)
        
        if text == "error:overflow"{
            return "error:overflow"
        }
        
        if text.range(of: "error:divide by 0") != nil {
            return "error:divide by 0"
        }
        if text.range(of: "DNE") != nil {
            return "DNE"
        }
        
        if text.range(of: "error:overflow") != nil {
            return "error:overflow"
        }
        
        text = equals(text, false)
        if text == "error:overflow"{
            return "error:overflow"
        }
        
        if text.range(of: "error:divide by 0") != nil {
            return "error:divide by 0"
        }
        if text.range(of: "DNE") != nil {
            return "DNE"
        }
        
        if text.range(of: "error:overflow") != nil {
            return "error:overflow"
        }
        if Double(text) == nil{
            return "error:syntax"
        }
        // if double of text == nil, return syntax error, handle in function that cals eval trig
        if trig == "tan"{
            if mode == "deg"{
                n = tan((Double(text)!*Double.pi)/180.0)
            }
            else{
               n = tan(Double(text)!)
            }
            
            if n > 1.633123935319537e+10 || n < -1.633123935319537e+10{
                return "error:Domain"
            }
        }
        if trig == "√"{
            if Double(text)! < 0.0 {
                return "error:sqrt"
            }
            n = pow(Double(text)!, 0.5)
            
        }
        if trig == "cos"{
            if mode == "deg"{
                n = cos((Double(text)!*Double.pi)/180.0)
            }
            else{
                n = cos(Double(text)!)
            }
        }
        if trig == "sin"{
            if mode == "deg"{
                n = sin((Double(text)!*Double.pi)/180.0)
            }
            else{
                n = sin(Double(text)!)
            }
        }
        if trig == "tan-1"{
            n = atan(Double(text)!)

            if mode == "deg"{
                n *= (180.0/Double.pi)

            }
            
            
            
        }
        if trig == "cos-1"{
            if Double(text)! < -1.0 || Double(text)! > 1.0{
                return "error:Domain"
            }
            n = acos(Double(text)!)

            if mode == "deg"{
                n *= (180.0/Double.pi)

            }
           
        }
        if trig == "sin-1"{
            if Double(text)! < -1.0 || Double(text)! > 1.0{
                return "error:Domain"
            }
            n = asin(Double(text)!)

            if mode == "deg"{
                n *= (180.0/Double.pi)
            }
            
            
        }
        if trig == "sec"{
            if mode == "deg"{
                n = 1.0/cos((Double(text)!*Double.pi)/180.0)
            }
            else{
                n = 1.0/cos(Double(text)!)

            }
            if n > 1.633123935319537e+10 || n < -1.633123935319537e+10{
                return "error:Domain"
            }
        }
        if trig == "csc"{
            if mode == "deg"{
                n = 1.0/sin((Double(text)!*Double.pi)/180.0)
            }
            else{
                n = 1.0/sin(Double(text)!)
                
            }
            if n > 1.633123935319537e+10 || n < -1.633123935319537e+10{
                return "error:Domain"
            }
        }
        if trig == "cot"{
            if mode == "deg"{
                n = 1.0/tan((Double(text)!*Double.pi)/180.0)
            }
            else{
                n = 1.0/tan(Double(text)!)
                
            }
            if n > 1.633123935319537e+10 || n < -1.633123935319537e+10{
                return "error:Domain"
            }
        }
        
        var isInteger = floor(n)
        if (almostEquals(isInteger, n)){
            return String(isInteger)
        }
        isInteger = ceil(n)
        if (almostEquals(isInteger, n)){
            return String(isInteger)
        }
        return String(n)
    }
    func evaluate(_ txt:String) -> String {
        var text = changeSymbols(txt, "ℯ")
        text = changeSymbols(text, "π")
        var openCount = charInString("(", text).1
        var closedCount = charInString(")", text).1
        if openCount != closedCount  || hasBalancedParentheses(str: text) == false{
            return "error:parenthesis"
        }
        text = replaceTrig(text)
        if text.range(of:"error:Domain") != nil {
            return "error:Domain"
        }
        if text.range(of:"error") != nil {
            return text
        }
        openCount = charInString("(", text).1
        closedCount = charInString(")", text).1
        var altered = ""
        if openCount == 0 && closedCount == 0 {
            return equals(text, true)
        }
        if openCount != closedCount  || hasBalancedParentheses(str: text) == false{
            return "error:parenthesis"
        }
        altered = solveParenthesis(text)
        if altered == "error:overflow"{
            return altered
        }
        return equals(altered, true)
        
    }
    @IBAction func equalOperation(_ sender: Any) {
        
        if text.count == 0 {
            return
        }
        if text.range(of:"error") == nil{
            entries.append(text)
            entryCount = 0
        }
        
        
        if text.count > 4 && substring(0, 4, text) == "rnd:"{
            if Int(substring(4, text.count, text)) == nil{
                text = "error:Syntax"
                display.text = text
                error = true
                return
            }
            roundNumber = Int(substring(4, text.count, text))!
            text = ""
            display.text = text
            error = false
            return
        }
        if Double(text) != nil{
            return
        }
        if text == "π" {
            text = "3.141592653589793"
            display.text = text
            return
        }
        if text == "ℯ" {
            text = "2.718281828459"
            display.text = text
            return  
        }
        text = fillParenthesis(text)
        if text.range(of:"()") != nil {
            text = "error:syntax"
            display.text = text
            error = true
            return
        }
        if text == "error:parenthesis"{
            display.text = text
            error = true
            return 
        }
        text = evaluate(text)
        display.text = text
        if text.range(of:"error") != nil{
            error = true
        }


    }
    func fillParenthesis(_ txt:String) -> String { // write the function that adds the filling parenthesis
        var text = txt
        var open = charInString("(", text).1
        var close = charInString(")", text).1
        while hasBalancedParentheses(str: text) == false{
            open = charInString("(", text).1
            close = charInString(")", text).1
            if open == close {
                if hasBalancedParentheses(str: text) == false {
                    return "error:parenthesis"
                }
            }
            if close > open{
                return "error:parenthesis"
            }
            if open > close {
                text += ")"
            }
        }
        return text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

