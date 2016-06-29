
[
    QGVAR(enabled),
    "CHECKBOX",
    LSTRING(enabled_displayName),
    ELSTRING(Common,ACEKeybindCategoryCommon),
    false,
    {
        if (!hasInterface) exitWith {};

        params ["_enabled"];

        if (_enabled) then {
            GVAR(incomingFingerEHId) = [QGVAR(fingered), FUNC(incomingFinger)] call CBA_fnc_addEventHandler;
        } else {
            private _ehId = missionNamespace getVariable QGVAR(incomingFingerEHId);

            if (!isNil "_ehId") then {
                [QGVAR(fingered), _ehId] call CBA_fnc_removeEventHandler;
                GVAR(incomingFingerEHId) = nil;
            };
        };
    },
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(maxRange),
    "SLIDER",
    [LSTRING(maxRange_displayName), LSTRING(maxRange_description)],
    ELSTRING(Common,ACEKeybindCategoryCommon),
    [0, 10, 4, 0],
    nil,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(indicatorForSelf),
    "CHECKBOX",
    [LSTRING(indicatorForSelf_name), LSTRING(indicatorForSelf_description)],
    ELSTRING(Common,ACEKeybindCategoryCommon),
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(indicatorColor),
    "COLOR",
    [LSTRING(indicatorColor_name), LSTRING(indicatorColor_description)],
    ELSTRING(Common,ACEKeybindCategoryCommon),
    [0.83, 0.68, 0.21, 0.75]
] call CBA_Settings_fnc_init;
