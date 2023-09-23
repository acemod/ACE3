#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Gets the player model offset of the IR laser origin.
 * Currently unused, see onLightToggled.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_irlight_fnc_getGlowOffset
 *
 * Public: No
 */

if (isNil QGVAR(offsetCache)) then {
    GVAR(offsetCache) = createHashMap;
};

private _weapon = currentWeapon ACE_player;
private _laser = ((weaponsItems ACE_player) select {_x#0 == _weapon})#0#2;

GVAR(offsetCache) getOrDefaultCall [[_weapon, _laser], {
    private _model = getText (configFile >> "CfgWeapons" >> _weapon >> "model");
    private _dummy = createSimpleObject [_model, [0, 0, 0], true];
    private _proxyOffset = _dummy selectionPosition ["\a3\data_f\proxies\weapon_slots\SIDE.001", 1];
    _proxyOffset = [_proxyOffset#1, _proxyOffset#0 * -1, _proxyOffset#2];
    deleteVehicle _dummy;

    _model = getText (configFile >> "CfgWeapons" >> _laser >> "model");
    _dummy = createSimpleObject [_model, [0, 0, 0], true];
    private _selection = getText (configFile >> "CfgWeapons" >> _laser >> "ItemInfo" >> "Pointer" >> "irLaserPos");
    private _laserOffset = _dummy selectionPosition [_selection, "Memory"];
    _laserOffset = [_laserOffset#1, _laserOffset#0 * -1, _laserOffset#2 * -1];
    deleteVehicle _dummy;

    _proxyOffset vectorAdd _laserOffset
}, true];
