/*
 * Author: Garth 'L-H' de Wet
 * Checks for nearby running helicopters (within 15m)
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Radius to check for helicopter Default: 15 (optional) <NUMBER>
 *
 * Return Value:
 * <ARRAY>:
 *     0: In rotorwash <BOOL>
 *     1: Amount of rotor wash. <NUMBER>
 *
 * Example:
 * if (([player, 10] call ace_goggles_fnc_isInRotorWash) select 0) then { hint "Rotor wash"; };
 * if (([player] call ace_goggles_fnc_isInRotorWash) select 0) then { hint "Rotor wash"; };
 *
 * Public: Yes
 */
#include "script_component.hpp"
private ["_heli", "_unit", "_result", "_radius"];
_unit = _this select 0;
_radius = 15;
if (count _this > 1) then {
    _radius = _this select 1;
};
_result = [false, _radius + 2];

_heli = (getPosATL _unit) nearEntities [["Helicopter"], _radius];
{
    if !(_x isKindOf "ParachuteBase") then {
        if (isEngineOn _x) then {
            private "_distance";
            _distance = (_radius - (_unit distance _x));
            if (_distance != 0) then {
                _distance = _distance / _radius;
            };
            if (_distance < (_result select 1)) then {
                _result = [true, _distance];
            };
        };
    };
    false
} count _heli;

_result
