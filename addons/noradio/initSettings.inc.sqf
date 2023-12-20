[
    QGVAR(enabled), "CHECKBOX", 
    [LSTRING(setting), LSTRING(setting_tooltip)], 
    [LELSTRING(Common,CategoryUncategorized), LLSTRING(DisplayName)],
    true, 
    true, {
    params ["_enabled"];

    if (_enabled) then {
        [ACE_player, "isPlayer"] call EFUNC(common,muteUnit);
    } else {
        [ACE_player, "isPlayer"] call EFUNC(common,unmuteUnit);
    };
}, true // Needs mission restart
] call CBA_fnc_addSetting;
