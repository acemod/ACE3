#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Initializes the item context menu for the DBAL.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_irlight_fnc_initItemContextMenu
 *
 * Public: No
 */

{
    _x params ["_variant", "_displayName"];

    [
        "ACE_DBAL_A3_Red", "POINTER", _displayName, [], "", {
            params ["", "", "_item", "", "_variant"];

            private _baseClass = getText (configFile >> "CfgWeapons" >> _item >> "baseWeapon");
            _item != _baseClass + _variant
        }, {
            params ["", "", "_item", "", "_variant"];

            private _baseClass = getText (configFile >> "CfgWeapons" >> _item >> "baseWeapon");

            ACE_player removePrimaryWeaponItem _item;
            ACE_player addPrimaryWeaponItem (_baseClass + _variant);
            playSound "click";

            if (_turnedOn) then {
                // Force update of flashlight
                ACE_player action ["GunLightOff", ACE_player];

                {
                    ACE_player action ["GunLightOn", ACE_player];
                    ACE_player action ["IRLaserOn", ACE_player];
                } call CBA_fnc_execNextFrame;
            };
        }, false, _variant
    ] call CBA_fnc_addItemContextMenuOption;
} forEach [
    ["", LSTRING(Mode_IRDual)],
    ["_IP", LSTRING(Mode_IRPointer)],
    ["_II", LSTRING(Mode_IRIlluminator)],
    ["_VP", LSTRING(Mode_VisiblePointer)]
];
