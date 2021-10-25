#include "script_component.hpp"
/*
 * Author: mharis001, PabstMirror
 * Returns the remaining water in a source.
 *
 * Arguments:
 * 0: Water source <OBJECT>
 *
 * Return Value:
 * Remaining water <NUMBER>
 *
 * Example:
 * [_source] call ace_field_rations_fnc_getRemainingWater
 *
 * Public: Yes
 */

params [["_source", objNull, [objNull]]];

if (!alive _source) exitWith {0};

private _water = _source getVariable QGVAR(currentWaterSupply);

if (isNil "_water") then {
    private _typeOf = typeOf _source;
    if (_typeOf != "") then {
        // Check for waterSupply entry since we have valid typeOf
        _water = getNumber (configFile >> "CfgVehicles" >> _typeOf >> QXGVAR(waterSupply));
        if (_water == 0) then {_water = REFILL_WATER_DISABLED};

        if (_water != REFILL_WATER_DISABLED) then {
            if (_source call CBA_fnc_isTerrainObject) then {
                _water = REFILL_WATER_INFINITE;
            } else {
                _source setVariable [QGVAR(currentWaterSupply), _water, true];
            };
        };
    } else {
        // Check the p3d name against list
        _water = if ((getModelInfo _source select 0) in GVAR(waterSourceP3ds)) then {REFILL_WATER_INFINITE} else {REFILL_WATER_DISABLED};
    };
};

_water
