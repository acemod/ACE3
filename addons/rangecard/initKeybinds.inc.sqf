["ACE3 Equipment", QGVAR(RangeCardDialogKey), LLSTRING(OpenRangeCard),
{
    // Conditions: canInteract, canShow
    if !([ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {
        false // return
    };

    if (GVAR(rangeCardOpened)) exitWith {
        closeDialog 0;
        false // return
    };

    if !(call FUNC(canShow)) exitWith {
        false // return
    };

    // Statement
    false call FUNC(openRangeCard);

    true // return
},
{false},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)

["ACE3 Equipment", QGVAR(RangeCardCopyDialogKey), LLSTRING(OpenRangeCardCopy),
{
    // Conditions: canInteract, canShowCopy
    if !([ACE_player, objNull, ["notOnMap", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {
         // return
        false
    };

    if (GVAR(rangeCardOpened)) exitWith {
        closeDialog 0;
        false // return
    };

    if !(call FUNC(canShowCopy)) exitWith {
        false // return
    };

    // Statement
    true call FUNC(openRangeCard);

    true // return
},
{false},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)
