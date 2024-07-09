// by esteldunedain
#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if (!hasInterface) exitWith {};

["ACE3 Weapons", QGVAR(safeMode), LLSTRING(SafeMode), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting", "isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};

    (weaponState ACE_player) params ["_currentWeapon", "_currentMuzzle"];

    // Conditions: specific
    if !(ACE_player call CBA_fnc_canUseWeapon && {_currentWeapon != ""} && {_currentWeapon != binocular ACE_player}) exitWith {false};

    // Statement
    [ACE_player, _currentWeapon, _currentMuzzle] call FUNC(lockSafety);

    true
}, {false}, [DIK_GRAVE, [false, true, false]], false] call CBA_fnc_addKeybind;

["unit", {
    (weaponState ACE_player) params ["_currentWeapon", "_currentMuzzle"];

    private _weaponSafe = _currentMuzzle in ((ACE_player getVariable [QGVAR(safedWeapons), createHashMap]) getOrDefault [_currentWeapon, createHashMap]);

    // Player HUD
    !_weaponSafe call FUNC(setSafeModeVisual);
}] call CBA_fnc_addPlayerEventHandler;
