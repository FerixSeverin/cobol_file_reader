





       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABLES.
       AUTHOR. Erik Fahlen.
       DATE-WRITTEN. 2021-08-26
       
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01 Table1.
           02 Friend PIC X(15) OCCURS 4 TIMES.

       01 CustTable.
           02 CustName OCCURS 5 TIMES.
              03 FName PIC X(15).
              03 LName PIC X(15).
       
       01 OrderTable.
           02 Product OCCURS 2 TIMES INDEXED BY I.
              03 ProdName PIC X(10).
              03 ProdSize OCCURS 3 TIMES INDEXED BY J.
                 04 SizeType PIC A.

       PROCEDURE DIVISION.
           *> MOVE 'Joy' TO Friend(1).
           *> MOVE 'Willow' TO Friend(2).
           *> MOVE 'Ivy' TO Friend(3).
           *> DISPLAY Friend(1).
           *> DISPLAY Table1.

           *> MOVE 'Paul' TO FName(1).
           *> MOVE 'Smith' TO LName (1).
           *> MOVE 'Sally' TO FName(2).
           *> MOVE 'Smith' TO LName(2).
           *> DISPLAY CustName(1).
           *> DISPLAY CustTable.

           SET I J TO 1.
           MOVE 'Blue Shirt' TO Product(I).
           MOVE 'S' TO ProdSize(I, J).
           SET J UP BY 1.
           MOVE 'M' TO ProdSize(I, J).
           SET J DOWN BY 1.
           MOVE 'Blue ShirtSMLRed Shirt SML' TO OrderTable.
           PERFORM GetProduct VARYING I FROM 1 BY 1 UNTIL I > 2.
           GO TO LookUp.

       GetProduct.
           DISPLAY PRODUCT(I).
           PERFORM GetSizes VARYING J FROM 1 BY 1 UNTIL J > 3.

       GetSizes.
           DISPLAY ProdSize(I, J).

       LookUp.
           SET I TO 1.
           SEARCH Product
              AT END DISPLAY 'Product Not Found'
              WHEN ProdName(I) = 'Red Shirt'
                 DISPLAY 'Red Shirt Found'
              END-SEARCH
           
           STOP RUN.
