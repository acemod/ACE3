/*
 * Author: PabstMirror
 * Tests if unit can load a magazine into a static weapon.
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Player <OBJECT>
 * 3: Carryable Magazine <STRING>
 * 4: Weapon <STRING>
 * 5: Check if empty based on ace_setting <OPTIONAL><BOOL>
 *
 * Return Value:
 * <BOOL>
 *
 * Example:
 * [cursorTarget, [0], player, "ACE_100Rnd_127x99_ball_carryable", "HMG_M2", false] call ace_crewserved_fnc_canLoadMagazine
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_turret", "_unit", "_carryMag", "_weapon", ["_checkIfEmpty", true]];
TRACE_6("canLoadMagazine",_vehicle,_turret,_unit,_carryMag,_weapon,_checkIfEmpty);

// handle disassembled or deleted
if ((isNull _vehicle) || {(_vehicle distance _unit) > 5}) exitWith {false}; 

private _canLoad = false;

// Verify unit has carry magazine
{
    if (_x == _carryMag) exitWith {_canLoad = true;};
} forEach (magazines _unit);

// Based on setting, only allow reloading if turret is empty of magazines from same family
if (_checkIfEmpty && GVAR(onlyReloadEmpty)) then {
    private _magFamily = if (isArray (configFile >> QGVAR(groups) >> _carryMag >> QGVAR(family))) then {
        getArray (configFile >> QGVAR(groups) >> _carryMag >> QGVAR(family))
    } else {
        [_carryMag]
    };

    scopeName "searchIfLoaded";
    {
        private _carryGroup = configFile >> QGVAR(groups) >> _x;
        TRACE_2("",_x,_carryGroup);
        {
            _x params ["_xMag", "_xTurret", "_xAmmo"];
            if ((_xAmmo > 0) && {_xTurret isEqualTo _turret} && {(getNumber (_carryGroup >> _xMag)) == 1}) then {
                _canLoad = false;
                [LSTRING(removeMagsBeforeReloading)] call EFUNC(common,displayTextStructured);
                breakOut "searchIfLoaded";
            };
        } forEach (magazinesAllTurrets _vehicle);
    } forEach _magFamily;
};

_canLoad
