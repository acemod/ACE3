// [] execVM "z\ace\addons\realisticnames\dev\dumpPylon.sqf";

private _justLog = true;

diag_log text format ["[Dumping Pylons] --------------------"];
private _cfgWeapons = configFile >> "CfgWeapons";
{
    private _pylonWeapon = getText (_x >> "pylonWeapon");
    if (_pylonWeapon != "") then {
        private _weaponConfig = _cfgWeapons >> _pylonWeapon;
        private _weaponName = getText (_weaponConfig >> "displayName");
        private _pylonMagNameConfig = _x >> "displayName";
        private _explicit = _x == inheritsFrom _pylonMagNameConfig;
        private _pylonMagName = getText _pylonMagNameConfig;
        if (_justLog) then {
            if (_explicit) then {
                diag_log text format ["%1: [%2 vs %3]", configName _x, _pylonMagName, _weaponName];
            } else {
                diag_log text format ["  -  %1: [%2 vs %3]", configName _x, _pylonMagName, _weaponName];
            };
        } else {
            if (_explicit) then {
                private _parent = configName inheritsFrom _x;
                diag_log text format ['class %1;', _parent];
                diag_log text format ['class %1: %2 {', configName _x, _parent];
                diag_log text format ['displayName = "%1"; [vanilla: %2 - %3]', _weaponName, _pylonMagName, _pylonWeapon];
                diag_log text format ['};'];
            };
        };
    };
} forEach ("true" configClasses (configFile >> "CfgMagazines"));
