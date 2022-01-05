REM Polymer Picker
MODE7:VDU23;8202;0;0;0;
PROCcntr(1,6,1,"Polymer Picker")
PROCcntr(0,6,2,"by Stephen Scott (c) 2021")
PROCcntr(0,6,3,"Thanks to ChrisB, jms2 and lurkio")
PRINT'"  The oceans are full of plastic junk.   It is your task to clean them up! Swim"
PRINT " and collect the red junk items before   the local sealife eats it and dies."
PRINT'"  You have a limited air supply, which   decreases gradually as you swim. If"
PRINT " you swim faster, this will decrease     more quickly."
PRINT'"  Watch out for the shark. If it touches you, then you'll be badly hurt.":*FX15,0
PRINTTAB(8,23);CHR$129;CHR$(157);CHR$135;"    PRESS A KEY      ";CHR$156;:VDU28,0,22,39,6
A=GET:CLS:*FX15,0
PRINT'"  Also, take care not to touch any pink  coral or pufferfish, as this will not"
PRINT " only hurt you, but your bleeding will   attract the shark more quickly to you!"
PRINT'"  Once you have collected all the junk   you will proceed to the next bay."
PRINT'"  Controls:     Z - swim left"
PRINT "                X - swim right"
PRINT "              */"" - swim up"
PRINT "                ? - swim down"
PRINT "     Return/Enter - swim faster"
A=GET:VDU26,12
PROCchars
PROCenv
PAGE=&1100:CHAIN"POLY2"
DEFPROCcntr(D%,C%,Y%,msg$)
X%=(40-LEN(msg$))/2
msg$=CHR$(128+C%)+msg$
IFD%=1 FORN%=0TO1:PRINTTAB(X%-2,Y%+N%)CHR$141msg$:NEXT:ENDPROC
PRINTTAB(X%-1,Y%+N%)msg$
ENDPROC
DEFPROCchars
VDU23,224,0,124,254,255,254,124,3,127
VDU23,225,0,0,192,192,12,220,254,190
VDU23,226,254,253,251,199,30,8,0,0
VDU23,227,126,222,192,140,30,0,0,0
VDU23,228,0,0,3,3,48,59,255,253
VDU23,229,0,62,127,255,127,62,192,254
VDU23,230,254,251,3,49,120,0,0,0
VDU23,231,127,191,223,227,112,16,0,0
VDU23,232,0,0,0,32,32,112,92,142
VDU23,233,128,63,127,103,64,64,128,128
VDU23,234,0,0,0,4,4,14,58,113
VDU23,235,1,252,254,230,2,2,1,1
VDU23,240,8,24,61,223,127,61,24,8
VDU23,241,16,24,188,251,254,188,24,8
VDU23,250,0,126,126,126,126,126,126,0
VDU23,254,0,0,8,32,4,16,0,0
VDU23,255,1,0,32,8,0,64,0,1
REM shrimp
VDU23,237,5,5,0,27,127,224,137,37
REM crab
VDU23,236,165,66,66,24,102,255,66,129
REM sea grass
VDU23,242,202,106,106,106,110,126,126,60
VDU23,243,10,82,84,68,36,177,155,218
VDU23,244,80,74,42,34,36,141,217,219
REM coral
VDU23,253,146,84,84,40,170,170,108,16
ENDPROC
DEFPROCenv
REM Collect
ENVELOPE1,1,1,1,1,1,1,1,0,0,0,-5,120,120
REM Bell
ENVELOPE2,1,0,0,0,50,25,25,127,-1,-1,-1,126,90
REM Bubbles
ENVELOPE3,5,15,0,0,72,0,0,-6,127,0,-9,0,126
REM Breathing
ENVELOPE4,129,0,-10,-1,1,0,2,6,-1,0,-1,126,74
ENDPROC
