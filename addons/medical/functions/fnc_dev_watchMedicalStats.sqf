/*
 * Author: PabstMirror
 * Dev function to watch all medical variables on a unit
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_fnc_dev_watchMedicalStats;
 *
 * Public: Yes
 */
#include "script_component.hpp"

["medical", {

    // Hide when patient display is up because they might overlap
    if (!isNull EGVAR(medical,displayPatientInformationTarget)) exitWith {""};

    private _unit = cursorTarget;
    if (!(_unit isKindOf "CAManBase")) then {_unit = cursorObject};
    if (!(_unit isKindOf "CAManBase")) then {_unit = ACE_player};
    if ((_unit != ACE_player) && {ACE_player getVariable ["ACE_isUnconscious", false]}) then {_unit = ACE_player};
    if (!(_unit isKindOf "CAManBase")) exitWith {"No Unit?"};

    private _return = [];

    // Header:
    _return pushBack format ["<t size='1.2'><t color='#%1'>%2</t> [%3]", (["00FF00", "0000FF"] select (_unit == ACE_player)), [_unit] call EFUNC(common,getName), typeOf _unit];
    _return pushBack "";

    // State:
    private _hasStableVitals = [_unit] call EFUNC(medical,hasStableVitals);
    private _targetState = [_unit, GVAR(STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
    if (!local _unit) then {_targetState = "NotLocal";};
    private _color = switch (_targetState) do {case "Default": {"33FF33"}; case "Injured": {"FF3333"}; case "Unconscious": {"FF8833"}; case "CardiacArrest": {"FF33AA"}; default {"555555"}};
    private _unconcFlag = if (_unit getVariable ["ACE_isUnconscious", false]) then {"[<t color='#FFFFFF'>U</t>]"} else {""};
    _return pushBack format ["<t color='#%1'>State: %2</t> [StableVitals: %3] %4", _color, _targetState, _hasStableVitals, _unconcFlag];

    // Blood:
    private _bloodVolume = _unit getVariable [QEGVAR(medical,bloodVolume), DEFAULT_BLOOD_VOLUME];
    private _bloodLoss = [_unit] call EFUNC(medical,getBloodLoss);
    private _secondsToHeartstop = if (_bloodLoss != 0) then {format ["[<t color ='#FF9999'>Time Left:</t> %1 sec]", (((_bloodVolume - BLOOD_VOLUME_CLASS_4_HEMORRHAGE) max 0) / _bloodLoss) toFixed 1]} else {""};
    _return pushBack format ["Blood: %1", _bloodVolume toFixed 3];
    _return pushBack format [" - [Loss: %1] %2", _bloodLoss toFixed 5, _secondsToHeartstop];

    // Heart:
    private _cardiacOutput = [_unit] call EFUNC(medical,getCardiacOutput);
    private _heartRate = _unit getVariable [QEGVAR(medical,heartRate), DEFAULT_HEART_RATE];
    ([_unit] call EFUNC(medical,getBloodPressure)) params ["_bpLow", "_bpHigh"];
    _return pushBack format ["CardiacOutput %1", _cardiacOutput toFixed 5];
    _return pushBack format [" - [HR: %1] [BP: %2 / %3]", _heartRate toFixed 1, _bpLow toFixed 1, _bpHigh toFixed 1];

    // Pain:
    private _pain = _unit getVariable [QEGVAR(medical,pain), 0];
    private _painSuppress = _unit getVariable [QEGVAR(medical,painSuppress), 0];
    private _painLevel = [_unit] call EFUNC(medical,getPainLevel);
    _return pushBack format ["Effective Pain: %1", _painLevel toFixed 3];
    _return pushBack format [" - [Pain: %1] [Suppress: %2]", _pain toFixed 3, _painSuppress toFixed 3];

    // Damage:
    private _damage = _unit getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];
    private _limping = if (_unit getVariable [QEGVAR(medical_engine,isLimping), false]) then {"[<t color ='#FFCC22'> Limping </t>]"} else {""};
    _return pushBack format ["Damage: [H: %1] [B: %2] %3", (_damage select 0) toFixed 2, (_damage select 1) toFixed 2, _limping];
    _return pushBack format ["[LA:%1] [RA: %2] [LL:%3] [RL: %4]", (_damage select 2) toFixed 2, (_damage select 3) toFixed 2, (_damage select 4) toFixed 2, (_damage select 5) toFixed 2];


    // Tourniquets:
    _return pushBack "------- Tourniquets: -------";
    private _tourniquets = _unit getVariable [QEGVAR(medical,tourniquets), [0,0,0,0,0,0]];
    private _occludedMedications = _unit getVariable [QEGVAR(medical,occludedMedications), []];
    {
        private _tPartNum = _forEachIndex;
        if (_x != 0) then {
            _return pushBack format ["%1 [Time On: %2]", GVAR(SELECTIONS) select _tPartNum, (CBA_missionTime - _x) toFixed 1];
        };
        {
            _x params ["", "_medClassname", "_medPartNum"];
            if (_medPartNum == _tPartNum) then {
                _return pushBack format [" - Occluded Med: %1", _medClassname];
            };
        } forEach _occludedMedications;
    } forEach _tourniquets;


    // Wounds:
    _return pushBack "------- Wounds: -------";
    private _wounds = _unit getVariable [QEGVAR(medical,openWounds), []];
    {
        _x params ["", "_xClassID", "_xBodyPartN", "_xAmountOf", "_xBleeding", "_xDamage", "_xCategory"];
        _return pushBack format ["%1: [%2-%3] [x%4] [Bld: %5] [Dmg: %6]", GVAR(SELECTIONS) select _xBodyPartN, _xClassID, _xCategory, _xAmountOf toFixed 1, _xBleeding toFixed 4, _xDamage toFixed 2];
    } forEach _wounds;


    // IVs:
    _return pushBack "------- IVs: -------";
    private _ivBags = _unit getVariable [QEGVAR(medical,ivBags), []];
    {
        _x params ["_xVolumeAdded", "_xType", "_xBodyPartN"];
        _return pushBack format ["%1: %2 [%3 ml]", GVAR(SELECTIONS) select _xBodyPartN, _xType, _xVolumeAdded];
    } forEach _ivBags;

    // Footer:
    _return pushBack "</t>";

    // Return:
    _return joinString "<br/>"
}, [30]] call EFUNC(common,watchVariable);

