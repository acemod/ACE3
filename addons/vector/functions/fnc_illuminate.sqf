#include "script_component.hpp"
/*
 * Author: commy2
 *
 *
 * Arguments:
 * 0: Enable illumination <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_vector_fnc_illuminate
 *
 * Public: No
 */

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

if (_this select 0) then {
    {
        private _control = _dlgVector displayCtrl _x;
        private _string = ctrlText _control;
        private _index = _string find ".paa";

        if (_index != -1 && {_string find "_illum.paa" == -1}) then {
            _string = toArray _string;
            _string resize _index;

            _control ctrlSetText format ["%1_illum.paa", toString _string];
        };
    } forEach ILLUM_CONTROLS;
} else {
    {
        private _control = _dlgVector displayCtrl _x;
        private _string = ctrlText _control;
        private _index = _string find "_illum.paa";

        if (_index != -1) then {
            _string = toArray _string;
            _string resize _index;

            _control ctrlSetText format ["%1.paa", toString _string];
        };
    } forEach ILLUM_CONTROLS;
};
