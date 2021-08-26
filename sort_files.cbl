





       IDENTIFICATION DIVISION.
       PROGRAM-ID. SORT_FILES.
       AUTHOR. Erik Fahlen.
       DATE-WRITTEN. 2021-08-26
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT WorkFile ASSIGN TO 'work.tmp'.
           SELECT OrgFile ASSIGN TO 'student.dat'
              ORGANIZATION IS LINE SEQUENTIAL.
           SELECT SortedFile ASSIGN TO 'student2.dat'
              ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION. 
       FD OrgFile.
       01 StudData.
           02 IDNum PIC 9.
           02 StudName PIC X(10).
       SD  WorkFile.
       01 WStudData.
           02 WIDNum PIC 9.
           02 WStudName PIC X(10).
       FD SortedFile.
       01 SStudData.
           02 SIDNum PIC 9.
           02 SStudName PIC X(10).

       WORKING-STORAGE SECTION.
       
       
       PROCEDURE DIVISION.
           SORT WorkFile ON ASCENDING KEY SIDNum
              USING OrgFile
              GIVING SortedFile.
           
           STOP RUN.
