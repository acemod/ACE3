/*
 * Author: nou, jaynus, PabstMirror
 * Called from FiredBIS event on AllVehicles
 * If spall is not enabled (default), then cache and only track those that will actually trigger fragmentation.
 *
 * Arguments:
 * 0: gun - Object the event handler is assigned to <OBJECT>
 * 4: type - Ammo used <STRING>
 * 6: round - Object of the projectile that was shot <OBJECT>
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

params ["_gun", "", "", "", "_type", "", "_round"];

private _shouldAdd = GVAR(cacheRoundsTypesToTrack) getVariable _type;
if (isNil "_shouldAdd") then {
    TRACE_1("no cache for round",_type);

    if (!EGVAR(common,settingsInitFinished)) exitWith {
        //Just incase fired event happens before settings init, don't want to set cache wrong if spall setting changes
        TRACE_1("Settings not init yet - exit without setting cache",_type);
        _shouldAdd = false;
    };

    if (GVAR(SpallEnabled)) exitWith {
        //Always want to run whenever spall is enabled?
        _shouldAdd = true;
        TRACE_2("SettingCache[spallEnabled]",_type,_shouldAdd);
        GVAR(cacheRoundsTypesToTrack) setVariable [_type, _shouldAdd];
    };

    //Read configs and test if it would actually cause a frag, using same logic as FUNC(pfhRound)
    private _skip = getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(skip));
    private _explosive = getNumber (configFile >> "CfgAmmo" >> _type >> "explosive");
    private _indirectRange = getNumber (configFile >> "CfgAmmo" >> _type >> "indirectHitRange");
    private _force = getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(force));
    private _fragPower = getNumber(configFile >> "CfgAmmo" >> _type >> "indirecthit")*(sqrt((getNumber (configFile >> "CfgAmmo" >> _type >> "indirectHitRange"))));

    _shouldAdd = (_skip == 0) && {(_force == 1) || {_explosive > 0.5 && {_indirectRange >= 4.5} && {_fragPower >= 35}}};
    TRACE_6("SettingCache[willFrag?]",_skip,_explosive,_indirectRange,_force,_fragPower,_shouldAdd);
    GVAR(cacheRoundsTypesToTrack) setVariable [_type, _shouldAdd];
};

if (_shouldAdd) then {
    TRACE_3("Running Frag Tracking",_gun,_type,_round);
    [_gun, _type, _round] call FUNC(addPfhRound);
};
