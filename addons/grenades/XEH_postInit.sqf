// by commy2

#include "script_component.hpp"

["ace_flashbangExploded", {_this call FUNC(flashbangExplosionEH)}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

GVAR(flashbangPPEffectCC) = ppEffectCreate ["ColorCorrections", 4265];
GVAR(flashbangPPEffectCC) ppEffectForceInNVG true;

// Add keybinds
["ACE3 Weapons", QGVAR(switchGrenadeMode), localize LSTRING(SwitchGrenadeMode),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if (!([ACE_player] call CBA_fnc_canUseWeapon)) exitWith {false};

    // Statement
    [] call FUNC(nextMode);
},
{false},
[9, [false, false, false]], false] call CBA_fnc_addKeybind; //8 Key


// Register fire event handler
["ace_firedPlayer", DFUNC(throwGrenade)] call CBA_fnc_addEventHandler;
["ace_firedPlayerNonLocal", DFUNC(throwGrenade)] call CBA_fnc_addEventHandler;
["ace_firedNonPlayer", DFUNC(throwGrenade)] call CBA_fnc_addEventHandler;


// Code to handle flashbangs being fired
[QGVAR(flashbangFired), {
    //IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
    if (local _unit) then {
        private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
        private _fuzeTime = getNumber (_ammoConfig >> "explosionTime");
        [FUNC(flashbangThrownFuze), [_projectile], _fuzeTime] call CBA_fnc_waitAndExecute;
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(flashbangFired), {
    params ["_ammo", "_ammoConfig"];
    getNumber (_ammoConfig >> QGVAR(flashbang)) == 1
}, true, true, true, false, false, false] call EFUNC(common,registerAmmoFiredEvent);


// Code to handle flares being fired
[QGVAR(flareFired), {
    //IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
    private _ammoConfig = configFile >> "CfgAmmo" >> _ammo
    private _fuzeTime = getNumber (_ammoConfig >> "explosionTime");
    private _timeToLive = getNumber (_config >> "timeToLive");
    private _color = getArray (_config >> QGVAR(color));
    private _intensity = _color deleteAt 3;
    [FUNC(flare), [_projectile, _color, _intensity, _timeToLive], _fuzeTime, 0] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

[QGVAR(flareFired), {
    params ["_ammo", "_ammoConfig"];
    getNumber (_ammoConfig >> QGVAR(flare)) == 1
}, true, true, true, false, false, false] call EFUNC(common,registerAmmoFiredEvent);
