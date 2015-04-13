// by commy2
#include "script_component.hpp"

// fixes laser when being captured. Needed, because the selectionpsoition of the right hand is used
["SetHandcuffed", {if (_this select 1) then {(_this select 0) action ["GunLightOff", _this select 0]};}] call EFUNC(common,addEventHandler);

if !(hasInterface) exitWith {};

GVAR(nearUnits) = [];

// @todo. Maybe move to common?
[{
    private "_nearUnits";
    _nearUnits = nearestObjects [positionCameraToWorld [0,0,0], ["CAManBase"], 50]; // when moving this, search also for units inside vehicles. currently breaks the laser in FFV

    if (count _nearUnits > 10) then {
        _nearUnits resize 10;
    };

    GVAR(nearUnits) = _nearUnits;

} , 5, []] call CBA_fnc_addPerFrameHandler;

addMissionEventHandler ["Draw3D", {
    call FUNC(onDraw);
}];

// init keybinds
["ACE3", QGVAR(switchLaserLightMode), localize "STR_ACE_Laserpointer_switchLaserLight",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    [ACE_player, currentWeapon ACE_player] call FUNC(switchLaserLightMode);
    true
},
{false}, [38, [false, true, false]], false] call CBA_fnc_addKeybind;
