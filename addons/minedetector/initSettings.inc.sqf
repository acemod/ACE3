[
    QGVAR(radiusMode), "LIST",
    [LSTRING(radiusMode), LSTRING(radiusMode_Desc)],
    format ["ACE %1", localize LSTRING(Category)],
    [["DEFAULT","CUSTOM_RADIUS"], [LSTRING(radiusMode_Default), LSTRING(radiusMode_CustomRadius)], 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(radiusMode_customRadius), "SLIDER",
    [LSTRING(radiusMode_customRadius), LSTRING(radiusMode_customRadius_Desc)],
    format ["ACE %1", localize LSTRING(Category)],
    [2.5, 10, 2.5, 1],
    1
] call CBA_fnc_addSetting;
