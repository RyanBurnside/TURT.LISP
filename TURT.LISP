(DEFINE-FILE-INFO PACKAGE "INTERLISP" READTABLE "INTERLISP" BASE 10)

(FILECREATED "10-May-2026 19:24:31" {DSK}<home>ryan>il>TURT.LISP;45 11263  

      :CHANGES-TO (FNS CS TURTPLAY)

      :PREVIOUS-DATE "10-May-2026 15:56:40" {DSK}<home>ryan>il>TURT.LISP;43)


(PRETTYCOMPRINT TURTCOMS)

(RPAQQ TURTCOMS
       ((RECORDS TURTLE)
        (FNS BK CLONE CREATETURTLE CS DRWFN FD HOME LT PD PENDSH PENW PU RT SETH SETHOME SETXY 
             TURT-TEST TURTDRAW TURTLECALLUPDATE TURTLINE TURTNGON TURTPLAY TURTSTAR TURTTREE UPDTFN)
        ))
(DECLARE%: EVAL@COMPILE

(RECORD TURTLE (X Y DIRECTION PENDOWN PENSIZE PENDASH DRAWFN RADIANSFLAG HOMEX HOMEY UPDATEFN 
                  USERDATA))
)
(DEFINEQ

(BK
  [LAMBDA (TURT AMOUNT)
    (with TURTLE TURT (LET* [(NEWX (- X (TIMES (COS DIRECTION RADIANSFLAG)
                                               AMOUNT)))
                             (NEWY (- Y (TIMES (SIN DIRECTION RADIANSFLAG)
                                               AMOUNT]
                            (TURTLINE TURT NEWX NEWY)
                            (SETQ X NEWX)
                            (SETQ Y NEWY)
                            (TURTLECALLUPDATE TURT)
                            TURT])

(CLONE
  [LAMBDA (TURT)
    (APPEND TURT])

(CREATETURTLE
  [LAMBDA (X Y DIRECTION DRAWFN PENSIZE PENDASH PENDOWN HOMEX HOMEY RADIANSFLAG UPDATEFN)
    (create TURTLE
           X _ (OR X 0)
           Y _ (OR Y 0)
           DIRECTION _ (OR DIRECTION 90)
           DRAWFN _ (OR DRAWFN NIL)
           PENSIZE _ (OR PENSIZE 1)
           PENDASH _ (OR PENDASH NIL)
           PENDOWN _ (OR PENDOWN T)
           RADIANSFLAG _ (OR RADIANSFLAG NIL)
           HOMEX _ (OR HOMEX 0)
           HOMEY _ (OR HOMEY 0)
           UPDATEFN _ (OR UPDATEFN NIL])

(CS
  [LAMBDA (TURTPLAYWINDOW)

    (* ;; "Clears the bitmap of a Turtle Play window redraws turtle")

    (LET [[BMPSTREAM (CAR (WINDOWPROP TURTPLAYWINDOW 'BMPSTREAM]
          (TURT (CAR (WINDOWPROP TURTPLAYWINDOW 'TURT]
         (if BMPSTREAM
             then (CLEARW TURTPLAYWINDOW)
                  (DSPFILL NIL WHITESHADE NIL BMPSTREAM)
                  (TURTDRAW TURT TURTPLAYWINDOW 32])

(DRWFN
  [LAMBDA (TURT FN)
    (replace DRAWFN of TURT with FN)
    TURT])

(FD
  [LAMBDA (TURT AMOUNT)
    (with TURTLE TURT (LET* [(NEWX (+ X (TIMES (COS DIRECTION RADIANSFLAG)
                                               AMOUNT)))
                             (NEWY (+ Y (TIMES (SIN DIRECTION RADIANSFLAG)
                                               AMOUNT]
                            (TURTLINE TURT NEWX NEWY)
                            (SETQ X NEWX)
                            (SETQ Y NEWY)
                            (TURTLECALLUPDATE TURT)
                            TURT])

(HOME
  [LAMBDA (TURT)
    (with TURTLE TURT (TURTLINE TURT HOMEX HOMEY)
          (SETQ X HOMEX)
          (SETQ Y HOMEY)
          (TURTLECALLUPDATE TURT])

(LT
  [LAMBDA (TURT ANGLE)
    [LET* ((MOD-VAL (if (fetch RADIANSFLAG of TURT)
                        then (TIMES CL:PI 2.0)
                      else 360.0))
           (CURRENT-ANGLE (fetch DIRECTION of TURT)))
          (with TURTLE TURT (SETQ DIRECTION (CL:MOD (+ CURRENT-ANGLE ANGLE)
                                                   MOD-VAL]
    (TURTLECALLUPDATE TURT)
    TURT])

(PD
  [LAMBDA (TURT)
    (replace PENDOWN of TURT with T)
    (TURTLECALLUPDATE TURT)
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
    (TURTLECALLUPDATE TURT)
    TURT])

(RT
  [LAMBDA (TURT ANGLE)
    [LET* ((MOD-VAL (if (fetch RADIANSFLAG of TURT)
                        then (TIMES CL:PI 2.0)
                      else 360.0))
           (CURRENT-ANGLE (fetch DIRECTION of TURT)))
          (with TURTLE TURT (SETQ DIRECTION (CL:MOD (- CURRENT-ANGLE ANGLE)
                                                   MOD-VAL]
    (TURTLECALLUPDATE TURT)
    TURT])

(SETH
  [LAMBDA (TURT ANGLE)
    (replace DIRECTION of TURT with (if (fetch RADIANSFLAG of TURT)
                                        then (CL:MOD ANGLE (TIMES CL:PI 2.0))
                                      else (CL:MOD ANGLE 360.0)))
    (TURTLECALLUPDATE TURT)
    TURT])

(SETHOME
  [LAMBDA (TURT XPOS YPOS)
    (with TURTLE TURT (SETQ HOMEX XPOS)
          (SETQ HOMEY YPOS))
    TURT])

(SETXY
  [LAMBDA (TURT XPOS YPOS)
    (with TURTLE TURT (TURTLINE TURT XPOS YPOS)
          (SETQ X XPOS)
          (SETQ Y YPOS)
          (TURTLECALLUPDATE TURT))
    TURT])

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

(TURTDRAW
  [LAMBDA (TURT STREAM SIDELN)
    (LET ((TEMP (CLONE TURT)))
         [DRWFN TEMP `(LAMBDA (XX YY XX2 YY2 IGNORED IGNORED2)
                        (DRAWLINE XX YY XX2 YY2 1 NIL ,STREAM NIL IGNORED2]
         (UPDTFN TEMP NIL)
         (PD TEMP)
         (with TURTLE TEMP (if RADIANSFLAG
                               then (SETQ DIRECTION (TIMES DIRECTION 57.2958)))
               (SETQ RADIANSFLAG NIL))
         (RT TEMP 90)
         (FD TEMP (TIMES SIDELN 1/4))
         (LT TEMP 104.48)
         (FD TEMP SIDELN)
         (LT TEMP 151.04)
         (FD TEMP SIDELN)
         (LT TEMP 104.48)
         (FD TEMP (TIMES SIDELN 1/4])

(TURTLECALLUPDATE
  [LAMBDA (TURT)
    (with TURTLE TURT (if UPDATEFN
                          then (APPLY* UPDATEFN TURT])

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

(TURTPLAY
  [LAMBDA NIL

    (* ;; "Produces a turtle for drawing and maps screen drawing to his drawing functions. Returns a cons pair of Turtle instance and Window he operates in. Capture the output to use the turtle manually.")

    (LET* ((W (DECODE.WINDOW.ARG NIL 400 400 "TURTPLAY"))
           (TURT (CREATETURTLE))
           [WINDOWBMP (BITMAPCREATE (WINDOWPROP W 'WIDTH)
                             (WINDOWPROP W 'HEIGHT]
           (BUFFERSTREAM (DSPCREATE WINDOWBMP)))
          (WINDOWADDPROP W 'TURT TURT)
          (WINDOWADDPROP W 'BMP WINDOWBMP)
          (WINDOWADDPROP W 'BMPSTREAM BUFFERSTREAM)
          [DRWFN TURT `(LAMBDA (X Y X2 Y2 PENSIZE PENDASH)
                         (DRAWLINE X Y X2 Y2 PENSIZE NIL ,BUFFERSTREAM NIL PENDASH]
          [UPDTFN TURT `(LAMBDA (TURT)
                          (CLEARW ,W)
                          (BITBLT ,WINDOWBMP 0 0 ,W)
                          (TURTDRAW TURT ,W 32]
          (BITBLT WINDOWBMP 0 0 W)
          (SETHOME TURT 200 200)
          (PU TURT)
          (HOME TURT)
          (PD TURT)
          (TURTDRAW TURT W 32)
          (CONS TURT W])

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

(UPDTFN
  [LAMBDA (TURT FN)
    (replace UPDATEFN of TURT with FN)
    TURT])
)
(DECLARE%: DONTCOPY
  (FILEMAP (NIL (708 11240 (BK 718 . 1248) (CLONE 1250 . 1296) (CREATETURTLE 1298 . 1814) (CS 1816 . 
2233) (DRWFN 2235 . 2325) (FD 2327 . 2857) (HOME 2859 . 3032) (LT 3034 . 3463) (PD 3465 . 3581) (
PENDSH 3583 . 3689) (PENW 3691 . 3899) (PU 3901 . 4019) (RT 4021 . 4450) (SETH 4452 . 4771) (SETHOME 
4773 . 4896) (SETXY 4898 . 5089) (TURT-TEST 5091 . 6363) (TURTDRAW 6365 . 7075) (TURTLECALLUPDATE 7077
 . 7217) (TURTLINE 7219 . 7396) (TURTNGON 7398 . 7847) (TURTPLAY 7849 . 9015) (TURTSTAR 9017 . 9522) (
TURTTREE 9524 . 11143) (UPDTFN 11145 . 11238)))))
STOP
