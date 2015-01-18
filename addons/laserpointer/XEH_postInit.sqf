// by commy2
#include "script_component.hpp"

if !(hasInterface) exitWith {};

GVAR(nearUnits) = [];

// @todo. Maybe move to common?
[{
    private "_nearUnits";
    _nearUnits = nearestObjects [positionCameraToWorld [0,0,0], ["CAManBase"], 50];

    if (count _nearUnits > 10) then {
        _nearUnits resize 10;
    };

    GVAR(nearUnits) = _nearUnits;

} , 5, []] call CBA_fnc_addPerFrameHandler;

addMissionEventHandler ["Draw3D", {
    call FUNC(onDraw);
}];
