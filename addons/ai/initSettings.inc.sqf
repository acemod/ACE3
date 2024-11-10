private _category = format ["ACE %1", LLSTRING(DisplayName)];

[
    QGVAR(assignNVG), "CHECKBOX",
    [LSTRING(AssignNVG_DisplayName), LSTRING(AssignNVG_Description)],
    _category,
    false,
    1,
    {
        if (isServer) then {
            params ["_enabled"];
            if (_enabled && {!GVAR(assignNVGthread)}) then {
                TRACE_1("start loop",_this);
                GVAR(assignNVGthread) = true;
                [FUNC(assignNVGpfh), [], 1] call CBA_fnc_waitAndExecute;
            };
        };
    }
] call CBA_fnc_addSetting;
