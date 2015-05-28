/*
 * Authors: Ruthberg
 * Updates the range card data
 *
 * Arguments:
 * 0: ammo class <STRING>
 * 1: weapon class <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [mode] call ace_rangecard_fnc_openRangeCard
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;
#define __dsp (uiNamespace getVariable "RangleCard_Display")

private ["_airFriction", "_ammoConfig", "_atmosphereModel", "_barometricPressure", "_barrelLength", "_barrelTwist", "_bc", "_boreHeight", "_cacheEntry", "_column", "_control", "_dragModel", "_i", "_muzzleVelocity", "_mv", "_mvShift", "_offset", "_relativeHumidity", "_result", "_row", "_scopeBaseAngle", "_weaponConfig", "_zeroRange"];

PARAMS_2(_ammoClass,_weaponClass);

if (_ammoClass == "" || _weaponClass == "") exitWith {};

{
    ctrlDelete _x;
} forEach GVAR(controls);
GVAR(controls) = [];

for "_row" from 0 to 49 do {
    _offset = if (_row < 5) then {0} else {0.003};
    _control = (__dsp ctrlCreate ["RangeCard_RscText", 790000 + _row]);
    _control ctrlSetPosition [safeZoneX + 0.183, safeZoneY + 0.374 + 0.027 * _row + _offset, 0.062, 0.025];
    if (_row in [0, 8, 18, 28, 38, 48]) then {
        _control ctrlSetTextColor [1, 1, 1, 1];
    } else {
        _control ctrlSetTextColor [0, 0, 0, 1];
    };
    _control ctrlCommit 0;
    _control ctrlSetText Str(100 + _row * 50);
    GVAR(controls) pushBack _control;
};
for "_column" from 0 to 8 do {
    for "_row" from 0 to 49 do {
    _offset = if (_row < 5) then {0} else {0.003};
        _control = (__dsp ctrlCreate ["RangeCard_RscText", 90000 + _column * 100 + _row]);
        _control ctrlSetPosition [safeZoneX + 0.249 + _column * 0.055, safeZoneY + 0.374 + 0.027 * _row + _offset, 0.052, 0.025];
        _control ctrlCommit 0;
        _control ctrlSetText "-0.0";
        GVAR(controls) pushBack _control;
    };
};
for "_column" from 0 to 2 do {
    for "_row" from 0 to 49 do {
        _offset = if (_row < 5) then {0} else {0.003};
        _control = (__dsp ctrlCreate ["RangeCard_RscText", 90000 + (9 +_column) * 100 + _row]);
        _control ctrlSetPosition [safeZoneX + 0.743 + _column * 0.049, safeZoneY + 0.374 + 0.027 * _row + _offset, 0.047, 0.025];
        _control ctrlCommit 0;
        _control ctrlSetText "-0.0";
        GVAR(controls) pushBack _control;
    };
};
for "_column" from 0 to 2 do {
    for "_row" from 0 to 49 do {
        _offset = if (_row < 5) then {0} else {0.003};
        _control = (__dsp ctrlCreate ["RangeCard_RscText", 90000 + (12 +_column) * 100 + _row]);
        _control ctrlSetPosition [safeZoneX + 0.892 + _column * 0.049, safeZoneY + 0.374 + 0.027 * _row + _offset, 0.047, 0.025];
        _control ctrlCommit 0;
        _control ctrlSetText "-0.0";
        GVAR(controls) pushBack _control;
    };
};

lnbClear 770100;
lnbClear 770200;
lnbClear 770300;
lnbClear 770400;

lnbAddRow [770100, ["4mps Wind(MRADs)", "1mps LEAD(MRADs)"]];
lnbAddRow [770100, ["Air/Ammo Temp", "Air/Ammo Temp"]];

lnbAddRow [770200, ["-15°C", " -5°C", "  5°C", " 10°C", " 15°C", " 20°C", " 25°C", " 30°C", " 35°C"]];
lnbAddRow [770300, ["-15°C", " 10°C", " 35°C", "-15°C", " 10°C", " 35°C"]];

GVAR(rangeCardDataElevation) = [[], [], [], [], [], [], [], [], []];
GVAR(rangeCardDataWindage) = [[], [], [], [], [], [], [], [], []];
GVAR(rangeCardDataLead) = [[], [], [], [], [], [], [], [], []];
GVAR(rangeCardDataMVs) = [];
GVAR(lastValidRow) = [];

GVAR(currentUnit) = 2;
GVAR(rangeCardStartRange) = 100;
GVAR(rangeCardIncrement) = 50;
GVAR(rangeCardEndRange) = GVAR(rangeCardStartRange) + 49 * GVAR(rangeCardIncrement);

_ammoConfig = _ammoClass call EFUNC(advanced_ballistics,readAmmoDataFromConfig);
_weaponConfig = _weaponClass call EFUNC(advanced_ballistics,readWeaponDataFromConfig);
_airFriction = _ammoConfig select 0;
_barrelTwist = _weaponConfig select 0;
_barrelLength = _weaponConfig select 2;
_muzzleVelocity = [_barrelLength, _ammoConfig select 10, _ammoConfig select 11, 0] call EFUNC(advanced_ballistics,calculateBarrelLengthVelocityShift);

ctrlSetText [770000, format["%1'' - %2 gr (%3)", round((_ammoConfig select 1) * 39.3700787) / 1000, round((_ammoConfig select 3) * 15.4323584), _ammoClass]];
ctrlSetText [770002, format["Barrel: %1'' 1:%2'' twist", round(_barrelLength * 0.0393700787), round(_barrelTwist * 0.0393700787)]];

_bc = (_ammoConfig select 6) select 0;
_dragModel = _ammoConfig select 5;
_atmosphereModel = _ammoConfig select 8;
_boreHeight = 3.81;
_zeroRange  = 100;

_barometricPressure = EGVAR(weather,altitude) call EFUNC(weather,calculateBarometricPressure);
_relativeHumidity = 0.5;

ctrlSetText [770001, format["Drop Tables for B.P.: %1mb; Corrected for MVV at Air/Ammo Temperatures -15-35 °C", round(_barometricPressure * 100) / 100]];
ctrlSetText [77004 , format["B.P.: %1mb", round(_barometricPressure * 100) / 100]];

_cacheEntry = missionNamespace getVariable format[QGVAR(%1_%2), _ammoClass, _weaponClass];
if (isNil {_cacheEntry}) then {
    {
        _mvShift = [_ammoConfig select 9, _x] call EFUNC(advanced_ballistics,calculateAmmoTemperatureVelocityShift);
        _mv = _muzzleVelocity + _mvShift;
        
        _result = [0, 0, _boreHeight, _airFriction, _mv, _x, 1013.25, 0.5, 1000, [0, 0], 0, 0, 0, _zeroRange, _bc, _dragModel, _atmosphereModel, false, 1.5, 0, 0, 0] call FUNC(calculateSolution);
        _scopeBaseAngle = (_result select 0) / 60;
        
        [_scopeBaseAngle,27,_boreHeight,_airFriction,_mv,_x,_barometricPressure,_relativeHumidity,1000,[4,0],3,0,4,GVAR(rangeCardEndRange),_bc,_dragModel,_atmosphereModel,true,1.5,1,46,23,_forEachIndex] call FUNC(calculateSolution);
    } forEach [-15, -5, 5, 10, 15, 20, 25, 30, 35];

    for "_i" from 0 to 9 do {
        GVAR(lastValidRow) pushBack count (GVAR(rangeCardDataElevation) select _i);
        while {count (GVAR(rangeCardDataElevation) select _i) < 50} do {
            (GVAR(rangeCardDataElevation) select _i) pushBack "###";
            (GVAR(rangeCardDataWindage) select _i) pushBack "##";
            (GVAR(rangeCardDataLead) select _i) pushBack "##";
        };
    };
    
    missionNamespace setVariable [format[QGVAR(%1_%2), _ammoClass, _weaponClass], [GVAR(rangeCardDataElevation), GVAR(rangeCardDataWindage), GVAR(rangeCardDataLead), GVAR(rangeCardDataMVs), GVAR(lastValidRow)]];
} else {
    GVAR(rangeCardDataElevation) = _cacheEntry select 0;
    GVAR(rangeCardDataWindage)   = _cacheEntry select 1;
    GVAR(rangeCardDataLead)      = _cacheEntry select 2;
    GVAR(rangeCardDataMVs)       = _cacheEntry select 3;
    GVAR(lastValidRow)           = _cacheEntry select 4;
};

lnbAddRow [770200, GVAR(rangeCardDataMVs)];

for "_column" from 0 to 8 do {
    for "_row" from 0 to 49 do {
        _control = (__dsp displayCtrl (90000 + _column * 100 + _row));
        _control ctrlSetText ((GVAR(rangeCardDataElevation) select _column) select _row);
        _control ctrlCommit 0;
    };
};
{
    for "_row" from 0 to 49 do {
        _control = (__dsp displayCtrl (90000 + (9 + _forEachIndex) * 100 + _row));
        _control ctrlSetText ((GVAR(rangeCardDataWindage) select _x) select _row);
        _control ctrlCommit 0;
    };
} forEach [0, 3, 8];

{
    for "_row" from 0 to 49 do {
        _control = (__dsp displayCtrl (90000 + (12 + _forEachIndex) * 100 + _row));
        _control ctrlSetText ((GVAR(rangeCardDataLead) select _x) select _row);
        _control ctrlCommit 0;
    };
} forEach [0, 3, 8];
