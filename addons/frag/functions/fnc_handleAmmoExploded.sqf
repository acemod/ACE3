/*
 * Author: esteldunedain
 *
 * Handle an explosion, decide if frags should be produced. Only runs on the
 * server
 *
 * Arguments:
 * 0: Ammo <STRING>
 * 1: PositionAGL <ARRAY>
 *
 * Return Value:
 * None
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_ammo","_posAGL"];

// @todo: Cache _shouldFrag
private _ammoCfg = configFile >> "CfgAmmo" >> _ammo;
private _skip = getNumber (_ammoCfg >> QGVAR(skip));
private _explosive = getNumber (_ammoCfg >> "explosive");
private _indirectRange = getNumber (_ammoCfg >> "indirectHitRange");
private _force = getNumber (_ammoCfg >> QGVAR(force));
private _fragPower = getNumber(_ammoCfg >> "indirecthit")*(sqrt((getNumber (_ammoCfg >> "indirectHitRange"))));

if ((_skip == 0) && {(_force == 1) || {_explosive > 0.5 && {_indirectRange >= 4.5} && {_fragPower >= 35}}}) then {
    [QGVAR(frag_eh), [_ammo, AGLtoASL _posAGL]] call EFUNC(common,localEvent);
};
