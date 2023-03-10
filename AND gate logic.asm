# Micro-Processor-Micro-Controller-

ORG 0000H
SETB P1.0;              CONFIGURE PIN P1.0
SETB P1.1;              CONFIGURE PIN P1.1
SETB P1.2;              CONFIGURE PIN P1.2
READY:MOV C,P1.0;      READING PIN P1.1 WHER ETHE FIRST SWITCH IS CONNECTED
JNC CHECK1;             IF CARRY IS RESET JUMP TO CHECK1(AS IF THE 1ST SWITCH IS 1 THEN ONLY THE FURTHER CHECKING WILL BE PROCEEDED)
SJMP READY;             IF CARRY IS SET JUMP TO READY(AS IF THE 1ST SWITCH IS 0 THE RESULT WILL BE 0 AND AS IT IS ALREADY IN 0 WE SKIP THE FURTHER CHECKING)
CHECK1:MOV C,P1.1;     READ THE NEXT PIN(P1.1)
JNC CHECK2;             IF CARRY IS RESET JUMP TO CHECK2
SJMP READY;             IF THE CARRY IS RESET JUMP TO READY
CHECK2:CLR P1.2;       THE CODE FLOW COMES TO THIS LIN ONLY IF BOTH THE PORT PINS ARE 1. IF SO THE LED WILL TURN ON
ACALL DELAY;            TO PRODUCE DELAY
SETB P1.2;              TURNING OFF THE LED
LJMP READY;             REPEAT THE READING PROCCESS
DELAY:MOV R7,#2FH;    DELAY PROGRAM BY COUNTING 
LOOP:DJNZ R7,LOOP;
RET;
END; 
