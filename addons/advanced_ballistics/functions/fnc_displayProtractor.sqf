#include "script_component.hpp"
/*
 * Author: Ruthberg
 *
 * Displays a protractor in the top left corner of the screen
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_advanced_ballistics_fnc_displayProtractor
 *
 * Public: No
 */

#define __dsp (uiNamespace getVariable "RscProtractor")
#define __ctrl1 (__dsp displayCtrl 132950)
#define __ctrl2 (__dsp displayCtrl 132951)

if (GVAR(Protractor)) exitWith {
    GVAR(Protractor) = false;
    1 cutText ["", "PLAIN"];
    true
};
if (weaponLowered ACE_player) exitWith { false };
if (vehicle ACE_player != ACE_player) exitWith { false };
if (currentWeapon ACE_player != primaryWeapon ACE_player) exitWith { false };

2 cutText ["", "PLAIN"];
EGVAR(weather,WindInfo) = false;
(["RscWindIntuitive"] call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
GVAR(Protractor) = true;

[{
    params ["","_idPFH"];
    if !(GVAR(Protractor) && !(weaponLowered ACE_player) && currentWeapon ACE_player == primaryWeapon ACE_player) exitWith {
        GVAR(Protractor) = false;
        1 cutText ["", "PLAIN"];
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    1 cutRsc ["RscProtractor", "PLAIN", 1, false];

    __ctrl1 ctrlSetScale 1;
    __ctrl1 ctrlCommit 0;
    __ctrl1 ctrlSetText QPATHTOF(UI\protractor.paa);
    __ctrl1 ctrlSetTextColor [1, 1, 1, 1];

    __ctrl2 ctrlSetScale 1;
    __ctrl2 ctrlSetPosition [SafeZoneX + 0.001, SafeZoneY - 0.001 - 0.1074 * (-0.86 max ((ACE_player weaponDirection currentWeapon ACE_player) select 2) min 0.86), 0.2, 0.2 * 4/3];
    __ctrl2 ctrlCommit 0;
    __ctrl2 ctrlSetText QPATHTOF(UI\protractor_marker.paa);
    __ctrl2 ctrlSetTextColor [1, 1, 1, 1];

}, 0.1, []] call CBA_fnc_addPerFrameHandler;

true
