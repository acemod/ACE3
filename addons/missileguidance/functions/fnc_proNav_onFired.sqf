#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets up proportional navigation state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_proNav_onFired
 *
 * Public: No
 */
params ["_firedEH"];
_firedEH params ["","","","","","","_projectile"];

private _ammoConfig = configOf _projectile;
private _navigationGain = getNumber (_ammoConfig >> QUOTE(ADDON) >> "navigationGain");
if (_navigationGain == 0) then {
    _navigationGain = 3;
};

private _navigationParams = [
    [   // Last Missile Frame
        [0, 0, 0]   // Last line of sight
    ],
    _navigationGain // navigation gain of missile. Set in the navigation onFired function
];
_navigationParams
