
["ACE3 Equipment", QGVAR(DistanceKey), localize "STR_ACE_Yardage450_PowerButtonKey",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(GVAR(active)) exitWith {false};
    if (currentWeapon ACE_player != "ACE_Yardage450" || cameraView != "GUNNER") exitWith {false};

    // Statement
    if !(GVAR(powerButtonPressed)) then {
        GVAR(powerButtonPressed) = true;
        call FUNC(acquireTarget);
    };
    true
},
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if (currentWeapon ACE_player != "ACE_Yardage450" || cameraView != "GUNNER") exitWith {false};

    // Statement
    GVAR(powerButtonPressed) = false;
    call FUNC(turnOn);
    true
},
[19, [false, false, false]], false] call CBA_fnc_addKeybind; //R Key
