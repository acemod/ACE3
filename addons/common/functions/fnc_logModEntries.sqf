// by commy2

private ["_configs", "_entries", "_name"];

_configs = "true" configClasses (configFile >> _this);

_entries = [];

{
    {
        _name = toLower configName _x;
        if !(_name in _entries) then {
            diag_log text _name;
            _entries pushBack _name;
        };
    } forEach configProperties [_x, "toLower configName _x find 'ace' == 0", false];
} forEach _configs;
