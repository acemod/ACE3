// by commy2

#include "script_component.hpp"

["flashbangExplosion", {_this call FUNC(flashbangExplosionEH)}] call EFUNC(common,addEventHandler);

if !(hasInterface) exitWith {};

GVAR(flashbangPPEffectCC) = ppEffectCreate ["ColorCorrections", 4265];
GVAR(flashbangPPEffectCC) ppEffectForceInNVG true;

// Add keybinds
["ACE3",
    localize "STR_ACE_Grenades_SwitchGrenadeMode",
    {
        // Conditions: canInteract
        _exceptions = [QEGVAR(captives,isNotEscorting)];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        if (!([ACE_player] call EFUNC(common,canUseWeapon))) exitWith {false};

        // Statement
        [] call FUNC(nextMode);
    },
    [9, [false, false, false]],  //8 key
    false,
    "keydown"
] call cba_fnc_registerKeybind;
