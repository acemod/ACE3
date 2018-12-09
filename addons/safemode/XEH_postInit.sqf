// by esteldunedain
#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if (!hasInterface) exitWith {};

["ACE3 Weapons", QGVAR(safeMode), localize LSTRING(SafeMode), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting", "isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call CBA_fnc_canUseWeapon && {currentWeapon ACE_player != binocular ACE_player} && {currentWeapon ACE_player != ""}) exitWith {false};

    // Statement
    [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call FUNC(lockSafety);
    true
}, {false}, [DIK_GRAVE, [false, true, false]], false] call CBA_fnc_addKeybind;

["unit", {
    private _weaponSafe = currentWeapon ACE_player in (ACE_player getVariable [QGVAR(safedWeapons), []]);
    [!_weaponSafe] call FUNC(setSafeModeVisual);
}] call CBA_fnc_addPlayerEventHandler;
