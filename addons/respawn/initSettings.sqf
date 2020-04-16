[
    QGVAR(savePreDeathGear),
    "CHECKBOX",
    [LSTRING(SavePreDeathGear_DisplayName), LSTRING(SavePreDeathGear_Description)],
    LSTRING(DisplayName),
    false,
    true,
    {
        if (_this && {getMissionConfigValue ["respawnDelay", 0] == 0}) then {
             setPlayerRespawnTime 0.01;
        };
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(removeDeadBodiesDisconnected),
    "CHECKBOX",
    [LSTRING(RemoveDeadBodiesDisconnected_DisplayName), LSTRING(RemoveDeadBodiesDisconnected_Description)],
    LSTRING(DisplayName),
    true,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(showFriendlyFireMessage),
    "CHECKBOX",
    [LSTRING(FriendlyFire_Module_DisplayName), LSTRING(FriendlyFire_Module_Description)],
    LSTRING(DisplayName),
    false,
    true
] call CBA_Settings_fnc_init;
