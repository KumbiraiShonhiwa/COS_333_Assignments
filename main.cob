       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIND-STATS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 DATA-ARRAY.
               05 DATA-ELEMENT OCCURS 5 TIMES PIC 9(5).
           01 COUNTS OCCURS 100 TIMES PIC 9(5) VALUE 0.
           01 MAX-COUNT PIC 9(5) VALUE 0.
           01 MODE-VALUE PIC S9(5) VALUE -1.
           01 SMALLEST PIC 9(5).
           01 LARGEST PIC 9(5).
           01 I PIC 9(5).

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           PERFORM READ-DATA.
           PERFORM FIND-SMALLEST.
           PERFORM FIND-LARGEST.
           PERFORM FIND-MODE.
           PERFORM DISPLAY-RESULTS.
           STOP RUN.

       READ-DATA.
           DISPLAY "Enter integer value 1: " WITH NO ADVANCING.
           ACCEPT DATA-ELEMENT(1).
           DISPLAY "Enter integer value 2: " WITH NO ADVANCING.
           ACCEPT DATA-ELEMENT(2).
           DISPLAY "Enter integer value 3: " WITH NO ADVANCING.
           ACCEPT DATA-ELEMENT(3).
           DISPLAY "Enter integer value 4: " WITH NO ADVANCING.
           ACCEPT DATA-ELEMENT(4).
           DISPLAY "Enter integer value 5: " WITH NO ADVANCING.
           ACCEPT DATA-ELEMENT(5).
    
       FIND-SMALLEST.
           MOVE DATA-ELEMENT(1) TO SMALLEST.
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > 5
               IF DATA-ELEMENT(I) < SMALLEST
                   MOVE DATA-ELEMENT(I) TO SMALLEST
               END-IF
           END-PERFORM.

       FIND-LARGEST.
           MOVE DATA-ELEMENT(1) TO LARGEST.
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > 5
               IF DATA-ELEMENT(I) > LARGEST
                   MOVE DATA-ELEMENT(I) TO LARGEST
               END-IF
           END-PERFORM.

       FIND-MODE.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               ADD 1 TO COUNTS(DATA-ELEMENT(I))
           END-PERFORM.
           PERFORM VARYING I FROM 0 BY 1 UNTIL I > 99
               IF COUNTS(I) > MAX-COUNT
                   MOVE COUNTS(I) TO MAX-COUNT
                   MOVE I TO MODE-VALUE
               END-IF
           END-PERFORM.

       DISPLAY-RESULTS.
           DISPLAY "Smallest value: " SMALLEST.
           DISPLAY "Largest value: " LARGEST.
           DISPLAY "Mode: " MODE-VALUE.

