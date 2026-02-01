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
    1 cutText ["", "PLAIN"];
    true // return
};

if (weaponLowered ACE_player || !isNull objectParent ACE_player || currentWeapon ACE_player != primaryWeapon ACE_player) exitWith {
    false // return
};

2 cutText ["", "PLAIN"];
EGVAR(weather,WindInfo) = false;
(["RscWindIntuitive"] call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
GVAR(protractor) = true;

[{
    disableSerialization;

    params ["", "_idPFH"];

    private _currentWeapon = currentWeapon ACE_player;

    if (!GVAR(protractor) || weaponLowered ACE_player || _currentWeapon != primaryWeapon ACE_player) exitWith {
        GVAR(protractor) = false;
        1 cutText ["", "PLAIN"];
        _idPFH call CBA_fnc_removePerFrameHandler;
    };

    1 cutRsc ["RscProtractor", "PLAIN", 1, false];

    private _display = uiNamespace getVariable QGVAR(rscProtractor);
    private _ctrl1 = _display displayCtrl 132950;

    _ctrl1 ctrlSetScale 1;
    _ctrl1 ctrlCommit 0;
    _ctrl1 ctrlSetText QPATHTOF(UI\protractor.paa);
    _ctrl1 ctrlSetTextColor [1, 1, 1, 1];

    private _ctrl2 = _display displayCtrl 132951;

    _ctrl2 ctrlSetScale 1;
    _ctrl2 ctrlSetPosition [safeZoneX + 0.001, safeZoneY - 0.001 - 0.1074 * (-0.86 max ((ACE_player weaponDirection _currentWeapon) select 2) min 0.86), 0.2, 0.2 * 4/3];
    _ctrl2 ctrlCommit 0;
    _ctrl2 ctrlSetText QPATHTOF(UI\protractor_marker.paa);
    _ctrl2 ctrlSetTextColor [1, 1, 1, 1];
}, 0.1] call CBA_fnc_addPerFrameHandler;

true // return
