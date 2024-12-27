#include "\a3\ui_f\hpp\defineDIKCodes.inc"

// Add Keybinds
["ACE3 Weapons", QGVAR(checkAmmo), LSTRING(checkAmmo), {
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, ["isNotInside", "isNotSwimming", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Ignore if controlling UAV (blocks radar keybind)
    if (!isNull (ACE_controlledUAV param [0, objNull])) exitWith {false};
    // Conditions: specific
    if !(ACE_player call FUNC(canCheckAmmoSelf)) exitWith {false};

    // Statement
    [ACE_player, ACE_player] call FUNC(checkAmmo);

    true
}, {false}, [DIK_R, [false, true, false]], false] call CBA_fnc_addKeybind; // Ctrl + R
