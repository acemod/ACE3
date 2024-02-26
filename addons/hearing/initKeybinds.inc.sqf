["ACE3 Equipment", QGVAR(putOrRemoveEarplugs), localize LSTRING(PutOrRemoveEarplugs), {
    // Conditions: specific
    if !([ACE_player, objNull, ["isNotSwimming", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {false};

    if (GVAR(EnableCombatDeafness) && {!([ACE_player] call FUNC(hasEarPlugsIn)) && {'ACE_EarPlugs' in items ACE_player}}) exitWith {
        [ACE_player,true] call FUNC(putInEarPlugs);
        true;
    };
    if (GVAR(EnableCombatDeafness) && {[ACE_player] call FUNC(hasEarPlugsIn)}) exitWith {
        [ACE_player,true] call FUNC(removeEarPlugs);
        true;
    };
    
    false
},
{false},
[35, [false, false, true]], true] call CBA_fnc_addKeybind; //(ALT + H)