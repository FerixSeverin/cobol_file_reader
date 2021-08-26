





       IDENTIFICATION DIVISION.
       PROGRAM-ID. PREFILL_TABLES.
       AUTHOR. Erik Fahlen.
       DATE-WRITTEN. 2021-08-26
       
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01 ProdTable.
           02 ProdData.
              03 FILLER PIC X(8) VALUE "Red SML".
              03 FILLER PIC X(8) VALUE "Blue SML".
              03 FILLER PIC X(8) VALUE "GreenSML".
           02 FILLER REDEFINES ProdData.
              03 Shirt OCCURS 3 TIMES.
                 04 ProdName PIC X(5).
                 04 ProdSizes PIC A OCCURS 3 TIMES.
       01 ChangeMe.
           02 TextNum PIC X(6).
           02 FloatNum REDEFINES TextNum PIC 9(4)V99.
       01 StrNum PIC X(7).
       01 SplitNum.
           02 WNum PIC 9(4) VALUE ZERO.
           02 FNum PIC 99 VALUE ZERO.
       01 FlNum REDEFINES SplitNum PIC 9999V99.
       01 DollarNum PIC $$,$$9.99.
       
       PROCEDURE DIVISION.
           DISPLAY Shirt(1).
           MOVE '123456' TO TextNum.
           DISPLAY FloatNum.
           DISPLAY "Enter a Float : " WITH NO ADVANCING 
           ACCEPT StrNum 
           UNSTRING StrNum 
              DELIMITED BY "." OR ALL SPACES 
              INTO WNum, FNum 
           MOVE FlNum TO DollarNum 
           DISPLAY DollarNum.
           STOP RUN.
