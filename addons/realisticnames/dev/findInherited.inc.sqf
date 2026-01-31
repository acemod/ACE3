// [] execVM "z\ace\addons\realisticnames\dev\findInherited.inc.sqf";

private _weapAndVic = 
("(getNumber (_x >> 'scope')) == 2" configClasses (configFile >> "CfgWeapons")) 
+ ("(getNumber (_x >> 'scope')) == 2" configClasses (configFile >> "CfgVehicles"));
{
    private _name = getTextRaw (_x >> "displayName");
    if ((_name select [0, 8]) == "$str_ace") then { continue };
    private _config = _x;
    while {
        private _name = getTextRaw (_config >> "displayName");
        if ((_name select [0, 8]) == "$str_ace") exitWith {
            diag_log text format [" subvarient with non-ACE name found: %1", configName _x];
            systemChat format [" subvarient with non-ACE name found: %1", configName _x];
        };
        _config = inheritsFrom _config;
        _name != ""
    } do {};
} forEach _weapAndVic;
