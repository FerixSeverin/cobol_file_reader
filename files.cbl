





       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILES.
       AUTHOR. Erik Fahlen.
       DATE-WRITTEN. 2021-08-26
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL. 
           SELECT CustomerFile ASSIGN TO "Customer.dat"
              ORGANIZATION IS LINE SEQUENTIAL
              ACCESS IS SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD CustomerFile.
       01 CustomerData.
           02 IDNum PIC 9(5).
           02 CustName.
              03 FirstName PIC X(15).
              03 LastName PIC X(15).

       WORKING-STORAGE SECTION.
       01 WSCustomer.
           02 WSIDNum PIC 9(5).
           02 WSCustName.
              03 WSFirstName PIC X(15).
              03 WSLastName PIC X(15).
       01 WSEOF PIC A(1).

       PROCEDURE DIVISION.
           *> OUTPUT
           *> EXTEND
           OPEN INPUT CustomerFile.
               *> OUTPUT
               *> MOVE 00001 TO IDNum.
               *> MOVE 'Doug' TO FirstName.
               *> MOVE 'Thomas' TO LastName.
               
               *> EXTEND
               *> DISPLAY "Customer ID " WITH NO ADVANCING 
               *> ACCEPT IDNum 
               *> DISPLAY "Customer First Name " WITH NO ADVANCING 
               *> ACCEPT FirstName
               *> DISPLAY "Customer Last Name " WITH NO ADVANCING 
               *> ACCEPT LastName  
               *> WRITE CustomerData
               *> END-WRITE.

               *> INPUT
              PERFORM UNTIL WSEOF='Y'
                 READ CustomerFile INTO WSCustomer
                    AT END MOVE 'Y' TO WSEOF
                    NOT AT END DISPLAY WSCustomer 
                 END-READ
              END-PERFORM
           CLOSE CustomerFile.
           
           
           STOP RUN.