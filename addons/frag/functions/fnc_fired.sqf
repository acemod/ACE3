/*
 * Author: nou, jaynus, PabstMirror
 * Called from the unified fired EH for all.
 * If spall is not enabled (default), then cache and only track those that will actually trigger fragmentation.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_frag_fnc_fired
 *
 * Public: No
 */
// #define DEBUG_ENABLED_FRAG
#include "script_component.hpp"

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

private _shouldAdd = GVAR(cacheRoundsTypesToTrack) getVariable _ammo;
if (isNil "_shouldAdd") then {
    TRACE_1("no cache for round",_ammo);

    if (!EGVAR(common,settingsInitFinished)) exitWith {
        //Just incase fired event happens before settings init, don't want to set cache wrong if spall setting changes
        TRACE_1("Settings not init yet - exit without setting cache",_ammo);
        _shouldAdd = false;
    };

    if (GVAR(SpallEnabled)) exitWith {
        //Always want to run whenever spall is enabled?
        _shouldAdd = true;
        TRACE_2("SettingCache[spallEnabled]",_ammo,_shouldAdd);
        GVAR(cacheRoundsTypesToTrack) setVariable [_ammo, _shouldAdd];
    };

    _shouldAdd = false;
    GVAR(cacheRoundsTypesToTrack) setVariable [_ammo, _shouldAdd];
};

if (_shouldAdd) then {
    TRACE_3("Running Frag Tracking",_unit,_ammo,_projectile);
    [_unit, _ammo, _projectile] call FUNC(addPfhRound);
};
