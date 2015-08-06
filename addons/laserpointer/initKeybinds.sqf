// by commy2

["localize ELSTRING(common,ACEConfigCategoryWeapons)", QGVAR(switchLaserLightMode), localize LSTRING(switchLaserLight),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    [ACE_player, currentWeapon ACE_player] call FUNC(switchLaserLightMode);
    true
},
{false}, [38, [false, true, false]], false] call CBA_fnc_addKeybind;
