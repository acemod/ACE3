/*
 * Author: KoffeinFlummi and esteldunedain
 * Display the adjustment knobs, update their value and fade them out later
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

private ["_weaponIndex","_adjustment","_layer","_display","_zeroing","_vertical","_horizontal"];

_weaponIndex = [ACE_player, currentWeapon ACE_player] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {};

_adjustment = ACE_player getVariable QGVAR(Adjustment);
if (isNil "_adjustment") then {
    // [Windage, Elevation, Zero]
    _adjustment = [[0,0,0], [0,0,0], [0,0,0]];
};

// Display the adjustment knobs
_layer = [QGVAR(Zeroing)] call BIS_fnc_rscLayer;
_layer cutRsc [QGVAR(Zeroing), "PLAIN", 0, false];

// Find the display
_display = uiNamespace getVariable [QGVAR(ZeroingDisplay), displayNull];
if (isNull _display) exitWith {};

// Update values
_zeroing = _adjustment select _weaponIndex;
_vertical = _display displayCtrl 12;
_horizontal = _display displayCtrl 13;
_vertical ctrlSetText (str (_zeroing select 0));
_horizontal ctrlSetText (str (_zeroing select 1));

// Set the ACE_time when to hide the knobs
GVAR(timeToHide) = ACE_diagTime + 3.0;

if !(isNil QGVAR(fadePFH)) exitWith {};

// Launch a PFH to wait and fade out the knobs
GVAR(fadePFH) = [{

    if (ACE_diagTime >= GVAR(timeToHide)) exitWith {
        private "_layer";
        _layer = [QGVAR(Zeroing)] call BIS_fnc_rscLayer;
        _layer cutFadeOut 2;

        GVAR(fadePFH) = nil;
        [_this select 1] call cba_fnc_removePerFrameHandler;
    };

}, 0.1, []] call CBA_fnc_addPerFrameHandler
