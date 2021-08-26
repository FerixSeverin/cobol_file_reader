





       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOOPING.
       AUTHOR. Erik Fahlen.
       DATE-WRITTEN. 2021-08-26
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Ind PIC 9(1) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM OutputData WITH TEST AFTER UNTIL Ind > 5
           GO TO ForLoop.           

       OutputData.
           DISPLAY Ind.
           ADD 1 TO Ind.

       ForLoop.
           PERFORM OutputData2 VARYING Ind FROM 1 BY 1 UNTIL Ind=5
           STOP RUN.

       OutputData2.
           DISPLAY Ind.