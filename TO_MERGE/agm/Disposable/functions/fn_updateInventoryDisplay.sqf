/*
 * Author: bux, commy2
 *
 * Hide or show the secondary weapon magazine inventory slot to prevent unloading of dummy magazines.
 * 
 * Argument:
 * 0: The player. (Object)
 * 
 * Return value:
 * Nothing
 */

private ["_player", "_display"];

_player = _this select 0;

_player removeMagazines "AGM_PreloadedMissileDummy";
_player removeMagazines "AGM_FiredMissileDummy";

disableSerialization;
_display = _this select 1;

if (isNull _display) exitWith {};

private ["_launcher", "_control", "_config"];

_launcher = secondaryWeapon _player;

if (_launcher == "" || {getText (configFile >> "CfgWeapons" >> _launcher >> "AGM_UsedTube") == ""}) then {
  _control = _display displayCtrl 627;
  _config = configFile >> "RscDisplayInventory" >> "controls" >> "SlotSecondaryMagazine";
  _control ctrlSetPosition [getNumber (_config >> "x"), getNumber (_config >> "y"), getNumber (_config >> "w"), getNumber (_config >> "h")];
  _control ctrlCommit 0;

  _control = _display displayCtrl 1251;
  _config = configFile >> "RscDisplayInventory" >> "controls" >> "BackgroundSlotSecondaryMagazine";
  _control ctrlSetPosition [getNumber (_config >> "x"), getNumber (_config >> "y"), getNumber (_config >> "w"), getNumber (_config >> "h")];
  _control ctrlCommit 0;
} else {
  _control = _display displayCtrl 627;
  _control ctrlSetPosition [0, 0, 0, 0];
  _control ctrlCommit 0;

  _control = _display displayCtrl 1251;
  _control ctrlSetPosition [0, 0, 0, 0];
  _control ctrlCommit 0;
};
