// [] execVM "z\ace\addons\realisticnames\dev_dumpPylon.sqf";

private _justLog = true;

diag_log text format ["[Dumping Pylons] --------------------"];
private _magazines = configProperties [configFile >> "CfgMagazines", "isClass _x", true];
{
    private _pylonWeapon = getText (_x >> "pylonWeapon");
    if (_pylonWeapon != "") then {
        private _weaponConfig = configFile >> "CfgWeapons" >> _pylonWeapon;
        private _weaponName = getText (_weaponConfig >> "displayName");
        private _inherit = (configProperties [_x, "configName _x == 'displayName'", false]) isEqualTo [];
        private _pylonMagName = getText (_x >> "displayName");
        if (_justLog) then {
            if (!_inherit) then {
                diag_log text format ["%1: [%2 vs %3]", configName _x, _pylonMagName, _weaponName];
            } else {
                diag_log text format ["  -  %1: [%2 vs %3]", configName _x, _pylonMagName, _weaponName];
            };
        } else {
            if (!_inherit) then {
                diag_log text format ['class %1;', configName inheritsFrom _x];
                diag_log text format ['class %1: %2 {', configName _x, configName inheritsFrom _x];
                diag_log text format ['displayName = "%1"; [vanilla: %2 - %3]', _weaponName, _pylonMagName, _pylonWeapon];
                diag_log text format ['};', configName _x, configName inheritsFrom _x, _weaponName, _pylonMagName];
            };
        };
    };
} forEach _magazines;
