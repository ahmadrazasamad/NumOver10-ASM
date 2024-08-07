# NumOver10-ASM
## Description
This repository contains an assembly program designed to print numbers up to 9999, including 1, 2, and 3-digit numbers. The program is written in x86 Assembly language and uses DOS interrupts for printing.
## Features:
- Prints any number between 1 and 9999.
- Handles single, double, triple, and quadruple-digit numbers.
- Displays an error message if the number exceeds 9999.
## Usage
### Prerequisites
- An assembler such as MASM or TASM.
- A DOS environment or DOSBox for running the program.
## Program Explanation
The program performs the following steps:
1. Initializes the data and stack segments.
2. Checks if the number is within the valid range (1-9999).
3. If valid, it separates the digits of the number.
4. Prints each digit using DOS interrupt 21h.
5. Displays an error message if the number is greater than 9999.
## Code Breakdown
- Data Segment:
  - number dw 6104 - The number to be printed.
  - message db "The number is: $" - Message prefix.
  - invalidNumberMessage db "Invalid number entered in the number variable. It is greater than 9999!$" - Error message.
  - tempNumberHolder dw ? - Temporary storage for the number.
- Code Segment:
  - Main proc - Main procedure.
  - printDigit proc - Procedure to print a single digit.
## Output
![number is](https://github.com/user-attachments/assets/b4f5fbb3-d58e-425a-a191-8764a5494dcb)<br/>
![invalid](https://github.com/user-attachments/assets/cf875148-19fb-4737-99f8-a047f5ebd6e9)
## Example
To change the number, modify the value of `number` in the data segment:
```
number dw 1234
```
This will print "The number is: 1234".
