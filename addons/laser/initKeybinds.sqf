

["ACE3 Equipment", QGVAR(LaserCodeUpHundreds), localize LSTRING(laserCodeUpHundreds),
{
    [2] call FUNC(keyLaserCodeChange);
},
{false},
[16, [false, true, true]], false, 0] call CBA_fnc_addKeybind; // (ALT+CTRL+Q)

["ACE3 Equipment", QGVAR(LaserCodeUpTens), localize LSTRING(laserCodeUpTens),
{

    [1] call FUNC(keyLaserCodeChange);
},
{false},
[17, [false, true, true]], false, 0] call CBA_fnc_addKeybind; // (ALT+CTRL+E)

["ACE3 Equipment", QGVAR(LaserCodeUpOnes), localize LSTRING(laserCodeUpOnes),
{

    [0] call FUNC(keyLaserCodeChange);
},
{false},
[18, [false, true, true]], false, 0] call CBA_fnc_addKeybind; // (ALT+CTRL+E)
