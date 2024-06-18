// by commy2

#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

["ace_flashbangExploded", LINKFUNC(flashbangExplosionEH)] call CBA_fnc_addEventHandler;
[QGVAR(damageEngineAndWheels), LINKFUNC(damageEngineAndWheels)] call CBA_fnc_addEventHandler;

// Register fired event handlers
["ace_firedPlayer", LINKFUNC(throwGrenade)] call CBA_fnc_addEventHandler;
["ace_firedPlayerNonLocal", LINKFUNC(throwGrenade)] call CBA_fnc_addEventHandler;
["ace_firedNonPlayer", LINKFUNC(throwGrenade)] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

GVAR(flashbangPPEffectCC) = ppEffectCreate ["ColorCorrections", 4265];
GVAR(flashbangPPEffectCC) ppEffectForceInNVG true;

// Add keybinds
["ACE3 Weapons", QGVAR(switchGrenadeMode), LLSTRING(SwitchGrenadeMode), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(ACE_player call CBA_fnc_canUseWeapon) exitWith {false};

    // Don't change mode or show hint if advanced throwing is active
    if (ACE_player getVariable [QEGVAR(advanced_throwing,inHand), false]) exitWith {false};

    // Statement
    call FUNC(nextMode) // return
}, {}, [DIK_8, [false, false, false]], false] call CBA_fnc_addKeybind; // 8 Key

["CBA_settingsInitialized", {
    if (GVAR(convertExplosives)) then {
        call FUNC(addChangeFuseItemContextMenuOptions);
    };
}] call CBA_fnc_addEventHandler;

["vehicle", {
    private _currentThrowable = currentThrowable ACE_player;

    // Make sure grenade can be rolled if in roll mode (detonation time has to be >= 1 second and player isn't in a vehicle)
    if !(
        GVAR(currentThrowMode) == 3 &&
        {_currentThrowable isNotEqualTo []} &&
        {
            !isNull objectParent ACE_player ||
            {getNumber (configFile >> "CfgAmmo" >> getText (configFile >> "CfgMagazines" >> _currentThrowable select 0 >> "ammo") >> "explosionTime") < MIN_EXPLOSION_TIME_FOR_ROLL}
        }
    ) exitWith {};

    // If the player can't use throwables, don't change it
    if !(ACE_player call CBA_fnc_canUseWeapon) exitWith {};

    // Force the user into the normal throw mode
    // Next throw mode after roll would be drop, which isn't ideal if the user tries to throw unknowingly...
    [format [LLSTRING(RollGrenadeDisabled), LLSTRING(NormalThrow)], 2] call EFUNC(common,displayTextStructured);

    GVAR(currentThrowMode) = 0;
    GVAR(throwModePFEH) call CBA_fnc_removePerFrameHandler;
}, true] call CBA_fnc_addPlayerEventHandler;
