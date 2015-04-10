#include "script_component.hpp"

GVAR(workingMemory) = [+(GVAR(gunList) select 0), +(GVAR(gunList) select 0), +(GVAR(gunList) select 0), +(GVAR(gunList) select 0)];

GVAR(scopeUnits) = ["MILs", "TMOA", "SMOA", "Clicks"];

GVAR(rangeCardStartRange) = 200;
GVAR(rangeCardEndRange) = 2000;
GVAR(rangeCardIncrement) = 50;
GVAR(rangeCardLastColumns) = ["Lead", "RemV", "RemE", "TmFlt"];
GVAR(rangeCardCurrentColumn) = 3;
GVAR(rangeCardData) = [];

GVAR(GVAR(rangeAssistTargetSizeUnit)s) = ["in", "ft", "cm", "m"];
GVAR(rangeAssistTargetSizeUnit) = 2;
GVAR(rangeAssistImageSizeUnits) = ["MIL", "TMOA", "IOA"];
GVAR(rangeAssistImageSizeUnit) = 0;
GVAR(rangeAssistUseTargetHeight) = true;

GVAR(speedAssistNumTicksUnits) = ["MIL", "TMOA", "IOA"];
GVAR(speedAssistNumTicksUnit) = 0;
GVAR(speedAssistTimer) = true;

GVAR(currentUnit) = 2;
GVAR(currentGun) = [0, 0, 0, 0];
GVAR(currentTarget) = 0;
GVAR(currentScopeUnit) = [0, 0, 0, 0];

GVAR(temperature) = [15, 15, 15, 15];
GVAR(barometricPressure) = [1013.25, 1013.25, 1013.25, 1013.25];
GVAR(relativeHumidity) = [0.5, 0.5, 0.5, 0.5];

GVAR(windSpeed) = [0, 0, 0, 0];
GVAR(windDirection) = [12, 12, 12, 12];
GVAR(inclinationAngle) = [0, 0, 0, 0];
GVAR(targetSpeed) = [0, 0, 0, 0];
GVAR(targetRange) = [0, 0, 0, 0];

GVAR(elevationOutput) = [0, 0, 0, 0];
GVAR(windageOutput) = [0, 0, 0, 0];
GVAR(leadOutput) = [0, 0, 0, 0];
GVAR(tofOutput) = [0, 0, 0, 0];
GVAR(velocityOutput) = [0, 0, 0, 0];
