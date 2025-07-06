// by esteldunedain
#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if (!hasInterface) exitWith {};

["ACE3 Weapons", QGVAR(safeMode), LLSTRING(SafeModeToggle), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting", "isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};

    (weaponState ACE_player) params ["_currentWeapon", "_currentMuzzle"];

    // Conditions: specific
    if !(ACE_player call CBA_fnc_canUseWeapon && {_currentWeapon != ""} && {_currentWeapon != binocular ACE_player}) exitWith {false};

    // Statement: Toggle weapon safety
    [ACE_player, _currentWeapon, _currentMuzzle] call FUNC(lockSafety);

    true
}, {false}, [DIK_GRAVE, [false, true, false]], false] call CBA_fnc_addKeybind;

["ACE3 Weapons", QGVAR(safeModeUnlock), LLSTRING(TakeOffSafety), {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting", "isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};

    (weaponState ACE_player) params ["_currentWeapon", "_currentMuzzle"];

    // Conditions: specific
    if !(ACE_player call CBA_fnc_canUseWeapon && {_currentWeapon != ""} && {_currentWeapon != binocular ACE_player}) exitWith {false};

    // Statement: Unlock weapon safety
    [ACE_player, _currentWeapon, _currentMuzzle, true, true] call FUNC(lockSafety);
}, {}] call CBA_fnc_addKeybind;

["unit", {
    (weaponState ACE_player) params ["_currentWeapon", "_currentMuzzle"];

    private _weaponSafe = [ACE_player, _currentWeapon, _currentMuzzle] call FUNC(getWeaponSafety);

    // Player HUD
    !_weaponSafe call FUNC(setSafeModeVisual);
}] call CBA_fnc_addPlayerEventHandler;

// Variables are transferred from corpse to new body and EH above triggers on respawn, which desyncs safeties
// Therefore, clear variables and remove mouse button input blocking upon respawn
[QUOTE(ADDON), "Respawn", {
    params ["_unit"];

    _unit setVariable [QGVAR(safedWeapons), nil];

    private _ehID = _unit getVariable QGVAR(actionID);

    if (isNil "_ehID") exitWith {};

    [_unit, "DefaultAction", _ehID] call EFUNC(common,removeActionEventHandler);

    _unit setVariable [QGVAR(actionID), nil];
}] call CBA_fnc_addBISPlayerEventHandler;
