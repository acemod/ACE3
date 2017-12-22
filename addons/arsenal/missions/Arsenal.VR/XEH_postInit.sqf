#include "script_component.hpp"

enableSaving [false, false];

[QGVAR(displayOpened), {
    private _player = player;

    // player pose
    [{
        switch (true) do {
            case (primaryWeapon _this != ""): {
                [_this, "amovpercmstpslowwrfldnon", 2] call EFUNC(common,doAnimation);
            };
            case (handgunWeapon _this != ""): {
                [_this, "amovpercmstpslowwpstdnon", 2] call EFUNC(common,doAnimation);
            };
            default {
                [_this, "amovpercmstpsnonwnondnon", 2] call EFUNC(common,doAnimation);
            };
        };
    }, _player] call CBA_fnc_execNextFrame;

    // hide everything except the player
    {
        _x enableSimulation false;
        _x hideObject true;
    } forEach (entities [[], [], true] - [_player]);

    _player call CBA_fnc_removeUnitTrackProjectiles;
    _player setFatigue 0;
}] call CBA_fnc_addEventHandler;

[QGVAR(displayClosed), {
    private _player = player;

    // unhide everthing
    {
        _x enableSimulation true;
        _x hideObject false;
    } forEach entities [[], [], true];

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
