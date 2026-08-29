#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Unit or Weapon changed
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_missile_manpad_fnc_weaponChanged
 *
 * Public: No
 */
params ["_unit"];
private _weapon = currentWeapon _unit;
TRACE_2("weaponChanged",_unit,_weapon);

if (GVAR(running) isNotEqualTo []) then {
    TRACE_1("cleanup",GVAR(running));
    GVAR(running) params ["_unit", "_pfid", "_actionId"];
    _pfid call CBA_fnc_removePerFrameHandler;
    [_unit, "DefaultAction", _actionId] call EFUNC(common,removeActionEventHandler);
    GVAR(running) = [];
};
if (alive _unit && {_weapon != ""}) then {
    private _weapCfg = configFile >> "CfgWeapons" >> _weapon;
    if ((getNumber (_weapCfg >> QGVAR(enabled))) != 1) exitWith { TRACE_1("-not enabled",_weapCfg); };
    private _configs = configProperties [_weapCfg, QUOTE(configName _x == QUOTE(QGVAR(enabled))), false];
    if (_configs isEqualTo []) exitWith { TRACE_1("-not enabled explicitly",_weapCfg); };

    private _mag = (compatibleMagazines _weapon) param [0, ""];
    private _ammo = getText (configFile >> "CfgMagazines" >> _mag >> "ammo");
    private _ammoCfg = configFile >> "CfgAmmo" >> _ammo;

    // _config params ["_seekerMaxRange", "_lockAngle", "_uncageAngle", "_lockingTimeMin", "_lockingTimeMax", "_lockingSound", "_lockedSound"];
    private _config = [
        [_ammoCfg >> "ace_missileguidance" >> "seekerMaxRange", "NUMBER", 9000] call CBA_fnc_getConfigEntry,
        [_weapCfg >> QGVAR(lockAngle), "NUMBER", 3] call CBA_fnc_getConfigEntry,
        [_ammoCfg >> "ace_missileguidance" >> "seekerAngle", "NUMBER", 3] call CBA_fnc_getConfigEntry,
        [_weapCfg >> QGVAR(lockingTimeMin), "NUMBER", 3] call CBA_fnc_getConfigEntry,
        [_weapCfg >> QGVAR(lockingTimeMax), "NUMBER", 3] call CBA_fnc_getConfigEntry,
        [_weapCfg >> QGVAR(lockingSound), "STRING", ""] call CBA_fnc_getConfigEntry,
        [_weapCfg >> QGVAR(lockedSound), "STRING", ""] call CBA_fnc_getConfigEntry
    ];
    TRACE_3("-enabled",_mag,_ammo,_config);

    private _actionId = [_unit, "DefaultAction", {
        isNull ((_this select 1) getVariable [QEGVAR(missileguidance,target), objNull])
    }, {
        TRACE_1("block click",EGVAR(missileguidance,target));
    }] call EFUNC(common,addActionEventHandler);
    GVAR(running) = [_unit, -1,_actionId, _config, objNull, -1, false, "", -1];
    private _pfid = [{call FUNC(eachFrame)}, 0, GVAR(running)] call CBA_fnc_addPerFrameHandler;
    GVAR(running) set [1, _pfid];
};
