#include "script_component.hpp"

#define MAX_COUNT 30
#define ANIM_TIME 10

private _display = findDisplay 0;

if (!scriptDone (_display getVariable [QGVAR(versionTooltip), scriptNull])) exitWith {};

_display setVariable [QGVAR(versionTooltip), [_display] spawn {
    disableSerialization;

    params ["_display"];

    private _allControls = [];

    private _fnc_create = {
        private _ctrl = _display ctrlCreate ["RscPicture", -1];

        // randomize size
        private _size = selectRandom [safezoneW / 30, safezoneW / 20, safezoneW / 15];
        private _position = [
            random safezoneW + safezoneX - _size / 2,
            - random (safezoneH / 5) + safezoneY - _size,
            _size,
            _size
        ];

        _ctrl ctrlSetPosition _position;
        _ctrl ctrlCommit 0;

        // pls ignore
        _ctrl ctrlSetText QPATHTOF(data\icon_banana_ca.paa);

        // animate with random speed
        _position set [1, 1 - safezoneY];
        _ctrl ctrlSetPosition _position;
        _ctrl ctrlCommit (ANIM_TIME * random [0.5, 1, 1.5]);

        _allControls pushBack _ctrl;
    };

    while {!isNull _display} do {
        _allControls = _allControls select {
            if (ctrlCommitted _x) then {
                ctrlDelete _x;
                false
            } else {
                true
            };
        };

        while {count _allControls < MAX_COUNT} do {
            call _fnc_create;
        };

        uiSleep 3;
    };
}];
