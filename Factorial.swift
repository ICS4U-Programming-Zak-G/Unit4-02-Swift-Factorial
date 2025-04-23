//
//  Factorial.swift
//
//  Created by Zak Goneau
//  Created on 2025-04-23
//  Version 1.0
//  Copyright (c) 2025 Zak Goneau. All rights reserved.
//
//  This program uses recursion to calculate for the factorial of a list of numbers in a file.

// Import library
import Foundation

// Define main function
func main() {

    // Introduce program
    print("This program uses recursion to calculate the factorial.")
    print("The output will be displayed in the output.txt file")

    // Assign file names
    let inputFile = "input.txt"
    let outputFile = "output.txt"

    // Initialize factorial result
    var factorialResult = 0

    // Initialize output string
    var outputStr = ""

    // Try to read the input file
    guard let input = FileHandle(forReadingAtPath: inputFile) else {

        // Tell user input file couldn't be opened
        print("Couldn't open input file")

        // Exit function
        exit(1)
    }

    // Try to read the output file
    guard let output = FileHandle(forWritingAtPath: outputFile) else {

        // Tell user output file couldn't be opened
        print("Couldn't open output file")

        // Exit function
        exit(1)
    }

    // Read lines from input file
    let inputData = input.readDataToEndOfFile()

    // Convert data to string
    guard let inputString = String(data: inputData, encoding: .utf8) else {

        // Tell user couldn't convert data to string
        print("Couldn't convert data to string")

        // Exit function
        exit(1)
    }

    // Split string into lines
    let lines = inputString.components(separatedBy: "\n")

    // Initialize position in file
    var position = 0

    // Loop through lines
    while position < lines.count {
        // Get current line and trim whitespace
        let line = lines[position].trimmingCharacters(in: .whitespacesAndNewlines)

        // Check if line is an integer
        guard let intLine = Int(line) else {

            // Add to output string that the line is not an integer
            outputStr += "\(line) is not an integer\n"

            // Exit guard & continue to next line
            position += 1
            continue
        }

        // Check if line is negative or empty
        if (intLine < 0 || line.isEmpty) {
            // Add to output string that the line is not a positive integer
            outputStr += "\(line) is not a positive integer\n"

        // Otherwise the line is valid
        } else {
            // Call function to calculate factorial
            factorialResult = factorial(intLine: intLine)

            // Write the factorial to output string
            outputStr += "The factorial of \(intLine) is \(factorialResult) \n"
        }

        // Increment the position
        position += 1
    }

    // Write to output file
    output.write(outputStr.data(using: .utf8)!)

    // Close files
    output.closeFile()
    input.closeFile()
}

// Define function to calculate factorial
func factorial(intLine: Int) -> Int {

    // Base case, check if number is 0
    if (intLine == 0) {
        // Return 1
        return 1

    // Otherwise, calculate the factorial in recursion
    } else {
        // Call function recursively
        return intLine * factorial(intLine: intLine - 1)
    }
}

// Call main
main()