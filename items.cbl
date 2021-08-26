





       IDENTIFICATION DIVISION.
       PROGRAM-ID. ITEMS.
       AUTHOR. Erik Fahlen.
       DATE-WRITTEN. 2021-08-26

       DATA DIVISION. 
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 SampleData PIC X(10) VALUE "Stuff".
       01 JustLetters PIC AAA VALUE "ABC".
       01 JustNums PIC 9(4) VALUE 1234.
       01 SignedInt PIC S9(4) VALUE -1234.
       01 PayCheck PIC 9(4)V99 VALUE ZERO.

       *> Group Item
       01 Customer.
           02 Ident PIC 9(3).
           02 CustName PIC X(20).
           02 DateOfBirth.
              03 MOB PIC 99.
              03 DOB PIC 99.
              03 YOB PIC 9(4).

       *> This is a comment
       
       PROCEDURE DIVISION.
           MOVE 'More Stuff' TO SampleData
           MOVE '123' TO SampleData
           MOVE 123 TO SampleData
           DISPLAY SampleData 
           DISPLAY PayCheck 
           MOVE '123Bob Smith           12211974' TO Customer
           DISPLAY CustName
           DISPLAY MOB '/' DOB '/' YOB
           MOVE ZERO TO SampleData
           DISPLAY SampleData 
           MOVE SPACE TO SampleData 
           DISPLAY SampleData 
           MOVE HIGH-VALUE TO SampleData
           DISPLAY SampleData 
           MOVE LOW-VALUE  TO SampleData
           DISPLAY SampleData 
           MOVE QUOTE TO SampleData
           DISPLAY SampleData 
           MOVE ALL "2" TO SampleData
           DISPLAY SampleData 



           STOP RUN.
           