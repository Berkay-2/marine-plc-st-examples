PROGRAM TankFillingSystem
VAR
    tankLevel     : REAL;             // Level in %
    highLevel     : REAL := 90.0;     // High-level alarm
    lowLevel      : REAL := 40.0;     // Restart level
    pumpRunning   : BOOL := FALSE;    // Pump output
    highAlarm     : BOOL := FALSE;    // Alarm signal
    manualOverride: BOOL := FALSE;    // Manual mode
END_VAR

IF manualOverride THEN
    // Manual override: Operator forces pump ON
    pumpRunning := TRUE;
    highAlarm := FALSE;
ELSE
    // Automatic control based on tank level
    IF tankLevel >= highLevel THEN
        pumpRunning := FALSE;   // Stop pump when tank is full
        highAlarm := TRUE;      // Trigger alarm
    ELSIF tankLevel <= lowLevel THEN
        pumpRunning := TRUE;    // Restart pump when level is low
        highAlarm := FALSE;
    END_IF;
END_IF;

Add TankFillingSystem structured text example
