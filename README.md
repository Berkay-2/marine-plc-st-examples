# marine-plc-st-examples
Structured Text (IEC 61131-3) examples for marine automation systems — pumps, alarms, and monitoring logic.
# Marine PLC Structured Text Examples ⚙️

This repository includes **Structured Text (IEC 61131-3)** examples for common **marine automation systems** such as pumps, alarms, and tank level controls.  
The goal is to demonstrate practical control logic used on board ships.

---

## Contents

| File | Description |

| `PumpControl.ST` | Automatic bilge pump control with manual override 
| `TemperatureAlarm.ST` | Engine temperature monitoring and alarm 
| `NMEA_Parser.ST` | Simple NMEA GGA parser for reading GPS data 
| `EngineRPM_Calculator.ST` | Calculates RPM from pulse sensor input 
| `TankFillingSystem.ST` | Controls a filling pump based on tank level sensor input 



## Tank Filling System Example

### Problem  
Overfilling a tank may lead to overflow or equipment damage.  
The pump should stop automatically when the tank reaches the high level and restart once the level drops back to normal.

### Solution  

```iecst
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
    pumpRunning := TRUE;
    highAlarm := FALSE;
ELSE
    IF tankLevel >= highLevel THEN
        pumpRunning := FALSE;
        highAlarm := TRUE;
    ELSIF tankLevel <= lowLevel THEN
        pumpRunning := TRUE;
        highAlarm := FALSE;
    END_IF;
END_IF;
