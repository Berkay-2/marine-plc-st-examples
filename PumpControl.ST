PROGRAM PumpControl
VAR
    levelLow       : BOOL;      // Low level sensor
    levelHigh      : BOOL;      // High level sensor
    pumpRunning    : BOOL := FALSE;
    manualMode     : BOOL := FALSE;
END_VAR

IF manualMode THEN
    pumpRunning := TRUE; // Manual override
ELSE
    IF levelHigh THEN
        pumpRunning := FALSE; // Stop when tank is full
    ELSIF levelLow THEN
        pumpRunning := TRUE;  // Start when tank is empty
    END_IF;
END_IF;
