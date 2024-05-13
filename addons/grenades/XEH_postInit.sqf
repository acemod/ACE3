// by commy2

#include "script_component.hpp"

["ace_flashbangExploded", LINKFUNC(flashbangExplosionEH)] call CBA_fnc_addEventHandler;

// Register fired event handlers
["ace_firedPlayer", LINKFUNC(throwGrenade)] call CBA_fnc_addEventHandler;
["ace_firedPlayerNonLocal", LINKFUNC(throwGrenade)] call CBA_fnc_addEventHandler;
["ace_firedNonPlayer", LINKFUNC(throwGrenade)] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

GVAR(flashbangPPEffectCC) = ppEffectCreate ["ColorCorrections", 4265];
GVAR(flashbangPPEffectCC) ppEffectForceInNVG true;

// Add keybinds
["ACE3 Weapons", QGVAR(switchGrenadeMode), localize LSTRING(SwitchGrenadeMode), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if (!([ACE_player] call CBA_fnc_canUseWeapon)) exitWith {false};
    // Don't change mode or show hint if advanced throwing is active
    if (ACE_player getVariable [QEGVAR(advanced_throwing,inHand), false]) exitWith {false};

    // Statement
    [] call FUNC(nextMode);
}, {false}, [9, [false, false, false]], false] call CBA_fnc_addKeybind; //8 Key

["CBA_settingsInitialized", {
    if (GVAR(convertExplosives)) then {
        [] call FUNC(addChangeFuseItemContextMenuOptions);
    };
}] call CBA_fnc_addEventHandler;

GVAR(currentThrowable) = [];

{
    private _currentThrowable = currentThrowable ACE_player;

    if (GVAR(currentThrowable) isEqualTo _currentThrowable) exitWith {};

    GVAR(currentThrowable) = _currentThrowable;

    // Make sure grenade can be rolled if in roll mode (detonation time has to be >= 1 second)
    if !(
        (missionNamespace getVariable [QGVAR(currentThrowMode), 0]) == 3 &&
        {_currentThrowable select 0 != ""} &&
        {getNumber (configFile >> "CfgAmmo" >> getText (configFile >> "CfgMagazines" >> _currentThrowable select 0 >> "ammo") >> "explosionTime") < MIN_EXPLOSION_TIME_FOR_ROLL}
    ) exitWith {};

    // Force the user into the normal throw mode
    // Next throw mode after roll would be drop, which isn't ideal if the user tries to throw unknowingly...
    [format [LLSTRING(RollGrenadeDisabled), LLSTRING(NormalThrow)], 2.5] call EFUNC(common,displayTextStructured);

    GVAR(currentThrowMode) = 0;
} call CBA_fnc_addPerFrameHandler;
