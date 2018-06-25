#include "script_component.hpp"
/*
 * Author: GitHawk
 * Removes a magazine from the supply.
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 * 1: Magazine Classname <STRING>
 * 2: Number of Rounds to withdraw <NUMBER> (default: -1)
 *
 * Return Value:
 * Magazine was removed <BOOL>
 *
 * Example:
 * [ammo_truck, "500Rnd_127x99_mag_Tracer_Red"] call ace_rearm_fnc_removeMagazineFromSupply
 *
 * Public: Yes
 */

params [["_truck", objNull, [objNull]], ["_magazineClass", "", [""]], ["_numRounds", -1, [0]]];
TRACE_3("removeMagazineFromSupply",_truck,_magazineClass,_numRounds);

if (isNull _truck || {_magazineClass isEqualTo ""}) exitWith {false};

private _return = false;
([_magazineClass] call FUNC(getCaliber)) params ["_cal", "_idx"];

if (GVAR(supply) == 0) then {
    WARNING("supply setting is set to unlimited"); // func shouldn't have been called
    _return = true;
};

if (GVAR(supply) == 1) then {
    private _supply = [_truck] call FUNC(getSupplyCount);
    if (GVAR(level) == 2) then {
        // Remove partial magazine supply count
        private _rearmAmount = (REARM_COUNT select _idx);
        if (_numRounds > 0) then {
            _rearmAmount = _numRounds;
        };
        private _magazinePart = (_rearmAmount / (getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "count"))) min 1;
        if (_supply >= (_cal * _magazinePart)) then {
            [_truck, (_supply - (_cal * _magazinePart))] call FUNC(setSupplyCount);
            _return = true;
        };
    } else {
        // Remove entire magazine supply count
        if (_supply >= _cal) then {
            [_truck, (_supply - _cal)] call FUNC(setSupplyCount);
            _return = true;
        };
    };
};

if (GVAR(supply) == 2) then {
    private _magazineSupply = _truck getVariable [QGVAR(magazineSupply), []];
    private _magazineIdx = -1;
    {
        _x params ["_magazine"];
        if ((_magazine isEqualTo _magazineClass)) exitWith {
            _magazineIdx = _forEachIndex;
        };
    } forEach _magazineSupply;
    if (_magazineIdx == -1) exitWith {false};

    (_magazineSupply select _magazineIdx) params ["", "_rounds"];

    private _configRounds = getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "count");
    if (GVAR(level) == 2) then {
        // With caliber based rearming, we need to remove the correct amount
        private _rearmAmount = (REARM_COUNT select _idx);
        if (_numRounds > 0) then {
            if (_numRounds > _rearmAmount) then {
                _rearmAmount = ceil (_numRounds / _rearmAmount);
            };
        };
        private _roundsPerTransaction = _rearmAmount min _configRounds;
        if (_rounds >= _roundsPerTransaction) then {
            _magazineSupply set [_magazineIdx, [_magazineClass, (_rounds - _roundsPerTransaction)]];
            _truck setVariable [QGVAR(magazineSupply), _magazineSupply, true];
            _return = true;
        };
    } else {
        // Remove entire magazine
        if (_rounds >= _configRounds) then {
            _magazineSupply set [_magazineIdx, [_magazineClass, (_rounds - _configRounds)]];
            _truck setVariable [QGVAR(magazineSupply), _magazineSupply, true];
            _return = true;
        };
    };
};
_return
