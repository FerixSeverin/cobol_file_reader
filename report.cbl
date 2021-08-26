





       IDENTIFICATION DIVISION.
       PROGRAM-ID. REPORT.
       AUTHOR. Erik Fahlen.
       DATE-WRITTEN. 2021-08-26
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL. 
           SELECT CustomerReport ASSIGN TO "CustReport.rpt"
              ORGANIZATION IS LINE SEQUENTIAL.
           SELECT CustomerFile ASSIGN TO "Customer.dat"
              ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD CustomerReport.
       01 PrintLine PIC X(44).

       FD CustomerFile.
       01 CustomerData.
           02 IDNum PIC 9(5).
           02 CustName.
              03 FirstName PIC X(15).
              03 LastName PIC X(15).
           88 WSEOF VALUE HIGH-VALUE.

       WORKING-STORAGE SECTION.
       01 PageHeading.
           02 FILLER PIC X(13) VALUE "Customer List".
       01 PageFooting.
           02 FILLER PIC X(15) VALUE SPACE.
           02 FILLER PIC X(7) VALUE "Page : ".
           02 PrnPageNum PIC Z9.
       01 Heads PIC X(36) VALUE "IDNum     FirstName     LastName".
       01 CustomerDetailLine.
           02 FILLER PIC X VALUE SPACE.
           02 PrnCustID PIC 9(5).
           02 FILLER PIC X(4) VALUE SPACE.
           02 PrnFirstName PIC X(15).
           02 FILLER PIC XX VALUE SPACE.
           02 PrnLastName PIC X(15).
       01 ReportFooting PIC X(13) VALUE "END OF REPORT".
       01 LineCount PIC 99 VALUE ZERO.
           88 NewPageRequired VALUE 40 THRU 99.
       01 PageCount PIC 99 VALUE ZERO.

       PROCEDURE DIVISION.
           OPEN INPUT CustomerFile 
              OPEN OUTPUT CustomerReport
              PERFORM PrintPageHeading
              READ CustomerFile
                 AT END SET WSEOF TO TRUE
              END-READ
              PERFORM PrintReportBody UNTIL WSEOF 
              WRITE PrintLine FROM ReportFooting AFTER ADVANCING 5
              LINES
           CLOSE CustomerFile, CustomerReport.
           STOP RUN.

       PrintPageHeading.
           WRITE PrintLine FROM PageHeading AFTER ADVANCING PageCount 
           WRITE PrintLine FROM Heads AFTER ADVANCING 5 LINES.
           MOVE 3 TO LineCount
           ADD 1 TO PageCount.

       PrintReportBody.
           IF NewPageRequired
              MOVE PageCount TO PrnPageNum
              WRITE PrintLine FROM PageFooting AFTER ADVANCING 5 LINES 
              PERFORM PrintPageHeading
           END-IF
           MOVE IDNum TO PrnCustID
           MOVE FirstName TO PrnFirstName
           MOVE LastName TO PrnLastName
           WRITE PrintLine FROM CustomerDetailLine AFTER ADVANCING 1
           LINE
           ADD 1 TO LineCount
           READ CustomerFile
              AT END SET WSEOF TO TRUE
           END-READ.