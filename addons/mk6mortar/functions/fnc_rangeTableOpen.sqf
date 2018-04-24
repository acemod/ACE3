/*
 * Author: PabstMirror
 * Opens the rangetable and fills the charge listbox.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_mk6mortar_fnc_rangeTableOpen
 *
 * Public: No
 */
#include "script_component.hpp"

#define LIST_CHARGE ((uiNamespace getVariable "ACE_82mm_RangeTable_Dialog") displayCtrl 1501)

private _weaponName = "mortar_82mm"; //todo: work on other weapons

createDialog "ACE_82mm_RangeTable_Dialog";
if (isNull (uiNamespace getVariable ["ACE_82mm_RangeTable_Dialog", displayNull])) exitWith {ERROR("Dialog failed to open");};

//Get Magazine Types
private _magazines = getArray (configFile >> "CfgWeapons" >> _weaponName >> "magazines");

//For now just get settings from first mag, all rounds have same flight characteristics:
if ((count _magazines) < 1) exitWith {ERROR("No Magazines for weapon");};
private _initSpeed = getNumber (configFile >> "CfgMagazines" >> (_magazines select 0) >> "initSpeed");

//Get Charge Modes
private _fireModes = getArray (configFile >> "CfgWeapons" >> _weaponName >> "modes");

private _muzzleVelocities = [];
{
    private _showToPlayer = getNumber (configFile >> "CfgWeapons" >> _weaponName >> _x >> "showToPlayer");
    if (_showToPlayer == 1) then {
        private _artilleryCharge = getNumber (configFile >> "CfgWeapons" >> _weaponName >> _x >> "artilleryCharge");
        LIST_CHARGE lbAdd format ["%1: %2", (localize LSTRING(rangetable_charge)), (count _muzzleVelocities)];
        LIST_CHARGE lbSetData [(count _muzzleVelocities), str (_artilleryCharge * _initSpeed)];
        _muzzleVelocities pushBack _artilleryCharge;
    };
} forEach _fireModes;

LIST_CHARGE lbSetCurSel 0;
