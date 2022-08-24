#include "script_component.hpp"
["MouseButtonUp", LINKFUNC(onMouseButtonUp)] call CBA_fnc_addDisplayHandler;
GVAR(mouseLeft) = false;
GVAR(mouseRight) = false;

GVAR(cancel) = false;
GVAR(canAttach) = false;

[QGVAR(ropeAttachTo), {
    params ["_child", "_relativeAttachPos", "_rope", "_helper"];
    TRACE_4("ropeAttachTo",_child,_relativeAttachPos,_rope,_helper);
    _helper ropeDetach _rope;
    [_child, _relativeAttachPos] ropeAttachTo _rope;
    deleteVehicle _helper;
}] call CBA_fnc_addEventHandler;

[QGVAR(attachVehicles), LINKFUNC(attachVehicles)] call CBA_fnc_addEventHandler;
[QGVAR(detachChild), LINKFUNC(detachChild)] call CBA_fnc_addEventHandler;

if (!isServer) exitWith {};

[QGVAR(cleanupParent), {
    params ["_parent"];
    TRACE_1("cleanupParent",_parent);
    _parent removeEventHandler ["RopeBreak", _parent getVariable QGVAR(RopeBreakEHID)];
    _parent setVariable [QGVAR(RopeBreakEHID), -1];
    private _parentParentHooks = _parent getVariable [QGVAR(parentHooks), []];
    if (_parentParentHooks isEqualTo []) then {
        TRACE_1("remove Deleted EH",_parent);
        _parent removeEventHandler ["Deleted", _parent getVariable QGVAR(DeletedEHID)];
        _parent setVariable [QGVAR(DeletedEHID), -1];
    };
}] call CBA_fnc_addEventHandler;
