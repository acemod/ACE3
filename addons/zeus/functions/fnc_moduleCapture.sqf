/*
 * Author: SilentSpike
 * Flips the capture state of the unit the module is attached to.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * ReturnValue:
 * nil
 *
 * Public: no
 */

#include "script_component.hpp"

PARAMS_3(_logic,_units,_activated);
private ["_unit","_captive"];

if (!_activated) exitWith {};

if (isNil QEFUNC(captives,setHandcuffed)) then {
    ["Requires ACE_Captives"] call EFUNC(common,displayTextStructured);
} else {
    _unit = attachedTo _logic;

    if (isNull _unit) then {
        ["Place on a unit"] call EFUNC(common,displayTextStructured);
    } else {
        if !(_unit isKindOf "CAManBase") then {
            ["Unit must be infantry"] call EFUNC(common,displayTextStructured);
        } else {
            if !(alive _unit) then {
                ["Unit must be alive"] call EFUNC(common,displayTextStructured);
            } else {
                _captive = GETVAR(_unit,EGVAR(captives,isHandcuffed),false);
                // Event initalized by ACE_Captives
                ["SetHandcuffed", _unit, [_unit, !_captive]] call EFUNC(common,targetEvent);
            };
        };
    };
};

deleteVehicle _logic;
