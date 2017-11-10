/*
 * Author: Ruthberg
 * Inits all global variables with the default values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_init
 *
 * Public: No
 */
#include "script_component.hpp"


GVAR(workingMemory) = +(GVAR(gunList) select 0);

GVAR(scopeUnits) = ["MILs", "TMOA", "SMOA", "Clicks"];
GVAR(scopeClickUnits) = ["TMOA", "SMOA", "MILs"];

GVAR(rangeCardStartRange) = 200;
GVAR(rangeCardEndRange) = 2000;
GVAR(rangeCardIncrement) = 50;
GVAR(rangeCardLastColumns) = ["Lead", "RemV", "RemE", "TmFlt"];
GVAR(rangeCardCurrentColumn) = 3;
GVAR(rangeCardData) = [];

GVAR(rangeAssistTargetSizeUnits) = ["in", "ft", "cm", "m"];
GVAR(rangeAssistTargetSizeUnit) = 2;
GVAR(rangeAssistImageSizeUnits) = ["MIL", "TMOA", "IOA"];
GVAR(rangeAssistImageSizeUnit) = 0;
GVAR(rangeAssistUseTargetHeight) = true;

GVAR(speedAssistNumTicksUnits) = ["MIL", "TMOA", "IOA"];
GVAR(speedAssistNumTicksUnit) = 0;
GVAR(speedAssistTimer) = true;

GVAR(currentUnit) = 2;
GVAR(currentGun) = 0;
GVAR(currentTarget) = 0;
GVAR(currentScopeUnit) = 0;
GVAR(currentScopeClickUnit) = 2;
GVAR(currentScopeClickUnitTemp) = 2;
GVAR(currentScopeClickNumber) = 10;
GVAR(currentScopeClickNumberTemp) = 10;

GVAR(atmosphereModeTBH) = true;
GVAR(altitude) = 0;
GVAR(temperature) = 15;
GVAR(barometricPressure) = 1013.25;
GVAR(relativeHumidity) = 0.0;

GVAR(latitude) = [38, 38, 38, 38];
GVAR(directionOfFire) = [0, 0, 0, 0];
GVAR(windSpeed1) = [0, 0, 0, 0];
GVAR(windSpeed2) = [0, 0, 0, 0];
GVAR(windDirection) = [12, 12, 12, 12];
GVAR(inclinationAngle) = [0, 0, 0, 0];
GVAR(targetSpeed) = [0, 0, 0, 0];
GVAR(targetSpeedDirection) = [1, 1, 1, 1];
GVAR(targetRange) = [0, 0, 0, 0];

GVAR(showWind2) = false;
GVAR(showCoriolis) = false;
GVAR(elevationOutput) = [0, 0, 0, 0];
GVAR(windage1Output) = [0, 0, 0, 0];
GVAR(windage2Output) = [0, 0, 0, 0];
GVAR(leadOutput) = [0, 0, 0, 0];
GVAR(tofOutput) = [0, 0, 0, 0];
GVAR(velocityOutput) = [0, 0, 0, 0];
GVAR(verticalCoriolisOutput) = [0, 0, 0, 0];
GVAR(horizontalCoriolisOutput) = [0, 0, 0, 0];
GVAR(spinDriftOutput) = [0, 0, 0, 0];

GVAR(truingDropMode) = 0;
GVAR(truingDropRangeData) = [0, 0];
GVAR(truingDropDropData) = [0, 0, 0];
GVAR(truingDropReferenceDropData) = [0, 0, 0];
GVAR(truingDropC1) = 0;
GVAR(truingDropMuzzleVelocity) = 0;

GVAR(targetSolutionInput) = nil;

GVAR(targetRangeDirtyFlag) = false;

GVAR(showMainPage) = true;
GVAR(showAddNewGun) = false;
GVAR(showAtmoEnvData) = false;
GVAR(showC1BallisticCoefficientData) = false;
GVAR(showGunAmmoData) = false;
GVAR(showGunList) = false;
GVAR(showMuzzleVelocityData) = false;
GVAR(showRangeCard) = false;
GVAR(showRangeCardSetup) = false;
GVAR(showSolutionSetup) = false;
GVAR(showTargetData) = false;
GVAR(showTargetRangeAssist) = false;
GVAR(showTargetSpeedAssist) = false;
GVAR(showTargetSpeedAssistTimer) = false;
GVAR(showTruingDrop) = false;
