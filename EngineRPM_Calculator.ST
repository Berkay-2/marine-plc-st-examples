PROGRAM EngineRPM_Calculator
VAR
    pulseCount : INT;
    timePeriod : REAL;       // seconds
    RPM        : REAL;
END_VAR

IF timePeriod > 0 THEN
    RPM := (pulseCount / timePeriod) * 60.0; // Convert pulses per second to RPM
END_IF;
