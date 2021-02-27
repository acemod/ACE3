

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
