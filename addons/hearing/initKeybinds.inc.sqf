["ACE3 Equipment", QGVAR(putOrRemoveEarplugs), LLSTRING(PutOrRemoveEarplugs), {
    // Conditions: specific
    if !([ACE_player, objNull, ["isNotSwimming", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {false};

    if (GVAR(enableCombatDeafness) && {!(ACE_player getVariable ["ACE_hasEarPlugsIn", false])} && {[ACE_player, "ACE_EarPlugs"] call EFUNC(common,hasItem)}) exitWith {
        [ACE_player, true] call FUNC(putInEarPlugs);

        true // return
    };

    if (GVAR(enableCombatDeafness) && {ACE_player getVariable ["ACE_hasEarPlugsIn", false]}) exitWith {
        [ACE_player, true] call FUNC(removeEarPlugs);

        true // return
    };

    false // return
}] call CBA_fnc_addKeybind; // UNBOUND

["ACE3 Equipment", QGVAR(putOrRemoveEHP), LLSTRING(PutOrRemoveEHP), {
    // Conditions: specific
    if !([ACE_player, objNull, ["isNotSwimming", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {false};

    if ([ACE_player] call FUNC(canPutOnEHP)) exitWith {
        [ACE_player, true] call FUNC(putOnEHP);

        true // return
    };

    if (GVAR(enableCombatDeafness) && {ACE_player getVariable ["ACE_hasEHP", false]}) exitWith {
        [ACE_player, true] call FUNC(removeEHP);

        true // return
    };

    false // return
}] call CBA_fnc_addKeybind; // UNBOUND
