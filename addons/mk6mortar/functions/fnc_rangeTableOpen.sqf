/*
 * Author: PabstMirror
 *
 * Arguments:
 * Return Value:
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

#define LIST_CHARGE       ((uiNamespace getVariable "ACE_82mm_RangeTable_Dialog") displayCtrl 1501)

_weaponName = "mortar_82mm";

if (dialog) exitWith {ERROR("Dialog Open");};
createDialog "ACE_82mm_RangeTable_Dialog";
if (isNull (uiNamespace getVariable ["ACE_82mm_RangeTable_Dialog", displayNull])) exitWith {ERROR("Dialog failed to open");};

//Get Magazine Types
_magazines = getArray (configFile >> "CfgWeapons" >> _weaponName >> "magazines");

//For now just get settings from first mag, all rounds have same flight characteristics:
if ((count _magazines) < 1) exitWith {ERROR("No Magazines for weapon");};
_initSpeed = getNumber (configFile >> "CfgMagazines" >> (_magazines select 0) >> "initSpeed");

//Get Charge Modes
_fireModes = getArray (configFile >> "CfgWeapons" >> _weaponName >> "modes");

_muzzleVelocities = [];
{
    _showToPlayer = getNumber (configFile >> "CfgWeapons" >> _weaponName >> _x >> "showToPlayer");
    if (_showToPlayer == 1) then {
        _artilleryCharge = getNumber (configFile >> "CfgWeapons" >> _weaponName >> _x >> "artilleryCharge");
        LIST_CHARGE lbAdd format ["%1: %2 [%3m/s]", "Charge", (count _muzzleVelocities), (_initSpeed * _artilleryCharge)];
        LIST_CHARGE lbSetData [(count _muzzleVelocities), str (_artilleryCharge * _initSpeed)];
        _muzzleVelocities pushBack _artilleryCharge;
    };
} forEach _fireModes;

LIST_CHARGE lbSetCurSel 0;
