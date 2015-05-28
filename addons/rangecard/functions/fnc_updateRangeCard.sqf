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

PARAMS_2(_ammoClass,_weaponClass);

if (_ammoClass == "" || _weaponClass == "") exitWith {};

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

for "_i" from 0 to 49 do {
    lnbAddRow [770400, [Str(GVAR(rangeCardStartRange) + GVAR(rangeCardIncrement) * _i), (GVAR(rangeCardDataElevation) select 0) select _i, (GVAR(rangeCardDataElevation) select 1) select _i, (GVAR(rangeCardDataElevation) select 2) select _i,
                                            (GVAR(rangeCardDataElevation) select 3) select _i, (GVAR(rangeCardDataElevation) select 4) select _i, (GVAR(rangeCardDataElevation) select 5) select _i,
                                            (GVAR(rangeCardDataElevation) select 6) select _i, (GVAR(rangeCardDataElevation) select 7) select _i, (GVAR(rangeCardDataElevation) select 8) select _i,
                                            (GVAR(rangeCardDataWindage) select 0) select _i, (GVAR(rangeCardDataWindage) select 3) select _i, (GVAR(rangeCardDataWindage) select 8) select _i,
                                            (GVAR(rangeCardDataLead) select 0) select _i, (GVAR(rangeCardDataLead) select 3) select _i, (GVAR(rangeCardDataLead) select 8) select _i]];
};

#define __dsp (uiNamespace getVariable "RangleCard_Display")
#define __ctrlListNBox (__dsp displayCtrl 770400)

{
    __ctrlListNBox lnbSetColor [[_x, 0], [1, 1, 1, 1]];
} forEach [0, 8, 18, 28, 38, 48];

{
    for "_i" from (GVAR(lastValidRow) select _x) to 49 do {
        __ctrlListNBox lnbSetColor [[_i, _forEachIndex + 1], [0, 0, 0, 0.6]];
    };
} forEach [0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 3, 8, 0, 3, 8];
