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
            if (_enabled) then {
                if (GVAR(assignNVGpfh) == -1) then {
                    GVAR(assignNVGpfh) = [FUNC(assignNVG), 300] call CBA_fnc_addPerFrameHandler;
                };
            } else {
                [GVAR(assignNVGpfh)] call CBA_fnc_removePerFrameHandler;
                GVAR(assignNVGpfh) = -1;
            };
        };
    }
] call CBA_fnc_addSetting;
