(DEFINE-FILE-INFO PACKAGE "INTERLISP" READTABLE "INTERLISP" BASE 10)

(FILECREATED "22-Apr-2026 00:19:45" {DSK}<home>ryan>il>TURT.LISP;15 4365   

      :CHANGES-TO (FNS FD)

      :PREVIOUS-DATE "20-Apr-2026 22:14:24" {DSK}<home>ryan>il>TURT.LISP;14)


(PRETTYCOMPRINT TURTCOMS)

(RPAQQ TURTCOMS ((RECORDS TURTLE)
                 (FNS BK CREATE-TURTLE DRWFN FACE FD JMP LTT PD PENDSH PENW PU RT TURT-TEST TURTNGON
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

(LTT
  [LAMBDA (TURT ANGLE)
    (RT TURT (MINUS ANGLE))
    TURT])

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
                    then (LTT TURT TURNDEG)
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
                    then (LTT TURT TURNDEG)
                  else (RT TURT TURNDEG])
)
(DECLARE%: DONTCOPY
  (FILEMAP (NIL (569 4342 (BK 579 . 643) (CREATE-TURTLE 645 . 1108) (DRWFN 1110 . 1200) (FACE 1202 . 
1290) (FD 1292 . 1865) (JMP 1867 . 1993) (LTT 1995 . 2069) (PD 2071 . 2155) (PENDSH 2157 . 2263) (PENW
 2265 . 2473) (PU 2475 . 2561) (RT 2563 . 2960) (TURT-TEST 2962 . 3380) (TURTNGON 3382 . 3832) (
TURTSTAR 3834 . 4340)))))
STOP
