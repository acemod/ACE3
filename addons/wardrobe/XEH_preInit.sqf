#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

GVAR(inProgress) = false;

GVAR(replaceHashmap) = createHashMapFromArray [
    [TYPE_HEADGEAR, LINKFUNC(replaceOther)    ],
    [TYPE_UNIFORM,  LINKFUNC(replaceContainer)],
    [TYPE_VEST,     LINKFUNC(replaceContainer)],
    [TYPE_BACKPACK, LINKFUNC(replaceContainer)],
    [TYPE_HMD,      LINKFUNC(replaceOther)    ],
    [TYPE_GOGGLE,   LINKFUNC(replaceOther)    ]
];

// Cache Wardrobe Replace Exceptions
private _map = createHashMap;
{
    _map set [
        configName _x,
        [
            toLower getText (_x >> "mode"),
            getText (_x >> "code") call CBA_fnc_convertStringCode
        ]
    ];
} forEach ("true" configClasses (configFile >> QGVAR(exceptions)));
GVAR(exceptions) = _map;

[
    QGVAR(exceptions),
    { _this call (GVAR(exceptions) get (_this#0) select 1) }
] call CBA_fnc_addEventHandler;

// Variables to transfer when changing containers (key is varName, values is global-broadcast)
GVAR(containerVarsToTransfer) = createHashMapFromArray [
    [toLower QEGVAR(gunbag,gunbagWeapon), true],
    [toLower QEGVAR(movement,vload), true],
    [toLower "radio_settings", true] // From TFAR
];

ADDON = true;
