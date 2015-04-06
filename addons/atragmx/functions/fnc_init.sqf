#include "script_component.hpp"

if (isNil QUOTE(EGVAR(advanced_ballistics, AdvancedBallistics))) then { EGVAR(advanced_ballistics, AdvancedBallistics) = false; };
if (isNil QUOTE(EGVAR(advanced_ballistics, AdvancedAirDragEnabled))) then { EGVAR(advanced_ballistics, AdvancedAirDragEnabled) = false; };

GVAR(ATragMX_workingMemory) = [+(GVAR(ATragMX_gunList) select 0), +(GVAR(ATragMX_gunList) select 0), +(GVAR(ATragMX_gunList) select 0), +(GVAR(ATragMX_gunList) select 0)];

GVAR(ATragMX_scopeUnits) = ["MILs", "TMOA", "SMOA", "Clicks"];

GVAR(ATragMX_rangeCardStartRange) = 200;
GVAR(ATragMX_rangeCardEndRange) = 2000;
GVAR(ATragMX_rangeCardIncrement) = 50;
GVAR(ATragMX_rangeCardLastColumns) = ["Lead", "RemV", "RemE", "TmFlt"];
GVAR(ATragMX_rangeCardCurrentColumn) = 3;
GVAR(ATragMX_rangeCardData) = [];

GVAR(GVAR(ATragMX_rangeAssistTargetSizeUnit)s) = ["in", "ft", "cm", "m"];
GVAR(ATragMX_rangeAssistTargetSizeUnit) = 2;
GVAR(ATragMX_rangeAssistImageSizeUnits) = ["MIL", "TMOA", "IOA"];
GVAR(ATragMX_rangeAssistImageSizeUnit) = 0;
GVAR(ATragMX_rangeAssistUseTargetHeight) = true;

GVAR(ATragMX_speedAssistNumTicksUnits) = ["MIL", "TMOA", "IOA"];
GVAR(ATragMX_speedAssistNumTicksUnit) = 0;
GVAR(ATragMX_speedAssistTimer) = true;

GVAR(ATragMX_currentUnit) = 2;
GVAR(ATragMX_currentGun) = [0, 0, 0, 0];
GVAR(ATragMX_currentTarget) = 0;
GVAR(ATragMX_currentScopeUnit) = [0, 0, 0, 0];

GVAR(ATragMX_temperature) = [15, 15, 15, 15];
GVAR(ATragMX_barometricPressure) = [1013.25, 1013.25, 1013.25, 1013.25];
GVAR(ATragMX_relativeHumidity) = [0.5, 0.5, 0.5, 0.5];

GVAR(ATragMX_windSpeed) = [0, 0, 0, 0];
GVAR(ATragMX_windDirection) = [12, 12, 12, 12];
GVAR(ATragMX_inclinationAngle) = [0, 0, 0, 0];
GVAR(ATragMX_targetSpeed) = [0, 0, 0, 0];
GVAR(ATragMX_targetRange) = [0, 0, 0, 0];

GVAR(ATragMX_elevationOutput) = [0, 0, 0, 0];
GVAR(ATragMX_windageOutput) = [0, 0, 0, 0];
GVAR(ATragMX_leadOutput) = [0, 0, 0, 0];
GVAR(ATragMX_tofOutput) = [0, 0, 0, 0];
GVAR(ATragMX_velocityOutput) = [0, 0, 0, 0];
