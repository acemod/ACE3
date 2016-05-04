["ACE3 Equipment", QGVAR(RangeCardDialogKey), localize "STR_ACE_RangeCard_RangeCardDialogKey",
{
    // Conditions: canInteract, canShow
    if !([ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
        if (GVAR(RangeCardOpened)) exitWith {
        closeDialog 0;
        false
    };    
    if !(call FUNC(canShow)) exitWith {false};
    // Statement
    false call FUNC(openRangeCard);
    true
},
{false},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)

["ACE3 Equipment", QGVAR(RangeCardCopyDialogKey), localize "STR_ACE_RangeCard_RangeCardCopyDialogKey",
{
    // Conditions: canInteract, canShowCopy
    if !([ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if (GVAR(RangeCardOpened)) exitWith {
        closeDialog 0;
        false
    };
    if !(call FUNC(canShowCopy)) exitWith {false};
    // Statement
    true call FUNC(openRangeCard);
    true
},
{false},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)