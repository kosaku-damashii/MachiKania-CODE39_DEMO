REM CODE39 DEMO

USEGRAPHIC 9:GCLS
BOXFILL 0,0,SYSTEM(22),SYSTEM(23),7
CURSOR 3,1
COLOR 0
PRINT "CODE39 DEMO"
CURSOR 3,7
COLOR 2

DIM D(16*4)
DIM Q(16*4)

RESTORE C39D
FOR I=0 TO 16*4-1
  D(I)=READ()
NEXT

RESTORE CHKD
FOR I=0 TO 16*4-1
  Q(I)=READ()
NEXT


X=20
A$="HNY2022"


G=0
L=LEN(A$)
FOR I=0 TO L-1
  C=(ASC(A$(I,1))-$20)
  G=G+Q(C)
NEXT
G=G%43
FOR I=0 TO 43-1
  IF G=Q(I) THEN BREAK
NEXT

PRINT A$
A$="*"+A$+CHR$(I+$20)+"*"
L=LEN(A$)

FOR I=0 TO L-1
  C=(ASC(A$(I,1))-$20)
  G=D(C)
  FOR P=0 TO 9
    B=(G >> (9-P)) AND 1
    IF P%2=0 THEN BOXFILL X,20,X+2+(2*B),50,0
    X=X+2+(2*B)
  NEXT
NEXT
END

LABEL C39D
DATA $188,$000,$000,$000,
     $150,$054,$000,$000,
     $000,$000,$128,$114,
     $000,$10A,$308,$144,
     $068,$242,$0C2,$2C0,
     $062,$260,$0E0,$04A,
     $248,$0C8,$000,$000,
     $000,$000,$000,$000,
     $000,$212,$092,$290,
     $032,$230,$0B0,$01A,
     $218,$098,$038,$206,
     $086,$284,$026,$224,
     $0A4,$00E,$20C,$08C,
     $02C,$302,$182,$380,
     $122,$320,$1A0,$000,
     $000,$000,$000,$000

LABEL CHKD
DATA 38,99,99,99,
     39,42,99,99,
     99,99,99,41,
     99,36,37,40,
     00,01,02,03,
     04,05,06,07,
     08,09,99,99,
     99,99,99,99,
     99,10,11,12,
     13,14,15,16,
     17,18,19,20,
     21,22,23,24,
     25,26,27,28,
     29,30,31,32,
     33,34,35,99,
     99,99,99,99

