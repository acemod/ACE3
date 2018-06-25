#include "script_component.hpp"
/*
 * Author: bux, commy2
 * Hide or show the secondary weapon magazine inventory slot to prevent unloading of dummy magazines.
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_disposable_fnc_updateInventoryDisplay;
 *
 * Public: No
 */

disableSerialization;
params ["_player", ["_display",(findDisplay 602),[displayNull]]];
TRACE_2("params",_player,_display);

_player removeMagazines "ACE_PreloadedMissileDummy";
_player removeMagazines "ACE_FiredMissileDummy";

if (isNull _display) exitWith {};

private _launcher = secondaryWeapon _player;

if (_launcher == "" || {getText (configFile >> "CfgWeapons" >> _launcher >> "ACE_UsedTube") == ""}) then {
    private _control = _display displayCtrl 627;
    private _config = configFile >> "RscDisplayInventory" >> "controls" >> "SlotSecondaryMagazine";
    _control ctrlSetPosition [getNumber (_config >> "x"), getNumber (_config >> "y"), getNumber (_config >> "w"), getNumber (_config >> "h")];
    _control ctrlCommit 0;

    _control = _display displayCtrl 1251;
    _config = configFile >> "RscDisplayInventory" >> "controls" >> "BackgroundSlotSecondaryMagazine";
    _control ctrlSetPosition [getNumber (_config >> "x"), getNumber (_config >> "y"), getNumber (_config >> "w"), getNumber (_config >> "h")];
    _control ctrlCommit 0;
} else {
    private _control = _display displayCtrl 627;
    _control ctrlSetPosition [0, 0, 0, 0];
    _control ctrlCommit 0;

    _control = _display displayCtrl 1251;
    _control ctrlSetPosition [0, 0, 0, 0];
    _control ctrlCommit 0;
};
