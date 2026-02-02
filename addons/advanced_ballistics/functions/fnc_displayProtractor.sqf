#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Displays a protractor in the top left corner of the screen.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * If the key stroke was handled <BOOL>
 *
 * Example:
 * [] call ace_advanced_ballistics_fnc_displayProtractor
 *
 * Public: No
 */

if (GVAR(protractor)) exitWith {
    GVAR(protractor) = false;
    QGVAR(protractor) cutText ["", "PLAIN"];
    true // return
};

if (weaponLowered ACE_player || !isNull objectParent ACE_player || currentWeapon ACE_player != primaryWeapon ACE_player) exitWith {
    false // return
};

// Close weather's wind info, in case it's open
EGVAR(weather,WindInfo) = false;
(["RscWindIntuitive"] call BIS_fnc_rscLayer) cutText ["", "PLAIN"];

// Display the protractor
GVAR(protractor) = true;
QGVAR(protractor) cutRsc ["RscProtractor", "PLAIN", 1, false];

// Update angle marker every frame
[{
    private _currentWeapon = currentWeapon ACE_player;

    if (!GVAR(protractor) || weaponLowered ACE_player || _currentWeapon != primaryWeapon ACE_player) exitWith {
        (_this select 1) call CBA_fnc_removePerFrameHandler;
        GVAR(protractor) = false;
        QGVAR(protractor) cutText ["", "PLAIN"];
    };

    disableSerialization;

    private _ctrlMarker = (uiNamespace getVariable QGVAR(rscProtractor)) displayCtrl 132951;

    _ctrlMarker ctrlSetPosition [safeZoneX + 0.001, safeZoneY - 0.001 - 0.1074 * (-0.86 max ((ACE_player weaponDirection _currentWeapon) select 2) min 0.86), 0.2, 0.2 * 4/3];
    _ctrlMarker ctrlCommit 0;
}] call CBA_fnc_addPerFrameHandler;

true // return
