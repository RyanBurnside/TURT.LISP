(DEFINE-FILE-INFO PACKAGE "INTERLISP" READTABLE "INTERLISP" BASE 10)

(FILECREATED "22-Apr-2026 15:44:19" {DSK}<home>ryan>il>TURT.LISP;17 4403   

      :CHANGES-TO (FNS TURTNGON TURTSTAR LT)
                  (VARS TURTCOMS)

      :PREVIOUS-DATE "22-Apr-2026 00:19:45" {DSK}<home>ryan>il>TURT.LISP;15)


(PRETTYCOMPRINT TURTCOMS)

(RPAQQ TURTCOMS ((RECORDS TURTLE)
                 (FNS BK CREATE-TURTLE DRWFN FACE FD JMP LT PD PENDSH PENW PU RT TURT-TEST TURTNGON 
                      TURTSTAR)))
(DECLARE%: EVAL@COMPILE

(RECORD TURTLE (X Y DIRECTION PENDOWN PENSIZE PENDASH DRAWFN RADIANSFLAG))
)
(DEFINEQ

(BK
  [LAMBDA (TURT AMOUNT)
    (FD TURT (MINUS AMOUNT])

(CREATE-TURTLE
  [LAMBDA (X Y DIRECTION DRAWFN PENSIZE PENDASH PENDOWN RADIANSFLAG)
    (create TURTLE
           X _ (OR X 0)
           Y _ (OR Y 0)
           DIRECTION _ (OR DIRECTION 90)
           DRAWFN _ [OR DRAWFN '(LAMBDA (X Y X2 Y2 PENSIZE PENDASH)
                                  NIL]
           PENSIZE _ (OR PENSIZE 1)
           PENDASH _ (OR PENDASH NIL)
           PENDOWN _ (OR PENDOWN T)
           RADIANSFLAG _ (OR RADIANSFLAG NIL])

(DRWFN
  [LAMBDA (TURT FN)
    (replace DRAWFN of TURT with FN)
    TURT])

(FACE
  [LAMBDA (TURT ANGLE)
    (replace DIRECTION of TURT with ANGLE])

(FD
  [LAMBDA (TURT AMOUNT)
    (with TURTLE TURT (LET* [(NEWX (PLUS X (TIMES (COS DIRECTION RADIANSFLAG)
                                                  AMOUNT)))
                             (NEWY (PLUS Y (TIMES (SIN DIRECTION RADIANSFLAG)
                                                  AMOUNT]
                            (if (AND PENDOWN DRAWFN)
                                then (APPLY* DRAWFN X Y NEWX NEWY PENSIZE PENDASH))
                            (SETQ X NEWX)
                            (SETQ Y NEWY)
                            TURT])

(JMP
  [LAMBDA (TURT X Y)
    (replace X of TURT with X)
    (replace Y of TURT with Y)
    TURT])

(LT
  [LAMBDA (TURT ANGLE)
    (RT TURT (MINUS ANGLE])

(PD
  [LAMBDA (TURT)
    (REPLACE PENDOWN OF TURT WITH T)
    TURT])

(PENDSH
  [LAMBDA (TURT DASH-LIST)
    (replace PENDASH of TURT with DASH-LIST)
    TURT])

(PENW
  [LAMBDA (TURT SIZE)
    (replace PENSIZE of TURT with (if (< SIZE 0)
                                      then 0
                                    else SIZE))
    TURT])

(PU
  [LAMBDA (TURT)
    (replace PENDOWN of TURT with NIL)
    TURT])

(RT
  [LAMBDA (TURT ANGLE)
    [LET* ((MOD-VAL (if (fetch RADIANSFLAG of TURT)
                        then (TIMES CL:PI 2.0)
                      else 360.0))
           (CURRENT-ANGLE (fetch DIRECTION of TURT)))
          (with TURTLE TURT (SETQ DIRECTION (CL:MOD (- CURRENT-ANGLE ANGLE)
                                                   MOD-VAL]
    TURT])

(TURT-TEST
  [LAMBDA NIL
    (LET* ((W (CREATEW (CREATEREGION 200 200 400 400)
                     "TURT-TEST"))
           (TT (CREATE-TURTLE)))
          [DRWFN TT `(LAMBDA (X Y X2 Y2 PENSIZE PENDASH)
                       (DRAWLINE X Y X2 Y2 PENSIZE NIL ,W NIL PENDASH]
          (JMP TT 200 200)
          (FRPTQ 6 (TURTSTAR TT 7 120 3)
                 (RT TT 60))
          (CONS TT W])

(TURTNGON
  [LAMBDA (TURT NUMSIDES SIDELENGTH LEFTTURN)
    (LET [(TURNDEG (if (fetch RADIANSFLAG of TURT)
                       then (/ (TIMES CL:PI 2.0)
                               NUMSIDES)
                     else (/ 360.0 NUMSIDES]
         (FRPTQ NUMSIDES (FD TURT SIDELENGTH)
                (if LEFTTURN
                    then (LT TURT TURNDEG)
                  else (RT TURT TURNDEG])

(TURTSTAR
  [LAMBDA (TURT NUMPOINTS SIDELENGTH SKIP LEFTTURN)
    (LET [(TURNDEG (if (fetch RADIANSFLAG of TURT)
                       then (/ (TIMES 2.0 CL:PI SKIP)
                               NUMPOINTS)
                     else (/ (TIMES 360.0 SKIP)
                             NUMPOINTS]
         (FRPTQ NUMPOINTS (FD TURT SIDELENGTH)
                (if LEFTTURN
                    then (LT TURT TURNDEG)
                  else (RT TURT TURNDEG])
)
(DECLARE%: DONTCOPY
  (FILEMAP (NIL (621 4380 (BK 631 . 695) (CREATE-TURTLE 697 . 1160) (DRWFN 1162 . 1252) (FACE 1254 . 
1342) (FD 1344 . 1917) (JMP 1919 . 2045) (LT 2047 . 2109) (PD 2111 . 2195) (PENDSH 2197 . 2303) (PENW 
2305 . 2513) (PU 2515 . 2601) (RT 2603 . 3000) (TURT-TEST 3002 . 3420) (TURTNGON 3422 . 3871) (
TURTSTAR 3873 . 4378)))))
STOP
