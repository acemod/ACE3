[
    QGVAR(selectorColor),
    "COLOR",
    localize LSTRING(SelectorColor),
    format ["ACE %1", localize LSTRING(Category_InteractionMenu)],
    [1, 0, 0],
    false,
    {GVAR(selectorColorHex) = _this call BIS_fnc_colorRGBtoHTML} // Stored in Hex to avoid constant conversion
] call CBA_settings_fnc_init;
