#include "script_component.hpp"
/*
 * Author: mharis001, Dystopian
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

    private _items = items _unit apply {toLower _x};
    private _currentWeapon = currentWeapon _unit;
    private _compatibleItems = _currentWeapon call CBA_fnc_compatibleItems apply {toLower _x};
    private _weaponItems = (
        weaponsItems _unit select {_x select 0 == _currentWeapon} param [0, []] select {_x isEqualType ""} apply {toLower _x}
    ) - [toLower _currentWeapon];

    private _cfgWeapons = configFile >> "CfgWeapons";
    private _actions = [];

    // "take off" actions
    private _takeOffString = localize "str_a3_cfgactions_unmountitem0";
    {
        if !(_x isEqualTo "") then {
            private _icon = [
                format ["%1\item%2_ca.paa", WEAPON_ICON_PATH, ["Muzzle", "Acc", "Optic", "Bipod"] select _forEachIndex],
                "#FF0000"
            ];

            private _action = [
                _x, _takeOffString, _icon,
                LINKFUNC(switchWeaponAttachment),
                {true},
                {},
                [_currentWeapon, "", _x]
            ] call EFUNC(interact_menu,createAction);
            _actions pushBack [_action, [], _unit];
        };
    } forEach _weaponItems;

    // "switch" actions
    {
        private _config = _cfgWeapons >> _x;
        private _displayName = getText (_config >> "displayName");
        private _picture = getText (_config >> "picture");
        private _type = getNumber (_config >> "itemInfo" >> "type");
        private _oldAttachment = _weaponItems select ([TYPE_MUZZLE, TYPE_FLASHLIGHT, TYPE_OPTICS, TYPE_BIPOD] find _type);

        private _action = [
            _x, _displayName, _picture,
            LINKFUNC(switchWeaponAttachment),
            {true},
            {},
            [_currentWeapon, _x, _oldAttachment]
        ] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _unit];
    } forEach ((_items arrayIntersect _compatibleItems) - _weaponItems);

    _actions
}, _unit, QGVAR(actions), 5, QGVAR(clearWeaponAttachmentsActionsCache)] call EFUNC(common,cachedCall);
