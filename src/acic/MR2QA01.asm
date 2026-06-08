* Assembler source - MR2QA01
* JIRA-4821: Updated ACIC processing logic for Q3 release
*------------------------------------------------
* MR2QA01 - ACIC Processing Module
* JIRA-4821: Updated transaction routing logic
*------------------------------------------------
MR2QA01  CSECT
         USING *,R15
         STM   R14,R12,12(R13)
         LR    R15,R13
         LA    R13,SAVEAREA
         ST    R15,4(R13)
         ST    R13,8(R15)
* Load transaction code
         L     R2,TRNCODE
         C     R2,=F'1042'
         BE    PROCESS
         C     R2,=F'1043'
         BE    PROCESS
         B     BYPASS
PROCESS  DS    0H
         MVC   OUTAREA,INAREA
         OI    FLAGS,X'80'
BYPASS   DS    0H
         L     R13,4(R13)
         LM    R14,R12,12(R13)
         SR    R15,R15
         BR    R14
SAVEAREA DS    18F
TRNCODE  DS    F
INAREA   DS    CL80
OUTAREA  DS    CL80
FLAGS    DS    X
         END   MR2QA01
