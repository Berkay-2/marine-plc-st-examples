PROGRAM TemperatureAlarm
VAR
    temperature   : REAL;          // Sensor input
    limitHigh     : REAL := 95.0;  // Max allowed
    alarmActive   : BOOL := FALSE;
END_VAR

IF temperature >= limitHigh THEN
    alarmActive := TRUE;
ELSE
    alarmActive := FALSE;
END_IF;
