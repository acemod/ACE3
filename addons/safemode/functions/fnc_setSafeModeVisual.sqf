#include "..\script_component.hpp"
/*
 * Author: commy2
 * Shows firemode indicator, representing safety lock.
 *
 * Arguments:
 * 0: Show firemode <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * true call ace_safemode_fnc_setSafeModeVisual
 *
 * Public: No
 */

params ["_show"];

disableSerialization;

private _control = (uiNamespace getVariable ["ACE_dlgSoldier", displayNull]) displayCtrl 187;

if (isNull _control) exitWith {};

if (_show) then {
    private _config = configFile >> "RscInGameUI" >> "RscUnitInfoSoldier" >> "WeaponInfoControlsGroupLeft" >> "controls" >> "CA_ModeTexture";

    _control ctrlSetPosition [getNumber (_config >> "x"), getNumber (_config >> "y"), getNumber (_config >> "w"), getNumber (_config >> "h")];
} else {
    _control ctrlSetPosition [0, 0, 0, 0];
};

_control ctrlCommit 0;
