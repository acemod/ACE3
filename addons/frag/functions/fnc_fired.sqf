#include "script_component.hpp"
/*
 * Author: nou, jaynus, PabstMirror
 * Called from the unified fired EH for all.
 * If spall is not enabled (default), then cache and only track those that will actually trigger fragmentation.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_frag_fnc_fired
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

private _shouldAdd = GVAR(cacheRoundsTypesToTrack) getVariable _ammo;
if (isNil "_shouldAdd") then {
    TRACE_1("no cache for round",_ammo);

    //Read configs and test if it would actually cause a frag, using same logic as FUNC(pfhRound)
    private _skip = getNumber (configFile >> "CfgAmmo" >> _ammo >> QGVAR(skip));
    private _explosive = getNumber (configFile >> "CfgAmmo" >> _ammo >> "explosive");
    private _indirectRange = getNumber (configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
    private _force = getNumber (configFile >> "CfgAmmo" >> _ammo >> QGVAR(force));
    private _fragPower = getNumber (configFile >> "CfgAmmo" >> _ammo >> "indirecthit") * (sqrt (getNumber (configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange")));

    _shouldAdd = (_skip == 0) && {(_force == 1) || {_explosive > 0.5 && {_indirectRange >= 4.5} && {_fragPower >= 35}}};

    if (GVAR(spallEnabled) && {!_shouldAdd}) then {
        private _caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber");
        if !(_caliber >= 2.5 || {(_explosive > 0 && {_indirectRange >= 1})}) exitWith {}; // from check in doSpall: line 34
        TRACE_1("Won't frag, but will spall",_caliber);
        _shouldAdd = true;
    };

    TRACE_6("Setting Cache",_skip,_explosive,_indirectRange,_force,_fragPower,_shouldAdd);
    GVAR(cacheRoundsTypesToTrack) setVariable [_ammo, _shouldAdd];
};

if (_shouldAdd) then {
    // firedMan will have nil "_gunner", so just check _unit; for firedVehicle we want to check _gunner
    private _localShooter = if (isNil "_gunner") then {local _unit} else {local _gunner};
    TRACE_4("",_localShooter,_unit,_ammo,_projectile);
    if (!_localShooter) exitWith {};
    if (_weapon == "Put") exitWith {}; // Ignore explosives placed without ace_explosives

    // Skip if less than 0.5 second from last shot
    if ((CBA_missionTime - (_unit getVariable [QGVAR(lastTrack), -1])) < 0.5) exitWith {};
    _unit setVariable [QGVAR(lastTrack), CBA_missionTime];

    [_unit, _ammo, _projectile] call FUNC(addPfhRound);
};
