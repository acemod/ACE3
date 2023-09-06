#include "script_component.hpp"
#include "\z\ace\addons\arsenal\defines.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

enableSaving [false, false];
cba_diagnostic_projectileMaxLines = 10;

[QGVAR(displayOpened), {
    private _player = player;

    // Player pose
    [{
        switch (true) do {
            case (primaryWeapon _this != ""): {
                _this switchMove "amovpercmstpslowwrfldnon";
            };
            case (handgunWeapon _this != ""): {
                _this switchMove "amovpercmstpslowwpstdnon";
            };
            default {
                _this switchMove "amovpercmstpsnonwnondnon";
            };
        };
    }, _player] call CBA_fnc_execNextFrame;

    // Hide everything except the player
    {
        _x enableSimulation false;
        _x hideObject true;
    } forEach (allMissionObjects "" - [_player] - attachedObjects _player);

    if ((_player getVariable ["CBA_projectile_firedEhId", -1]) != -1) then {
        _player call CBA_fnc_removeUnitTrackProjectiles;
    };

    _player setFatigue 0;

    // Esc to close mission
    {
        private _display = findDisplay IDD_ace_arsenal;

        _display displayAddEventHandler ["KeyDown", {
            params ["_display", "_key", "_shift"];

            if (_key isEqualTo DIK_ESCAPE && {!_shift}) then {
                [_display] spawn {
                    disableSerialization;

                    params ["_display"];

                    private _return = [
                        localize "str_sure",
                        localize "str_a3_rscdisplaymain_buttonexit",
                        true, true,
                        _display, false, true
                    ] call BIS_fnc_GUImessage;

                    if (_return) then {
                        // Save loadout for next time arsenal mission is played
                        profileNamespace setVariable [QGVAR(missionLastLoadout), [player] call CBA_fnc_getLoadout];

                        // Quit mission
                        _display closeDisplay IDC_CANCEL;
                        findDisplay IDD_MISSION closeDisplay 0;
                    };
                };

                true
            };
        }];

        (_display displayCtrl IDC_menuBarClose) ctrlSetText localize "str_a3_rscdisplayarsenal_buttonok";
    } call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;

[QGVAR(displayClosed), {
    private _player = player;

    // Unhide everthing
    {
        _x enableSimulation true;
        _x hideObject false;
    } forEach allMissionObjects "";

    private _unit = objNull,

    // Update VR unit gear
    {
        _unit = _x;

        if (vest _player != "") then { _unit addVest vest _player; };

        removeBackpack _unit;
        if (backpack _player != "") then { _unit addBackpack backpack _player; };
        removeHeadgear _unit;
        if (headgear _player != "") then { _unit addHeadgear headgear _player; };
        removeGoggles _unit;
        if (goggles _player != "") then { _unit addGoggles goggles _player; };

        removeAllWeapons _unit;
        if (primaryWeapon _player != "") then { _unit addWeapon primaryWeapon _player; };

        {
            _unit addPrimaryWeaponItem _x;
        } forEach primaryWeaponItems _player;

        if (secondaryWeapon _player != "") then { _unit addWeapon secondaryWeapon _player; };

        {
            _unit addSecondaryWeaponItem _x;
        } forEach secondaryWeaponItems _player;

        if (handgunWeapon _player != "") then { _unit addWeapon handgunWeapon _player; };

        {
            _unit addHandgunItem _x;
        } forEach handgunItems _player;
    } forEach (entities [["B_Soldier_VR_F", "O_Soldier_VR_F", "I_Soldier_VR_F"], [], true]);

    _player call CBA_fnc_addUnitTrackProjectiles;
}] call CBA_fnc_addEventHandler;
