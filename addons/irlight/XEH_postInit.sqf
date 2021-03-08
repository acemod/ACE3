#include "script_component.hpp"

{
    _x params ["_variant", "_displayName"];

    [
        "ACE_DBAL_A3_Red", "POINTER", _displayName, [], "", {
            params ["", "", "_item", "", "_variant"];

            private _baseClass = if (_item select [0, 15] == "ACE_DBAL_A3_Red") then {
                "ACE_DBAL_A3_Red"
            } else {
                "ACE_DBAL_A3_Green"
            };

            _item != _baseClass + _variant
        }, {
            params ["", "", "_item", "", "_variant"];

            private _baseClass = if (_item select [0, 15] == "ACE_DBAL_A3_Red") then {
                "ACE_DBAL_A3_Red"
            } else {
                "ACE_DBAL_A3_Green"
            };

            private _turnedOn = ACE_player isFlashlightOn primaryWeapon ACE_player
                             || ACE_player isIRLaserOn primaryWeapon ACE_player;

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
