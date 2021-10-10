#include "script_component.hpp"
#include "\z\ace\addons\arsenal\defines.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

enableSaving [false, false];
cba_diagnostic_projectileMaxLines = 10;

[QGVAR(displayOpened), {
    private _player = player;

    // player pose
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

    // hide everything except the player
    {
        _x enableSimulation false;
        _x hideObject true;
    } forEach (allMissionObjects "" - [_player]);

    if ((_player getVariable ["cba_projectile_firedEhId", -1]) != -1) then {
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
                        profileNamespace setVariable [QGVAR(missionLastLoadout), getUnitLoadout player];
                        _display closeDisplay 2;
                        findDisplay 46 closeDisplay 0;
                    };
                };
                true
            };
        }];

        private _buttonClose = _display displayCtrl IDC_menuBarClose;
        _buttonClose ctrlSetText localize "str_a3_rscdisplayarsenal_buttonok";
    } call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;

[QGVAR(displayClosed), {
    private _player = player;

    // unhide everthing
    {
        _x enableSimulation true;
        _x hideObject false;
    } forEach allMissionObjects "";

    // update VR unit gear
    {
        private _unit = _x;

        removeVest _unit;
        _unit addVest vest _player;

        removeBackpack _unit;
        _unit addBackpack backpack _player;

        removeHeadgear _unit;
        _unit addHeadgear headgear _player;

        removeGoggles _unit;
        _unit addGoggles goggles _player;

        removeAllWeapons _unit;
        _unit addWeapon primaryWeapon _player;
        {
            _unit addPrimaryWeaponItem _x;
        } forEach primaryWeaponItems _player;

        _unit addWeapon secondaryWeapon _player;

        {
            _unit addSecondaryWeaponItem _x;
        } forEach secondaryWeaponItems _player;

        _unit addWeapon handgunWeapon _player;
        {
            _unit addHandgunItem _x;
        } forEach handgunItems _player;
    } forEach (entities [["B_Soldier_VR_F", "O_Soldier_VR_F", "I_Soldier_VR_F"], [], true]);

    _player call CBA_fnc_addUnitTrackProjectiles;
}] call CBA_fnc_addEventHandler;
