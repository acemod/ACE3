#include "script_component.hpp"

// Delay between state runs
#define DELAY 1
#define DEFAULT_STATE [0, "Default", {}, {}, {}, []]

GVAR(monitoredUnitsList) = [];
GVAR(monitoredUnitsListIsSorted) = false;

[{
    params ["_args", "_pfhId"];

    if (!GVAR(monitoredUnitsListIsSorted)) then {
        GVAR(monitoredUnitsList) sort true;
        GVAR(monitoredUnitsListIsSorted) = true;
    };

    private _delete = false;
    private _exit = false;
    {
       _x params ["_unit"];

       if (!isNull _unit && alive _unit) then {
           private _unitState = _unit getvariable [QGVAR(state), [CBA_missionTime, DEFAULT_STATE]];
           _unitState params ["_lastTime", "_state"];

           if ((_lastTime + DELAY) > CBA_missionTime) exitWith {_exit = true;};
           _state params ["_name", "_handler", "_onEntry", "_onExit", "_transitions"];
           _unitState set [0, CBA_missionTime];

           _unit setvariable [QGVAR(state), _unitState];

           [_unit, _name, _lastTime] call _handler;
       } else {
           _delete = true;
           GVAR(monitoredUnitsList) set [_forEachIndex, objNull];
       };
       if (_exit) exitWith {};
    } forEach GVAR(monitoredUnitsList);

   if (_delete) then {
       GVAR(monitoredUnitsList) = GVAR(monitoredUnitsList) - [objNull];
   };
}, 0, []] call CBA_fnc_addPerFrameHandler;
