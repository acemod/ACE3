#include "..\script_component.hpp"
/*
 * Author: mharis001, Dystopian, PabstMirror, johnb43
 * Returns children actions for weapon attachment switching.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * player call ace_interaction_fnc_getWeaponAttachmentsActions
 *
 * Public: No
 */

params ["_unit"];

[_unit, {
    params ["_unit"];

    private _currentWeapon = currentWeapon _unit;

    if (_currentWeapon == "") exitWith {[]};

    private _cfgWeapons = configFile >> "CfgWeapons";
    private _weaponItems = _unit weaponAccessories _currentWeapon;

    // Get current weapon attachments, as well as compatible attachments in inventory
    private _allAttachments = (+_weaponItems) - [""];
    _allAttachments append ((_unit call EFUNC(common,uniqueItems)) arrayIntersect (compatibleItems _currentWeapon));

    (_allAttachments arrayIntersect _allAttachments) apply {
        private _config = _cfgWeapons >> _x;
        private _name = getText (_config >> "displayName");
        private _picture = getText (_config >> "picture");

        [
            [
                _x,
                _name,
                _picture,
                {},
                {true},
                {
                    params ["", "_unit", "_args"];
                    _args params ["_attachment", "_name", "_picture", "_weaponItems", "_currentWeapon"];

                    private _cfgWeapons = configFile >> "CfgWeapons";
                    private _attachmentNotOnGun = !(_attachment in _weaponItems);
                    private _actions = [];

                    // "attach" action
                    if (_attachmentNotOnGun && {[_unit, _attachment] call EFUNC(common,hasItem)}) then {
                        private _type = getNumber (_cfgWeapons >> _attachment >> "itemInfo" >> "type");
                        private _currentAttachment = _weaponItems select ([TYPE_MUZZLE, TYPE_FLASHLIGHT, TYPE_OPTICS, TYPE_BIPOD] find _type);

                        _actions pushBack [
                            [
                                QGVAR(attach_) + _attachment,
                                LLSTRING(weaponAttachmentsAttach),
                                _picture,
                                LINKFUNC(switchWeaponAttachment),
                                {true},
                                {},
                                [_currentWeapon, _attachment, _currentAttachment]
                            ] call EFUNC(interact_menu,createAction),
                            [],
                            _unit
                        ];
                    };

                    // Don't show interaction with attachments that aren't on the current weapon
                    if (_attachmentNotOnGun) exitWith {_actions};

                    // "detach" action
                    _actions pushBack [
                        [
                            QGVAR(detach_) + _attachment,
                            LLSTRING(weaponAttachmentsDetach),
                            _picture,
                            LINKFUNC(switchWeaponAttachment),
                            {true},
                            {},
                            [_currentWeapon, "", _attachment]
                        ] call EFUNC(interact_menu,createAction),
                        [],
                        _unit
                    ];

                    private _CBA_PIPItems = configFile >> "CBA_PIPItems";

                    // "switch" action
                    {
                        // Ignore 2D scopes when using a PIP scope (e.g. CUP uses this)
                        if (getText (_CBA_PIPItems >> _x) == _attachment) then {
                            continue;
                        };

                        private _config = _cfgWeapons >> _x;
                        private _modeName = getText (_config >> "MRT_SwitchItemHintText");

                        if (_modeName == "") then {
                            _modeName = getText (_config >> "displayName");
                        };

                        _actions pushBack [
                            [
                                QGVAR(switch_) + _x,
                                format ["%1: %2", localize "str_sensortype_switch", _modeName],
                                getText (_config >> "picture"),
                                {
                                    params ["", "_unit", "_actionParams"];
                                    _actionParams params ["_weapon", "_newAttachment", "_oldAttachment"];
                                    [_unit, _weapon, _oldAttachment, _newAttachment] call EFUNC(common,switchAttachmentMode);
                                },
                                {true},
                                {},
                                [_currentWeapon, _x, _attachment]
                            ] call EFUNC(interact_menu,createAction),
                            [],
                            _unit
                        ];
                    } forEach ((_attachment call CBA_fnc_switchableAttachments) - [_attachment]); // Don't allow switching to current mode

                    _actions
                },
                [_x, _name, _picture, _weaponItems, _currentWeapon]
            ] call EFUNC(interact_menu,createAction),
            [],
            _unit
        ]
    } // return
}, _unit, QGVAR(weaponAttachmentsActions), 5, QGVAR(clearWeaponAttachmentsActionsCache)] call EFUNC(common,cachedCall);
