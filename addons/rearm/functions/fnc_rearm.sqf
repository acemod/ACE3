#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Starts progress bar for rearming a vehicle.
 *
 * Arguments:
 * 0: Target Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank, player] call ace_rearm_fnc_rearm
 *
 * Public: No
 */

params ["_target", "_unit"];
TRACE_2("rearm",_target,_unit);

private _attachedDummy = _unit getVariable [QGVAR(dummy), objNull];
if (isNull _attachedDummy) exitWith {ERROR_1("attachedDummy null %1",_attachedDummy);};
private _magazineClass = _attachedDummy getVariable QGVAR(magazineClass);
if (isNil "_magazineClass") exitWith {ERROR_1("magazineClass nil %1",_attachedDummy);};

([_magazineClass] call FUNC(getCaliber)) params ["_cal", "_idx"];

// Get magazines that can be rearmed
private _needRearmMags = [_target] call FUNC(getNeedRearmMagazines);
private _needRearmMagsOfClass = _needRearmMags select {(_x select 0) isEqualTo _magazineClass};

// Exit if no magazines need rearming
if (_needRearmMagsOfClass isEqualTo []) exitWith {ERROR_2("Could not find turret for %1 in %2",_magazineClass,typeOf _target);};

private _currentRearmableMag = _needRearmMagsOfClass select 0;
_currentRearmableMag params ["", "_turretPath", "_isPylon", "_pylon", "", "_magazineCount"];

// If mag is pylon, pylon position enabled, level is not Entire Vehicle, munition model is not default box
private _isMisaligned = false;
if (_isPylon && {GVAR(usePylonPosition)} && {GVAR(level) > 0} && {typeOf _attachedDummy isNotEqualTo QGVAR(defaultCarriedObject)}) then {
    _isMisaligned = true;
    private _pylonDistance = GVAR(distance);
    private _pylonPos = [0, 0, 0];
    private _pylonDir = [0, 0, 0];

    // Check if there are multiple rearmable pylons of the same magazine class, and if so, find the closest one to the munition
    private _multipleRearmablePylons = _needRearmMagsOfClass param [1, []] param [2, false];
    {
        private _xNeedRearmMagsOfClass = _x;
        private _xMagIndex = _forEachIndex;
        _x params ["", "", "_xMagIsPylon", "_xMagPylonIndex"];
        if !_xMagIsPylon then {continue;};

        {
            _x params ["_xPylonIndex", "", "", "", "", "", "_xPylonPosInfo", "_xPylonObj"];
            if (_xPylonIndex != _xMagPylonIndex) then {continue;};
            _xPylonPosInfo params ["_xPylonPos", "_xPylonDir"];
            private _xPylonPosATL = _target modelToWorldVisual _xPylonPos;

            private _xDistance = _xPylonPosATL distance _attachedDummy;
            if (_xDistance < _pylonDistance) then {
                _pylonDistance = _xDistance;
                _currentRearmableMag = _needRearmMagsOfClass select _xMagIndex;
                _pylonPos = _xPylonPosATL;
                _pylonDir = _target vectorModelToWorldVisual _xPylonDir;
            };
        } forEach getAllPylonsInfo _target;
    } forEach ([[_currentRearmableMag], _needRearmMagsOfClass] select _multipleRearmablePylons);

    // Exit if munition is too far from pylon
    #define MUNITION_DISTANCE 2
    if (_pylonDistance > MUNITION_DISTANCE) exitWith {
        [[LSTRING(Hint_MunitionDistance), _pylonDistance toFixed 1]] call EFUNC(common,displayTextStructured);
    };

    // Exit if munition is not aligned with pylon
    #define MUNITION_ANGLE 5
    private _pylonAngle = abs (180 - acos (_pylonDir vectorDotProduct (vectorNormalized vectorDir _attachedDummy)));
    if (_pylonAngle > MUNITION_ANGLE) exitWith {
        //hint format ["Munition not aligned with pylon. Angle: %1",_pylonAngle];
        [[LSTRING(Hint_MunitionAngle), round _pylonAngle]] call EFUNC(common,displayTextStructured);
    };

    _isMisaligned = false;
    hint ""; //
};
if (_isMisaligned) exitWith {};

_currentRearmableMag params ["", "_turretPath", "_isPylon", "_pylon", "", "_magazineCount"];

private _magazineDisplayName = _magazineClass call FUNC(getMagazineName);

[
    TIME_PROGRESSBAR(REARM_DURATION_REARM select _idx),
    [_target, _unit, _turretPath, _magazineCount, _magazineClass, (REARM_COUNT select _idx), _pylon],
    {(_this select 0) call FUNC(rearmSuccess)},
    "",
    format [localize LSTRING(RearmAction), getText(configOf _target >> "displayName"), _magazineDisplayName],
    {
        //IGNORE_PRIVATE_WARNING ["_player"];
        param [0] params ["_target", "_unit"];
        _player distance _target <= GVAR(distance);
    },
    ["isnotinside"]
] call EFUNC(common,progressBar);
