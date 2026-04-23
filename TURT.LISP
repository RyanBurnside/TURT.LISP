(DEFINE-FILE-INFO PACKAGE "INTERLISP" READTABLE "INTERLISP" BASE 10)

(FILECREATED "23-Apr-2026 16:00:38" {DSK}<home>ryan>il>TURT.LISP;24 7617   

      :CHANGES-TO (FNS TURT-TEST TURTTREE SETXY CLONE)
                  (VARS TURTCOMS)

      :PREVIOUS-DATE "22-Apr-2026 21:26:44" {DSK}<home>ryan>il>TURT.LISP;21)


(PRETTYCOMPRINT TURTCOMS)

(RPAQQ TURTCOMS ((RECORDS TURTLE)
                 (FNS BK CLONE CREATETURTLE DRWFN FD HOME LT PD PENDSH PENW PU RT SETH SETHOME SETXY
                      TURT-TEST TURTLINE TURTNGON TURTSTAR TURTTREE)))
(DECLARE%: EVAL@COMPILE

(RECORD TURTLE (X Y DIRECTION PENDOWN PENSIZE PENDASH DRAWFN RADIANSFLAG HOMEX HOMEY))
)
(DEFINEQ

(BK
  [LAMBDA (TURT AMOUNT)
    (FD TURT (MINUS AMOUNT])

(CLONE
  [LAMBDA (TURT)
    (APPEND TURT])

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
    (with TURTLE TURT (TURTLINE TURT XPOS YPOS)
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
          (PU TURT)
          (SETXY TURT 50 300)
          (PD TURT)
          (TURTSTAR TURT 100 50 24)
          (SETHOME TURT 200 32)
          (PU TURT)
          (SETXY TURT 0 200)
          (for I from 0 to 10 do (SETH TURT 0)
                                 (PD TURT)
                                 (FD TURT 400)
                                 (PU TURT)
                                 (RT TURT 90)
                                 (FD TURT (TIMES I I))
                                 (RT TURT 90)
                                 (FD TURT 400))
          (PU TURT)
          (SETH TURT 90)
          (HOME TURT)
          (PD TURT)
          (TURTTREE TURT 120 2/3 10)
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

(TURTTREE
  [LAMBDA (TURT TRUNKLENGTH TRUNKREDUCTIONMULTIPLIER GENERATIONS)
    (LET* ((GENERATION1 (LIST (CLONE TURT)))
           (GENERATION2 NIL)
           (WIGGLE (LIST 10 50))
           (LENGTHWIGGLE (LIST 3/4 1))
           (TRUNKWIDTH 10)
           TURTA TURTB)
          (PENW (CAR GENERATION1)
                TRUNKWIDTH)
          (FD (CAR GENERATION1)
              TRUNKLENGTH)
          (FRPTQ GENERATIONS (SETQ TRUNKLENGTH (TIMES TRUNKLENGTH TRUNKREDUCTIONMULTIPLIER))
                 (SETQ TRUNKWIDTH (TIMES TRUNKWIDTH 3/4))
                 (for TRT in GENERATION1 do (SETQ TURTA (CLONE TRT))
                                            (LT TURTA (APPLY 'RAND WIGGLE))
                                            (PENW TURTA TRUNKWIDTH)
                                            (FD TURTA (TIMES TRUNKLENGTH (APPLY 'RAND LENGTHWIGGLE)))
                                            (push GENERATION2 TURTA)
                                            (SETQ TURTB (CLONE TRT))
                                            (RT TURTB (APPLY 'RAND WIGGLE))
                                            (PENW TURTB TRUNKWIDTH)
                                            (FD TURTB (TIMES TRUNKLENGTH (APPLY 'RAND LENGTHWIGGLE)))
                                            (push GENERATION2 TURTB))
                 (SETQ GENERATION1 GENERATION2)
                 (SETQ GENERATION2 NIL))
          (SETQ TRUNKLENGTH (TIMES TRUNKLENGTH TRUNKREDUCTIONMULTIPLIER))
          (for TRT in GENERATION1 do (FD TRT TRUNKLENGTH])
)
(DECLARE%: DONTCOPY
  (FILEMAP (NIL (680 7594 (BK 690 . 754) (CLONE 756 . 802) (CREATETURTLE 804 . 1342) (DRWFN 1344 . 1434)
 (FD 1436 . 1922) (HOME 1924 . 2059) (LT 2061 . 2123) (PD 2125 . 2209) (PENDSH 2211 . 2317) (PENW 2319
 . 2527) (PU 2529 . 2615) (RT 2617 . 3014) (SETH 3016 . 3291) (SETHOME 3293 . 3416) (SETXY 3418 . 3560
) (TURT-TEST 3562 . 4834) (TURTLINE 4836 . 5013) (TURTNGON 5015 . 5464) (TURTSTAR 5466 . 5971) (
TURTTREE 5973 . 7592)))))
STOP
