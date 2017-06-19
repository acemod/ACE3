["ACE3 Equipment", QGVAR(ATragMXDialogKey), localize LSTRING(ATragMXDialogKey),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if (GVAR(active)) exitWith {
        closeDialog 0;
        false
    };
    // Statement
    [] call FUNC(create_dialog);
    false
},
{false},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)


//Add deviceKey entry:
private ["_conditonCode", "_toggleCode", "_closeCode"];
_conditonCode = {
    [] call FUNC(can_show);
};
_toggleCode = {
    // Conditions: canInteract
    if !([ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {};
    if (GVAR(active)) exitWith {
        closeDialog 0;
    };
    // Statement
    [] call FUNC(create_dialog);
};
_closeCode = {
    if (GVAR(active)) exitWith {
        closeDialog 0;
    };
};
[(localize LSTRING(Name)), QPATHTOF(UI\ATRAG_Icon.paa), _conditonCode, _toggleCode, _closeCode] call EFUNC(common,deviceKeyRegisterNew);
