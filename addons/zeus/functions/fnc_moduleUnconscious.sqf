/*
 * Author: SilentSpike
 * Flips the unconscious state of the unit the module is attached to.
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
private ["_unit","_conscious"];

if (!_activated) exitWith {};

if (isNil QEFUNC(medical,setUnconscious)) then {
    ["STR_ACE_Zeus_RequiresAddon"] call EFUNC(common,displayTextStructured);
} else {
    _unit = attachedTo _logic;

    if (isNull _unit) then {
        ["STR_ACE_Zeus_NothingSelected"] call EFUNC(common,displayTextStructured);
    } else {
        if !(_unit isKindOf "CAManBase") then {
            ["STR_ACE_Zeus_OnlyInfantry"] call EFUNC(common,displayTextStructured);
        } else {
            if !(alive _unit) then {
                ["STR_ACE_Zeus_OnlyAlive"] call EFUNC(common,displayTextStructured);
            } else {
                _conscious = GETVAR(_unit,ACE_isUnconscious,false);
                // Function handles locality for me
                [_unit, !_conscious, round(random(10)+5), true] call EFUNC(medical,setUnconscious);
            };
        };
    };
};

deleteVehicle _logic;
