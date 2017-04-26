#define DEBUG_MODE_FULL
#include "script_component.hpp"

["ace_interactMenuClosed", {[objNull, 0] call FUNC(displayPatientInformation);}] call CBA_fnc_addEventHandler;

//Handle Deleting Bodies and creating litter on Server:
if (isServer) then {
    ["ace_placedInBodyBag", FUNC(serverRemoveBody)] call CBA_fnc_addEventHandler;
};

["ace_unconscious", {
    params ["_unit", "_status"];

    if (local _unit) then {
        if (_status) then {
            _unit setVariable ["tf_voiceVolume", 0, true];
            _unit setVariable ["tf_unable_to_use_radio", true, true];
            _unit setVariable ["acre_sys_core_isDisabled", true, true];
        } else {
            _unit setVariable ["tf_voiceVolume", 1, true];
            _unit setVariable ["tf_unable_to_use_radio", false, true];
            _unit setVariable ["acre_sys_core_isDisabled", false, true];
        };
    };
}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

[missionNamespace, "ACE_setCustomAimCoef", QUOTE(ADDON), {
    private _pain = [ACE_player] call FUNC(getPainLevel);

    linearConversion [0, 1, _pain, 1, 5, true];
}] call EFUNC(common,arithmeticSetSource);

#ifdef DEBUG_MODE_FULL

["medical", {
    private _unit = cursorTarget;
    private _return = [];
    
    if (!(_unit isKindOf "CAManBase")) then {_unit = cursorObject};
    if (!(_unit isKindOf "CAManBase")) then {_unit = player};
    
    if (_unit isKindOf "CAManBase") then {  
        // Header:
        _return pushBack format ["<t color='#%1'>%2 [%3]</t>", (["00FF00", "0000FF"] select (_unit == player)), [_unit] call EFUNC(common,getName), typeOf _unit];
        _return pushBack "";
        
        // State:
        private _hasStableVitals = [_unit] call FUNC(hasStableVitals);
        private _targetState = [_unit, GVAR(STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
        private _color = switch (_targetState) do {case "Default": {"33FF33"}; case "Injured": {"FF3333"}; case "Unconscious": {"FF8833"}; case "CardiacArrest": {"FF33AA"}; default {"333333"}};
        _return pushBack format ["<t color='#%1'>State: %2</t> [Stable Vitals: %3]", _color, _targetState, _hasStableVitals];
    
        // Blood:
        private _bloodVolume = _unit getVariable [QGVAR(bloodVolume), DEFAULT_BLOOD_VOLUME];
        private _bloodLoss = [_unit] call FUNC(getBloodLoss);
        private _secondsToHeartstop = if (_bloodLoss != 0) then {format ["[Time Left: %1]", (((_bloodVolume - BLOOD_VOLUME_CLASS_4_HEMORRHAGE) max 0) / _bloodLoss) toFixed 1]} else {""};
        _return pushBack format ["Blood: %1 [Loss: %2] %3", _bloodVolume toFixed 3, _bloodLoss toFixed 5, _secondsToHeartstop];

        // Vitals:
        private _cardiacOutput = [_unit] call FUNC(getCardiacOutput);
        private _heartRate = _unit getVariable [QGVAR(heartRate), DEFAULT_HEART_RATE];
        ([_unit] call FUNC(getBloodPressure)) params ["_bpLow", "_bpHigh"];
        _return pushBack format ["Output %1 [HR: %2] [BP: %3 / %4]", _cardiacOutput toFixed 4, _heartRate toFixed 1, _bpLow toFixed 1, _bpHigh toFixed 1];

        // Pain:
        private _pain = _unit getVariable [QGVAR(pain), 0];
        private _painSuppress = _unit getVariable [QGVAR(painSuppress), 0];
        private _painLevel = [_unit] call FUNC(getPainLevel);
        _return pushBack format ["Effective Pain: %1 [pain: %2] [suppress: %3]", _painLevel toFixed 4, _pain toFixed 3, _painSuppress toFixed 3];
        
        // Tourniquets:
        private _tourniquets = _unit getVariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
        {
            if (_x != 0) then {
                _return pushBack format ["Tourniquet on %1 [Time On: %2]", GVAR(SELECTIONS) select _forEachIndex, (CBA_missionTime - _x)];
            };
        } forEach _tourniquets;        
        
        // Wounds:
        private _wounds = _unit getVariable [QGVAR(openWounds), []];
        {
            _return pushBack format ["Wound: %1", _x];
        } forEach _wounds;
    };
    _return joinString "<br/>";
}, [15]] call ace_common_fnc_watchVariable;


    [{!isNull findDisplay 46}, {
        INFO("Creating Debug Display");
        if (!isNull (uiNamespace getVariable [QGVAR(debugControl), controlNull])) then {
            ctrlDelete (uiNamespace getVariable [QGVAR(debugControl), controlNull]); // cleanup on SP Restart
        };
        private _ctrl = findDisplay 46 ctrlCreate ["RscText", -1];
        _ctrl ctrlSetPosition [
            safeZoneX,
            safeZoneY,
            safeZoneW,
            40 * pixelH
        ];
        _ctrl ctrlSetFontHeight (40 * pixelH);
        _ctrl ctrlSetTextColor [0.6, 0, 0, 1];
        _ctrl ctrlCommit 0;
        uiNamespace setVariable [QGVAR(debugControl), _ctrl];

        [{
            private _playerState = [ACE_player, GVAR(STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
            (uiNamespace getVariable [QGVAR(debugControl), controlNull]) ctrlSetText format ["Player state: %1", _playerState];

            if (!isNull cursorTarget && {cursorTarget isKindOf "CAManBase"}) then {
                private _targetState = [cursorTarget, GVAR(STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
                drawIcon3D ["", [0.6, 0, 0, 1], cursorTarget modelToWorldVisual (cursorTarget selectionPosition "pelvis"), 0, 0, 0, format ["State: %1", _targetState], 2, 40 * pixelH, "RobotoCondensed"];
            };
        }, 0 ,[]] call CBA_fnc_addPerFrameHandler;
    }, []] call CBA_fnc_waitUntilAndExecute;
#endif
