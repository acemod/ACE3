/*
 * Author: SilentSpike
 * Flips the surrender state of the unit the module is placed on.
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
private ["_mouseOver","_unit","_surrendering"];

if !(_activated && local _logic) exitWith {};

if (isNil QEFUNC(captives,setSurrendered)) then {
    [LSTRING(RequiresAddon)] call EFUNC(common,displayTextStructured);
} else {
    _mouseOver = GETMVAR(bis_fnc_curatorObjectPlaced_mouseOver,[""]);

    if ((_mouseOver select 0) != "OBJECT") then {
        [LSTRING(NothingSelected)] call EFUNC(common,displayTextStructured);
    } else {
        _unit = effectivecommander (_mouseOver select 1);

        if !(_unit isKindOf "CAManBase") then {
            [LSTRING(OnlyInfantry)] call EFUNC(common,displayTextStructured);
        } else {
            if !(alive _unit) then {
                [LSTRING(OnlyAlive)] call EFUNC(common,displayTextStructured);
            } else {
                if (GETVAR(_unit,EGVAR(captives,isHandcuffed),false)) then {
                    [LSTRING(OnlyNonCaptive)] call EFUNC(common,displayTextStructured);
                } else {
                    _surrendering = GETVAR(_unit,EGVAR(captives,isSurrendering),false);
                    // Event initalized by ACE_Captives
                    ["SetSurrendered", _unit, [_unit, !_surrendering]] call EFUNC(common,targetEvent);
                };
            };
        };
    };
};

deleteVehicle _logic;
