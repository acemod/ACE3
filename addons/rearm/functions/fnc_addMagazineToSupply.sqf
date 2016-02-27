/*
 * Author: GitHawk
 * Adds magazines to the supply.
 *
 * Argument:
 * 0: Target <OBJECT>
 * 1: Magazine Classname <STRING>
 * 2: Only partial <BOOL><OPTIONAL>
 *
 * Return value:
 * None
 *
 * Example:
 * [ammo_truck, "32Rnd_155mm_Mo_shells"] call ace_rearm_fnc_addMagazineToSupply
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_target", objNull, [objNull]], ["_magazineClass", "", [""]], ["_partial", false, [false]]];

if (isNull _target ||
    {_magazineClass isEqualTo ""} ||
    {GVAR(supply) == 0}) exitWith {};

// With limited supply, we add the caliber to the supply count
if (GVAR(supply) == 1) then {
    private _supply = [_target] call FUNC(getSupplyCount);
    ([_magazineClass] call FUNC(getCaliber)) params ["_cal", "_idx"];
    if (!_partial || {GVAR(level) == 1}) then {
        [_target, _supply + _cal] call FUNC(setSupplyCount);
    } else {
        private _magazinePart = ((REARM_COUNT select _idx) / (getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "count"))) min 1;
        [_target, (_supply + (_cal * _magazinePart))] call FUNC(setSupplyCount);
    };
};

// With magazine specific supply, we add or update the magazineSupply array
if (GVAR(supply) == 2) then {
    private _magazineSupply = _target getVariable [QGVAR(magazineSupply), []];
    private _magazineIdx = -1;
    {
        _x params ["_magazine", "_rounds"];
        if ((_magazine isEqualTo _magazineClass)) exitWith {
            _magazineIdx = _forEachIndex;
        };
    } forEach _magazineSupply;

    private _roundsPerTransaction = getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "count");
    if (_partial) then {
        _roundsPerTransaction = _roundsPerTransaction min (REARM_COUNT select _idx);
    };
    if (_magazineIdx == -1) then {
        if (count _magazineSupply == 0) then {
            _magazineSupply = [[_magazineClass, _roundsPerTransaction]];
        } else {
            _magazineSupply append [[_magazineClass, _roundsPerTransaction]];
        }
    } else {
        (_magazineSupply select _magazineIdx) params ["", "_rounds"];
        _magazineSupply set [_magazineIdx, [_magazineClass, (_rounds + _roundsPerTransaction)]];
    };
    _target setVariable [QGVAR(magazineSupply), _magazineSupply, true];
};
