private _category = [LELSTRING(common,ACEKeybindCategoryCommon), QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled), "CHECKBOX", 
    [LSTRING(setting), LSTRING(setting_tooltip)], 
    _category,
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
