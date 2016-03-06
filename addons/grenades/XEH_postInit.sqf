// by commy2

#include "script_component.hpp"

["flashbangExplosion", {_this call FUNC(flashbangExplosionEH)}] call EFUNC(common,addEventHandler);

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
["firedPlayer", DFUNC(throwGrenade)] call EFUNC(common,addEventHandler);
["firedPlayerNonLocal", DFUNC(throwGrenade)] call EFUNC(common,addEventHandler);
["firedNonPlayer", DFUNC(throwGrenade)] call EFUNC(common,addEventHandler);
