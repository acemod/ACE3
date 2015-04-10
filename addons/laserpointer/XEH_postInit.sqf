// by commy2
#include "script_component.hpp"

// fixes laser when being captured. Needed, because the selectionpsoition of the right hand is used
["SetHandcuffed", {if (_this select 1) then {(_this select 0) action ["GunLightOff", _this select 0]};}] call EFUNC(common,addEventHandler);

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
