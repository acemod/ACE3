[
    QGVAR(RadiusCoefficient), "SLIDER",
    [LSTRING(RadiusCoefficient), LSTRING(RadiusCoefficient_Desc)],
    format ["ACE %1", localize LSTRING(Category)],
    [0, 10, 0, 1],
    1
] call CBA_fnc_addSetting;
