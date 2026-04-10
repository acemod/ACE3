[
    QGVAR(RadiusCoefficient), "SLIDER",
    [LSTRING(RadiusCoefficient), LSTRING(RadiusCoefficient_Desc)],
    format ["ACE %1", localize LSTRING(Category)],
    [1, 5, 1, 1, true],
    1
] call CBA_fnc_addSetting;
