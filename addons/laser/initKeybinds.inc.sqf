
["ACE3 Equipment", QGVAR(LaserCodeUpHundreds), localize LSTRING(laserCodeUpHundreds),
{
    [2] call FUNC(keyLaserCodeChange);
},
{false},
[DIK_Q, [false, true, true]], false, 0] call CBA_fnc_addKeybind; // (ALT+CTRL+Q)

["ACE3 Equipment", QGVAR(LaserCodeUpTens), localize LSTRING(laserCodeUpTens),
{

    [1] call FUNC(keyLaserCodeChange);
},
{false},
[DIK_W, [false, true, true]], false, 0] call CBA_fnc_addKeybind; // (ALT+CTRL+W)

["ACE3 Equipment", QGVAR(LaserCodeUpOnes), localize LSTRING(laserCodeUpOnes),
{

    [0] call FUNC(keyLaserCodeChange);
},
{false},
[DIK_E, [false, true, true]], false, 0] call CBA_fnc_addKeybind; // (ALT+CTRL+E)
