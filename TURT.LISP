(DEFINE-FILE-INFO PACKAGE "INTERLISP" READTABLE "INTERLISP" BASE 10)

(FILECREATED "22-Apr-2026 21:26:44" {DSK}<home>ryan>il>TURT.LISP;21 5347   

      :CHANGES-TO (FNS TURT-TEST)

      :PREVIOUS-DATE "22-Apr-2026 19:59:21" {DSK}<home>ryan>il>TURT.LISP;20)


(PRETTYCOMPRINT TURTCOMS)

(RPAQQ TURTCOMS ((RECORDS TURTLE)
                 (FNS BK CREATETURTLE DRWFN FD HOME LT PD PENDSH PENW PU RT SETH SETHOME SETXY 
                      TURT-TEST TURTLINE TURTNGON TURTSTAR)))
(DECLARE%: EVAL@COMPILE

(RECORD TURTLE (X Y DIRECTION PENDOWN PENSIZE PENDASH DRAWFN RADIANSFLAG HOMEX HOMEY))
)
(DEFINEQ

(BK
  [LAMBDA (TURT AMOUNT)
    (FD TURT (MINUS AMOUNT])

(CREATETURTLE
  [LAMBDA (X Y DIRECTION DRAWFN PENSIZE PENDASH PENDOWN HOMEX HOMEY RADIANSFLAG)
    (create TURTLE
           X _ (OR X 0)
           Y _ (OR Y 0)
           DIRECTION _ (OR DIRECTION 90)
           DRAWFN _ [OR DRAWFN '(LAMBDA (X Y X2 Y2 PENSIZE PENDASH)
                                  NIL]
           PENSIZE _ (OR PENSIZE 1)
           PENDASH _ (OR PENDASH NIL)
           PENDOWN _ (OR PENDOWN T)
           RADIANSFLAG _ (OR RADIANSFLAG NIL)
           HOMEX _ (OR HOMEX 0)
           HOMEY _ (OR HOMEY 0])

(DRWFN
  [LAMBDA (TURT FN)
    (replace DRAWFN of TURT with FN)
    TURT])

(FD
  [LAMBDA (TURT AMOUNT)
    (with TURTLE TURT (LET* [(NEWX (PLUS X (TIMES (COS DIRECTION RADIANSFLAG)
                                                  AMOUNT)))
                             (NEWY (PLUS Y (TIMES (SIN DIRECTION RADIANSFLAG)
                                                  AMOUNT]
                            (TURTLINE TURT NEWX NEWY)
                            (SETQ X NEWX)
                            (SETQ Y NEWY)
                            TURT])

(HOME
  [LAMBDA (TURT)
    (with TURTLE TURT (TURTLINE TURT HOMEX HOMEY)
          (SETQ X HOMEX)
          (SETQ Y HOMEY])

(LT
  [LAMBDA (TURT ANGLE)
    (RT TURT (MINUS ANGLE])

(PD
  [LAMBDA (TURT)
    (replace PENDOWN of TURT with T)
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

(SETH
  [LAMBDA (TURT ANGLE)
    (replace DIRECTION of TURT with (if (fetch RADIANSFLAG of TURT)
                                        then (CL:MOD ANGLE (TIMES CL:PI 2.0))
                                      else (CL:MOD ANGLE 360.0])

(SETHOME
  [LAMBDA (TURT XPOS YPOS)
    (with TURTLE TURT (SETQ HOMEX XPOS)
          (SETQ HOMEY YPOS))
    TURT])

(SETXY
  [LAMBDA (TURT XPOS YPOS)
    (WITH TURTLE TURT (TURTLINE TURT XPOS YPOS)
          (SETQ X XPOS)
          (SETQ Y YPOS])

(TURT-TEST
  [LAMBDA NIL
    (LET* ((W (DECODE.WINDOW.ARG NIL 400 400 "TURT TEST"))
           (TURT (CREATETURTLE))
           [WINDOWBMP (BITMAPCREATE (WINDOWPROP W 'WIDTH)
                             (WINDOWPROP W 'HEIGHT]
           (BUFFERSTREAM (DSPCREATE WINDOWBMP)))
          [DRWFN TURT `(LAMBDA (X Y X2 Y2 PENSIZE PENDASH)
                         (DRAWLINE X Y X2 Y2 PENSIZE NIL ,BUFFERSTREAM NIL PENDASH]
          (SETHOME TURT 200 200)
          (PU TURT)
          (HOME TURT)
          (PD TURT)
          (FRPTQ 6 (TURTSTAR TURT 7 120 3)
                 (RT TURT 60))
          (SETH TURT 45)
          (FD TURT 100)
          (BITBLT WINDOWBMP 0 0 W)
          (CONS TURT W])

(TURTLINE
  [LAMBDA (TURT NEWX NEWY)
    (with TURTLE TURT (if (AND PENDOWN DRAWFN)
                          then (APPLY* DRAWFN X Y NEWX NEWY PENSIZE PENDASH])

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
  (FILEMAP (NIL (611 5324 (BK 621 . 685) (CREATETURTLE 687 . 1225) (DRWFN 1227 . 1317) (FD 1319 . 1805) 
(HOME 1807 . 1942) (LT 1944 . 2006) (PD 2008 . 2092) (PENDSH 2094 . 2200) (PENW 2202 . 2410) (PU 2412
 . 2498) (RT 2500 . 2897) (SETH 2899 . 3174) (SETHOME 3176 . 3299) (SETXY 3301 . 3443) (TURT-TEST 3445
 . 4185) (TURTLINE 4187 . 4364) (TURTNGON 4366 . 4815) (TURTSTAR 4817 . 5322)))))
STOP
