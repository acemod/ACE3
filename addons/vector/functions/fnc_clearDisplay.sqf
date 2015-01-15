/*

by commy2

Clears the vectors control items.

*/
#include "script_component.hpp"

private "_dlgVector";

disableSerialization;
_dlgVector = GETUVAR(ACE_dlgVector,displayNull);

switch (_this select 0) do {
    case ("azimuth"): {
        private ["_ctrlDigit5", "_ctrlDigit6", "_ctrlDigit7", "_ctrlDigit8"];

        _ctrlDigit5 = _dlgVector displayCtrl 1315;
        _ctrlDigit6 = _dlgVector displayCtrl 1316;
        _ctrlDigit7 = _dlgVector displayCtrl 1317;
        _ctrlDigit8 = _dlgVector displayCtrl 1318;

        _ctrlDigit5 ctrlSetText "";
        _ctrlDigit6 ctrlSetText "";
        _ctrlDigit7 ctrlSetText "";
        _ctrlDigit8 ctrlSetText "";
    };

    case ("distance"): {
        private ["_ctrlDigit1", "_ctrlDigit2", "_ctrlDigit3", "_ctrlDigit4"];

        _ctrlDigit1 = _dlgVector displayCtrl 1311;
        _ctrlDigit2 = _dlgVector displayCtrl 1312;
        _ctrlDigit3 = _dlgVector displayCtrl 1313;
        _ctrlDigit4 = _dlgVector displayCtrl 1314;

        _ctrlDigit1 ctrlSetText "";
        _ctrlDigit2 ctrlSetText "";
        _ctrlDigit3 ctrlSetText "";
        _ctrlDigit4 ctrlSetText "";
    };
};
