(DEFINE-FILE-INFO PACKAGE "INTERLISP" READTABLE "INTERLISP" BASE 10)

(FILECREATED "19-Apr-2026 21:15:13" {DSK}<home>ryan>il>TURT.LISP;9 3821   

      :CHANGES-TO (FNS PENW TURT-TEST PENDSH CREATE-TURTLE JMP FD DRWFN PD PU LTT RT)
                  (VARS TURTCOMS)

      :PREVIOUS-DATE "19-Apr-2026 00:27:52" {DSK}<home>ryan>il>TURT.LISP;3)


(PRETTYCOMPRINT TURTCOMS)

(RPAQQ TURTCOMS ((RECORDS TURTLE)
                 (FNS BK CREATE-TURTLE DRWFN FD JMP LTT PD PENDSH PENW PU RT TURT-TEST)))
(DECLARE%: EVAL@COMPILE

(RECORD TURTLE (X Y DIRECTION PENDOWN PENSIZE PENDASH DRAWFN RADIANSFLAG))
)
(DEFINEQ

(BK
  [LAMBDA (TURT AMOUNT)
    (FD TURT (TIMES AMOUNT -1.0])

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

(FD
  [LAMBDA (TURT AMOUNT)
    (LET* [(OLDX (fetch X of TURT))
           (OLDY (fetch Y of TURT))
           (DIRECTION (fetch DIRECTION of TURT))
           (RADIANSFLAG (fetch RADIANSFLAG of TURT))
           (DRAWFN (fetch DRAWFN of TURT))
           (PENDASH (fetch PENDASH of TURT))
           (PENSIZE (fetch PENSIZE of TURT))
           (PENDOWN (fetch PENDOWN of TURT))
           (NEWX (PLUS OLDX (TIMES (COS DIRECTION RADIANSFLAG)
                                   AMOUNT)))
           (NEWY (PLUS OLDY (TIMES (SIN DIRECTION RADIANSFLAG)
                                   AMOUNT]
          (if PENDOWN
              then (APPLY* DRAWFN OLDX OLDY NEWX NEWY PENSIZE PENDASH))
          (replace X of TURT with NEWX)
          (replace Y of TURT with NEWY)
          TURT])

(JMP
  [LAMBDA (TURT X Y)
    (replace X of TURT with X)
    (replace Y of TURT with Y)
    TURT])

(LTT
  [LAMBDA (TURT ANGLE)
    (RT TURT (- ANGLE])

(PD
  [LAMBDA (TURT)
    (REPLACE PENDOWN OF TURT WITH T)
    TURT])

(PENDSH
  [LAMBDA (TURT DASH-LIST)
    (replace PENDASH of TURT with DASH-LIST])

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
                        then                                 (* PI 2.0)
                      else 360.0))
           (CURRENT-ANGLE (fetch DIRECTION of TURT)))
          (with TURTLE TURT (SETQ DIRECTION (CL:MOD (+ CURRENT-ANGLE ANGLE)
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
          (PENW TT 2)
          (PENDSH TT (LIST 3 3 3))
          (for I from 1 to 8 do (FRPTQ 4 (FD TT 100)
                                       (RT TT 90))
                                (RT TT 45])
)
(DECLARE%: DONTCOPY
  (FILEMAP (NIL (615 3798 (BK 625 . 694) (CREATE-TURTLE 696 . 1159) (DRWFN 1161 . 1251) (FD 1253 . 2137)
 (JMP 2139 . 2265) (LTT 2267 . 2326) (PD 2328 . 2412) (PENDSH 2414 . 2510) (PENW 2512 . 2720) (PU 2722
 . 2808) (RT 2810 . 3236) (TURT-TEST 3238 . 3796)))))
STOP
