#include "script_component.hpp"

[QGVAR(9m14_joystick), "fired", LINKFUNC(onFired)] call CBA_fnc_addClassEventHandler;
[QGVAR(9m14), "fired", LINKFUNC(onLauncherFired)] call CBA_fnc_addClassEventHandler;

[QGVAR(9m14_joystick), "init", LINKFUNC(initJoystick), true, [], true] call CBA_fnc_addClassEventHandler;
[QGVAR(9m14), "init", LINKFUNC(initSuitcase), true, [], true] call CBA_fnc_addClassEventHandler;
["MouseButtonDown", LINKFUNC(onMouseButtonDown)] call CBA_fnc_addDisplayHandler;

if (hasInterface) then {
    ["vehicle", {
        params ["_unit","_vehicle"];
        TRACE_2("vehicle change",_vehicle,typeOf _vehicle);
        if (!(_vehicle isKindOf QGVAR(9m14_joystick))) exitWith {};

        // transfer locality of connected units
        private _connectedUnits = _vehicle getVariable QGVAR(plugStatus);
        {
            if (_x isNotEqualTo objNull) then {
                ["ace_setOwner", [_x, clientOwner]] call CBA_fnc_serverEvent;
                _x setVariable [QGVAR(owner), _unit];
            };
        } forEach _connectedUnits;

    }, true] call CBA_fnc_addPlayerEventHandler;
};

