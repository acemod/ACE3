private _category = [LELSTRING(common,categoryUncategorized), QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(minDamageToTrigger),
    "SLIDER",
    [LSTRING(minDamageToTrigger_displayName), LSTRING(minDamageToTrigger_Description)],
    _category,
    [-1, 1, 0.1, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(weaponDropChanceArmHitPlayer),
    "SLIDER",
    LSTRING(weaponDropChanceArmHitPlayer_displayName),
    _category,
    [0, 1, 0, 2, true],
    1,
    {[QGVAR(updateFiredEHs)] call CBA_fnc_localEvent}
] call CBA_fnc_addSetting;

[
    QGVAR(weaponDropChanceArmHitAI),
    "SLIDER",
    LSTRING(weaponDropChanceArmHitAI_displayName),
    _category,
    [0, 1, 0, 2, true],
    1,
    {[QGVAR(updateFiredEHs)] call CBA_fnc_localEvent}
] call CBA_fnc_addSetting;
