#include "\a3\ui_f\hpp\defineDIKCodes.inc"

["ACE3 Equipment", QGVAR(rangetable_action), LLSTRING(rangetable_action), {
    if (
        !([ACE_player, "ACE_RangeTable_82mm"] call EFUNC(common,hasItem)) ||
        !([ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith))
    ) exitWith {false};

    // Close previously opened dialogs
    closeDialog 0;

    // Statement
    [] call FUNC(rangeTableOpen);
    true
}] call CBA_fnc_addKeybind; // Unbound
