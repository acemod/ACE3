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

    private _currentWeapon = currentWeapon _unit;
    if (_currentWeapon isEqualTo "") exitWith {[]};
    private _weaponItems = _unit weaponAccessories _currentWeapon;
    private _cfgWeapons = configFile >> "CfgWeapons";
    private _actions = [];

    // "attach" actions
    private _items = _unit call EFUNC(common,uniqueItems);
    private _compatibleItems = _currentWeapon call CBA_fnc_compatibleItems;
    {
        private _config = _cfgWeapons >> _x;
        private _name = format [LLSTRING(weaponAttachmentsAttach), getText (_config >> "displayName")];
        private _picture = getText (_config >> "picture");
        private _type = getNumber (_config >> "itemInfo" >> "type");
        private _oldAttachment = _weaponItems select ([TYPE_MUZZLE, TYPE_FLASHLIGHT, TYPE_OPTICS, TYPE_BIPOD] find _type);

        private _action = [
            _x, _name, _picture,
            LINKFUNC(switchWeaponAttachment),
            {true},
            {},
            [_currentWeapon, _x, _oldAttachment]
        ] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _unit];
    } forEach ((_items arrayIntersect _compatibleItems) - _weaponItems);

    // "detach" actions
    {
        if (_x isEqualTo "") then {continue};

        private _config = _cfgWeapons >> _x;
        private _name = format [LLSTRING(weaponAttachmentsDetach), getText (_config >> "displayName")];
        private _picture = getText (_config >> "picture");

        private _action = [
            _x, _name, _picture,
            LINKFUNC(switchWeaponAttachment),
            {true},
            {},
            [_currentWeapon, "", _x]
        ] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _unit];
    } forEach _weaponItems;

    _actions
}, _unit, QGVAR(weaponAttachmentsActions), 5, QGVAR(clearWeaponAttachmentsActionsCache)] call EFUNC(common,cachedCall);
