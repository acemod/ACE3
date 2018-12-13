#include "script_component.hpp"
/*
 * Author: Glowbal
 * Load a person, local
 *
 * Arguments:
 * 0: unit to be loaded <OBJECT>
 * 1: vehicle that will beloaded <OBJECT>
 * 2: caller that will load <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, car, kevin] call ace_common_fnc_loadPersonLocal
 *
 * Public: Yes
 */

params ["_unit", "_vehicle", "_caller"];

// if (!alive _unit) then {
// _unit = [_unit, _caller] call makeCopyOfBody; //func does not exist
// };

private _slotsOpen = false;

if (_vehicle emptyPositions "cargo" > 0) then {
    _unit moveInCargo _vehicle;
    _slotsOpen = true;
} else {
    if (_vehicle emptyPositions "gunner" > 0) then {
        _unit moveInGunner _vehicle;
        _slotsOpen = true;
    };
};

if (_slotsOpen) then {
    private _loaded = _vehicle getVariable [QGVAR(loaded_persons),[]];
    _loaded pushBack _unit;

    _vehicle setVariable [QGVAR(loaded_persons), _loaded, true];

    if !([_unit] call FUNC(isAwake)) then {
        [{
            (_this select 0) params ["_unit", "_vehicle"];

            // wait until the unit is in the vehicle
            if (vehicle _unit != _vehicle) exitWith {
                // kill this pfh if either one is deleted
                if (isNull _unit || isNull _vehicle) then {
                    [_this select 1] call CBA_fnc_removePerFrameHandler;
                };
            };

            _unit setVariable [QEGVAR(medical,vehicleAwakeAnim), [_vehicle, animationState _unit]];

            [_unit, [_unit] call FUNC(getDeathAnim), 1, true] call FUNC(doAnimation);

            [_this select 1] call CBA_fnc_removePerFrameHandler;
        }, 0.5, [_unit, _vehicle]] call CBA_fnc_addPerFrameHandler;
    };
};
