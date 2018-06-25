#include "script_component.hpp"
/*
 * Author: joko // Jonas, Emperias, Zigomarvin
 * Detect if the player and play the Gesture Animation
 *
 * Arguments:
 * Animation <STRING>
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * "GeniusAnimation" call ace_gestures_fnc_playSignal
 *
 * Public: No
 */

TRACE_1("params",_this);

if (GVAR(showOnInteractionMenu) == 0) exitWith {false};
if !([ACE_player, objNull, ["isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};

private _gesture = if ((_this select [0,2]) == "BI") then {
    //If it starts with BI, just strip off the leading BI and use it directly
    _this select [2]
} else {
    //Adjust gesture based on stance:
    if (((animationState ACE_player) select [0, 12]) in ["amovpercmstp", "amovpercmwlk", "amovpercmtac"] && weaponLowered ACE_player) then {
        format ["%1StandLowered", _this]
    } else {
        _this
    };
};

TRACE_1("playing gesture",_gesture);
[ACE_player, _gesture] call EFUNC(common,doGesture);
true
