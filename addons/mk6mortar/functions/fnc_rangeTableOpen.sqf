#include "script_component.hpp"
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

TRACE_1("rangeTableOpen - defer to artillerytables",_this);

createDialog "ACE_82mm_RangeTable_Dialog";
if (isNull (uiNamespace getVariable ["ACE_82mm_RangeTable_Dialog", displayNull])) exitWith {ERROR("Dialog failed to open");};
if (GVAR(useChargeSystem)) then {
    private _weaponName = "ACE_mortar_82mm_no_charges"; //todo: work on other weapons

    //Get Magazine Types
    private _magazines = getArray (configFile >> "CfgWeapons" >> _weaponName >> "magazines");

    if ((count _magazines) < 1) exitWith {ERROR("No Magazines for weapon");};

    private _muzzleVelocities = [];

    // Find all the base magazines with charges, store the velocity of the base magazine and each of their child charges
    {
        private _baseCharge  = getNumber(configFile >> "CfgMagazines" >> _x >> QGVAR(baseCharge));
        if (_baseCharge == 1) then {
            private _childCharges = getArray(configFile >> "CfgMagazines" >> _x >> QGVAR(charges));
            private _magName = getText (configFile >> "CfgMagazines" >> _x >> "displayNameShort");
            private _initSpeed = getNumber (configFile >> "CfgMagazines" >> _x >> "initSpeed");

            LIST_CHARGE lbAdd _magName;
            LIST_CHARGE lbSetData [(count _muzzleVelocities), str (_initSpeed)];
            _muzzleVelocities pushBack _initSpeed;

            {
                private _childMagName = getText (configFile >> "CfgMagazines" >> _x select 0 >> "displayNameShort");
                private _childInitSpeed = getNumber (configFile >> "CfgMagazines" >> _x select 0 >> "initSpeed");

                LIST_CHARGE lbAdd _childMagName;
                LIST_CHARGE lbSetData [(count _muzzleVelocities), str (_childInitSpeed)];
                _muzzleVelocities pushBack _childInitSpeed;
            } forEach _childCharges;
        }
    } forEach _magazines;
} else {
    private _weaponName = "mortar_82mm"; //todo: work on other weapons

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
};
LIST_CHARGE lbSetCurSel 0
