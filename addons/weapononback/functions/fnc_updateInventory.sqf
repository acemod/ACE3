#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Updates the inventory display by hiding / showing the weapon on the back.
 *
 * Arguments:
 * 0: Inventory display (optional, for UI EH) <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params [["_display", findDisplay IDD_INVENTORY]];
if (isNull _display) exitWith {};

private _weaponHolder = ACE_player getVariable [QGVAR(weaponHolder), objNull];
private _hasWeaponOnBack = !isNull _weaponHolder;

// Hide attachment slots if player has weapon on their back
{
    private _ctrl = _display displayCtrl _x;
    _ctrl ctrlSetFade ([0, 1] select _hasWeaponOnBack);
    _ctrl ctrlCommit 0;
} forEach IDCS_SECONDARY_ATTACHMENTS;

// Show/hide image of weapon on back
private _imgContainer = _display displayCtrl IDC_WEAPON_IMAGE;
private _secondarySlot = _display displayCtrl IDC_SECONDARY_SLOT;

_imgContainer ctrlSetPosition ctrlPosition _secondarySlot;
_imgContainer ctrlSetBackgroundColor [1, 1, 1, 0];
if (_hasWeaponOnBack) then {
    private _weapon = (weaponCargo _weaponHolder)#0;
    _imgContainer ctrlSetText getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
} else {
    _imgContainer ctrlSetText "";
};
_imgContainer ctrlCommit 0;
