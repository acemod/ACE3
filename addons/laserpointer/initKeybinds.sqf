// by commy2

["ACE3 Weapons", QGVAR(switchLaserLightMode), localize "STR_ACE_Laserpointer_switchLaserLight",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    [ACE_player, currentWeapon ACE_player] call FUNC(switchLaserLightMode);
    true
},
{false}, [38, [false, true, false]], false] call CBA_fnc_addKeybind;
