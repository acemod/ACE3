// by PabstMirror, commy2
#include "script_component.hpp"

[{_this call DFUNC(handleScrollWheel)}] call EFUNC(common,addScrollWheelEventHandler);

if (isNil "ACE_maxWeightDrag") then {
    ACE_maxWeightDrag = 800;
};

if (isNil "ACE_maxWeightCarry") then {
    ACE_maxWeightCarry = 600;
};

["isNotDragging", {!((_this select 0) getVariable [QGVAR(isDragging), false])}] call EFUNC(common,addCanInteractWithCondition);
["isNotCarrying", {!((_this select 0) getVariable [QGVAR(isCarrying), false])}] call EFUNC(common,addCanInteractWithCondition);

// release object on player change. This does work when returning to lobby, but not when hard disconnecting.
["playerChanged", {
    private ["_newPlayer", "_oldPlayer"];

    _newPlayer = _this select 0;
    _oldPlayer = _this select 1;

    {
        if (_x getVariable [QGVAR(isDragging), false]) then {
            [_x, _x getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject);
        };
    } forEach [_newPlayer, _oldPlayer];
}] call EFUNC(common,addEventhandler);
