#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ace_infoDisplayChanged", {
    params ["_display", "_type"];
    TRACE_2("ace_infoDisplayChanged",_display,_type);

    if (_type == "Aircraft") then {
        if (!(missionNamespace getVariable [QEGVAR(ui,vehicleAltitude), true])) exitWith {TRACE_1("Disabled in ace_ui",EGVAR(ui,vehicleAltitude));};
        [{
            params ["_display"];
            private _oldCtrl = _display displayCtrl 122;
            if (isNull _oldCtrl) exitWith {WARNING("old ctrl (122) is null");};
            private _newCtrl = _display ctrlCreate [QGVAR(aslAltitudeText), -1];
            TRACE_2("",_oldCtrl,_newCtrl);

            private _pos = ctrlPosition _oldCtrl;
            _newCtrl ctrlSetPosition _pos;
            _newCtrl ctrlCommit 0;

            _oldCtrl ctrlSetFade 1;
            _oldCtrl ctrlCommit 0;

            [{
                _this ctrlSetText format ["%1", floor ((getPosASL vehicle ACE_player) select 2)];
                isNull _this
            }, {
                TRACE_2("ctrl deleted",_this,isNull _this);
            }, _newCtrl] call CBA_fnc_waitUntilAndExecute;
        }, [_display]] call CBA_fnc_execNextFrame;
    };
}] call CBA_fnc_addEventHandler;
