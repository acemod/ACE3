private _weapons = "(getNumber (_x >> 'scope')) == 2" configClasses (configFile >> "CfgWeapons");
{
    private _name = getTextRaw (_x >> "displayName");
    if ((_name select [0, 8]) == "$str_ace") then { continue };
    private _config = _x;
    while {
        private _name = getTextRaw (_config >> "displayName");
        if ((_name select [0, 8]) == "$str_ace") exitWith {
            systemChat format [" subvarient with non-ACE name found: %1", configName _x];
        };
        _config = inheritsFrom _config;
        _name != ""
    } do {};
} forEach _weapons;
