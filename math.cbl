





       IDENTIFICATION DIVISION.
       PROGRAM-ID. MATH.
       AUTHOR. Erik Fahlen.
       DATE-WRITTEN. 2021-08-26

       DATA DIVISION. 
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 Num1 PIC 9 VALUE 5.
       01 Num2 PIC 9 VALUE 4.
       01 Num3 PIC 9 VALUE 3.
       01 Ans PIC S99V99 VALUE 0.
       01 Rem PIC 9V99.

       *> This is a comment
       
       PROCEDURE DIVISION.
           ADD Num1 TO Num2 GIVING Ans
           DISPLAY Ans 
           SUBTRACT Num1 FROM Num2 GIVING Ans
           DISPLAY Ans 
           MULTIPLY Num1 BY Num2 GIVING Ans
           DISPLAY Ans 
           DIVIDE Num1 INTO Num2 GIVING Ans
           DISPLAY Ans 
           DIVIDE Num1 INTO Num2 GIVING Ans REMAINDER Rem
           DISPLAY "Remainder " Rem 

           ADD Num1, Num2 TO Num3 GIVING Ans 
           ADD Num1, Num2, Num3 GIVING Ans 
           DISPLAY Ans
           COMPUTE Ans = Num1 + Num2 
           COMPUTE Ans = Num1 - Num2 
           COMPUTE Ans = Num1 * Num2 
           COMPUTE Ans = Num1 / Num2 
           DISPLAY Ans 
           COMPUTE Ans = Num1 ** 2
           DISPLAY Ans 
           COMPUTE Ans = (3 + 5) * 5
           DISPLAY Ans 
           COMPUTE Ans = 3 + 5 * 5
           DISPLAY Ans 
           COMPUTE Ans ROUNDED = 3.0 + 2.005
           DISPLAY Ans

           STOP RUN.
           