#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles toggling flashlights on and off.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_irlight_fnc_onLightToggled
 *
 * Public: No
 */

private _isTurnedOn = ACE_player isFlashlightOn primaryWeapon ACE_player
                   || ACE_player isIRLaserOn primaryWeapon ACE_player;
ACE_player setVariable [QGVAR(isTurnedOn), _isTurnedOn];

// This is a surprise tool that will help us later
// Requires: https://feedback.bistudio.com/T170774
/*
deleteVehicle (ACE_player getVariable [QGVAR(glow), objNull]);

if (ACE_player isIRLaserOn currentWeapon ACE_player) then {
    private _offset = [] call FUNC(getGlowOffset);
    private _glow = createSimpleObject [QPATHTOF(data\irglow.p3d), [0, 0, 0]];
    _glow attachTo [ACE_player, _offset, "proxy:\a3\characters_f\proxies\weapon.001", true];
    _glow setObjectTexture [0, "#(rgb,8,8,3)color(0.35,0,0.38,0.1)"];
    _glow setObjectScale 0.1;

    ACE_player setVariable [QGVAR(glow), _glow];
};
*/
