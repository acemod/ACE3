
["ACE3 Equipment", QGVAR(MenuKey), localize LSTRING(ConfigureDAGR),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if !([ACE_player, "ACE_DAGR"] call EFUNC(common,hasItem)) exitWith {false};

    // Statement
    if (!GVAR(menuRun)) then {
        [] call FUNC(menuInit);
    } else {
        GVAR(PWR) = true; // Simulate pressing the power button
    };
    true
},
{false},
[0, [false, true, false]], false] call CBA_fnc_addKeybind;  // (empty default key)

["ACE3 Equipment", QGVAR(ToggleKey), localize LSTRING(ToggleDAGR),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if !([ACE_player, "ACE_DAGR"] call EFUNC(common,hasItem)) exitWith {false};

    // Statement
    [] call FUNC(toggleOverlay);
    true
},
{false},
[0, [false, false, false]], false] call CBA_fnc_addKeybind;  // (empty default key)

//Add deviceKey entry:
private ["_conditonCode", "_toggleCode", "_closeCode"];
_conditonCode = {
    ([ACE_player, "ACE_DAGR"] call EFUNC(common,hasItem));
};
_toggleCode = {
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {};

    // Statement
    [] call FUNC(toggleOverlay);
    if (!GVAR(run)) then {
        [] call FUNC(menuInit);
    };
};
_closeCode = {
    // Statement
    if (GVAR(run)) then {
        //If dispaly is open, close it:
        [] call FUNC(toggleOverlay);
    };
    if (dialog && GVAR(menuRun)) then {
        //If dialog is open, close it:
        GVAR(menuRun) = false;
        closeDialog 0;
    };
};
["DAGR", QPATHTOF(UI\DAGR_Icon.paa), _conditonCode, _toggleCode, _closeCode] call EFUNC(common,deviceKeyRegisterNew);
