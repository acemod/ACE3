

["ACE3 Equipment", QGVAR(LaserCodeUp), localize LSTRING(laserCodeUp),
{
    [1] call FUNC(keyLaserCodeChange);
},
{false},
[16, [false, true, true]], false, 0] call CBA_fnc_addKeybind; // (ALT+CTRL+Q)

["ACE3 Equipment", QGVAR(LaserCodeDown), localize LSTRING(laserCodeDown),
{

    [-1] call FUNC(keyLaserCodeChange);
},
{false},
[18, [false, true, true]], false, 0] call CBA_fnc_addKeybind; // (ALT+CTRL+E)

["ACE3 Equipment", QGVAR(MarkerLaserToggle), localize LSTRING(laserMarkToggle),
{
    if( (ACE_player == vehicle ACE_player) && ((getNumber (configFile >> "CfgWeapons" >> currentWeapon ACE_player >> QUOTE(ADDON) >> "markerEnabled")) == 1) ) then {
        [ACE_player] call FUNC(toggleMarker);
    };
},
{false},
[38, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (L)
