diag_log text format ["----------------"];
diag_log text format ["Checking Missile"];
diag_log text format ["----------------"];

private _magazines = "true" configClasses (configFile >> "CfgMagazines");
private _weapons = "getNumber (_x >> 'scope') > 0" configClasses (configFile >> "CfgWeapons");

private _seenAmmo = [];

private _cfgAmmo = configFile >> "CfgAmmo";
_magazines select {
    private _ammo = getText (_x >> "ammo");
    if ((_seenAmmo pushBackUnique toLower _ammo) == -1) then { continue };
    private _ammoCfg = _cfgAmmo >> _ammo;
    private _guidanceCfg = _cfgAmmo >> _ammo >> "ace_missileGuidance";
    private _enabled = getNumber (_guidanceCfg >> "enabled");
    if (_enabled != 0) then {
        diag_log text format ["%1 [used in %2] Enabled=%3", _ammo, configName _x, _enabled];
        private _configs = configProperties [(configFile >> "CfgAmmo" >> _ammo), "configName _x == ""ace_missileguidance""", false];
        if (_configs isEqualTo []) then {
            private _manuv = getNumber (_ammoCfg >> "maneuvrability");
            diag_log text format ["  WARNING: Enabled but not explicit - maneuvrability=%1", _manuv];
            diag_log text format ["  parent=%1", configName inheritsFrom _ammoCfg];
        };
    };
};
