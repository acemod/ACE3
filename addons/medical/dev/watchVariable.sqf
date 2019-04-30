#include "\z\ace\addons\medical\script_component.hpp"

["medical", {

    // Hide when patient display is up because they might overlap
    if (!isNull EGVAR(medical_gui,displayPatientInformationTarget)) exitWith {""};

    private _unit = cursorTarget;
    if (!(_unit isKindOf "CAManBase")) then {_unit = cursorObject};
    if (!(_unit isKindOf "CAManBase")) then {_unit = ACE_player};
    if ((_unit != ACE_player) && {IS_UNCONSCIOUS(ACE_player)}) then {_unit = ACE_player};
    if (!(_unit isKindOf "CAManBase")) exitWith {"No Unit?"};

    private _return = [];

    // Header:
    _return pushBack format ["<t size='1.2'><t color='#%1'>%2</t> [%3]", (["00FF00", "0000FF"] select (_unit == ACE_player)), [_unit] call EFUNC(common,getName), typeOf _unit];
    _return pushBack "";

    // State:
    private _hasStableVitals = [_unit] call EFUNC(medical_status,hasStableVitals);
    private _targetState = [_unit, EGVAR(medical,STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
    if (!local _unit) then {_targetState = "NotLocal";};
    private _color = switch (_targetState) do {case "Default": {"33FF33"}; case "Injured": {"FF3333"}; case "Unconscious": {"FF8833"}; case "CardiacArrest": {"FF33AA"}; default {"555555"}};
    private _unconcFlag = if IS_UNCONSCIOUS(_unit) then {"[<t color='#FFFFFF'>U</t>]"} else {""};
    _return pushBack format ["<t color='#%1'>State: %2</t> [StableVitals: %3] %4", _color, _targetState, _hasStableVitals, _unconcFlag];

    // Blood:
    private _bloodVolume = GET_BLOOD_VOLUME(_unit);
    private _woundBleeding = GET_WOUND_BLEEDING(_unit);
    private _bloodLoss = GET_BLOOD_LOSS(_unit);
    private _hemorrhage = GET_HEMORRHAGE(_unit);
    private _isBleeding = if (IS_BLEEDING(_unit)) then {"<t color ='#FF9999'>Bleeding</t>"} else {""};
    private _secondsToHeartstop = if (_bloodLoss != 0) then {format ["[<t color ='#FF9999'>Time Left:</t> %1 sec]", (((_bloodVolume - BLOOD_VOLUME_CLASS_4_HEMORRHAGE) max 0) / _bloodLoss) toFixed 0]} else {""};
    _return pushBack format ["Blood: %1 [Hemorrhage: %2] %3", _bloodVolume toFixed 3, _hemorrhage, _isBleeding];
    _return pushBack format [" - [W: %1 T: %2] %3", _woundBleeding toFixed 4, _bloodLoss toFixed 4, _secondsToHeartstop];

    // Heart:
    private _cardiacOutput = [_unit] call EFUNC(medical_status,getCardiacOutput);
    private _heartRate = GET_HEART_RATE(_unit);
    GET_BLOOD_PRESSURE(_unit) params ["_bpLow", "_bpHigh"];
    _return pushBack format ["CardiacOutput %1", _cardiacOutput toFixed 5];
    _return pushBack format [" - [HR: %1] [BP: %2 / %3]", _heartRate toFixed 1, _bpLow toFixed 1, _bpHigh toFixed 1];

    // Pain:
    private _pain = GET_PAIN(_unit);
    private _painSuppress = GET_PAIN_SUPPRESS(_unit);
    private _painLevel = GET_PAIN_PERCEIVED(_unit);
    private _isInPain = IS_IN_PAIN(_unit);
    _return pushBack format ["Effective Pain: %1 [%2]", _painLevel toFixed 3, _isInPain];
    _return pushBack format [" - [Pain: %1] [Suppress: %2]", _pain toFixed 3, _painSuppress toFixed 3];

    // Damage:
    private _damage = _unit getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];
    private _limping = if (_unit getVariable [QEGVAR(medical,isLimping), false]) then {"[<t color ='#FFCC22'> Limping </t>]"} else {""};
    _return pushBack format ["Damage: [H: %1] [B: %2] %3", (_damage select 0) toFixed 2, (_damage select 1) toFixed 2];
    _return pushBack format ["[LA:%1] [RA: %2] [LL:%3] [RL: %4]", (_damage select 2) toFixed 2, (_damage select 3) toFixed 2, (_damage select 4) toFixed 2, (_damage select 5) toFixed 2];

    _return pushBack format ["Hitpoints: [HHed:%1] [HBod: %2]", (_unit getHitPointDamage "HitHead") toFixed 2, (_unit getHitPointDamage "HitBody") toFixed 2];
    _return pushBack format ["[HHnd:%1] [HLeg: %2] %3", (_unit getHitPointDamage "HitHands") toFixed 2, (_unit getHitPointDamage "HitLegs") toFixed 2, _limping];


    // Tourniquets:
    _return pushBack "------- Tourniquets: -------";
    private _tourniquets = GET_TOURNIQUETS(_unit);
    private _occludedMedications = _unit getVariable [QEGVAR(medical,occludedMedications), []];
    {
        private _tPartNum = _forEachIndex;
        if (_x != 0) then {
            _return pushBack format ["%1 [Time On: %2]", ALL_SELECTIONS select _tPartNum, (CBA_missionTime - _x) toFixed 1];
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
        _return pushBack format ["%1: [%2-%3] [x%4] [Bld: %5] [Dmg: %6]", ALL_SELECTIONS select _xBodyPartN, _xClassID, _xCategory, _xAmountOf toFixed 1, _xBleeding toFixed 4, _xDamage toFixed 2];
    } forEach _wounds;

    // Bandaged Wounds:
    _return pushBack "------- Bandaged Wounds: -------";
    private _wounds = _unit getVariable [QEGVAR(medical,bandagedWounds), []];
    {
        _x params ["", "_xClassID", "_xBodyPartN", "_xAmountOf", "_xBleeding", "_xDamage", "_xCategory"];
        _return pushBack format ["%1: [%2-%3] [x%4] [Bld: %5] [Dmg: %6]", ALL_SELECTIONS select _xBodyPartN, _xClassID, _xCategory, _xAmountOf toFixed 1, _xBleeding toFixed 4, _xDamage toFixed 2];
    } forEach _wounds;

    // Stitched Wounds:
    _return pushBack "------- Stitched Wounds: -------";
    private _wounds = _unit getVariable [QEGVAR(medical,stitchedWounds), []];
    {
        _x params ["", "_xClassID", "_xBodyPartN", "_xAmountOf", "_xBleeding", "_xDamage", "_xCategory"];
        _return pushBack format ["%1: [%2-%3] [x%4] [Bld: %5] [Dmg: %6]", ALL_SELECTIONS select _xBodyPartN, _xClassID, _xCategory, _xAmountOf toFixed 1, _xBleeding toFixed 4, _xDamage toFixed 2];
    } forEach _wounds;

    // IVs:
    _return pushBack "------- IVs: -------";
    private _ivBags = _unit getVariable [QEGVAR(medical,ivBags), []];
    {
        _x params ["_xVolumeAdded", "_xType", "_xBodyPartN"];
        _return pushBack format ["%1: %2 [%3 ml]", ALL_SELECTIONS select _xBodyPartN, _xType, _xVolumeAdded];
    } forEach _ivBags;

    // Medications:
    _return pushBack "------- Medications: -------";
    private _hrTargetAdjustment = 0;
    private _painSupressAdjustment = 0;
    private _peripheralResistanceAdjustment = 0;
    private _medicationCounts = [];
    private _rawMedications = (_unit getVariable [VAR_MEDICATIONS, []]) apply {
        _x params ["_medication", "_timeAdded", "_timeTillMaxEffect", "_maxTimeInSystem", "_hrAdjust", "_painAdjust", "_flowAdjust"];
        private _timeInSystem = CBA_missionTime - _timeAdded;
        private _index = _medicationCounts find _medication;
        if (_index < 0) then {
            _index = _medicationCounts pushBack _medication;
            _medicationCounts pushBack 0
        };
        _medicationCounts set [(_index + 1), (_medicationCounts select (_index + 1)) + linearConversion [_timeTillMaxEffect, _maxTimeInSystem, _timeInSystem, 1, 0, true]];

        private _effectRatio = (((_timeInSystem / _timeTillMaxEffect) ^ 2) min 1) * (_maxTimeInSystem - _timeInSystem) / _maxTimeInSystem;
        _hrTargetAdjustment = _hrTargetAdjustment + _hrAdjust * _effectRatio;
        _painSupressAdjustment = _painSupressAdjustment + _painAdjust * _effectRatio;
        _peripheralResistanceAdjustment = _peripheralResistanceAdjustment + _flowAdjust * _effectRatio;
        format ["%1 [%2 / %3][%4][%5,%6,%7]",_medication,_timeInSystem toFixed 0,_maxTimeInSystem toFixed 0, _effectRatio toFixed 2, _hrAdjust toFixed 1, _painAdjust toFixed 2, _flowAdjust toFixed 1];
    };
    _return pushBack format ["Adjusts: [HR %1][PS %2][PR %3]", _hrTargetAdjustment toFixed 2, _painSupressAdjustment toFixed 2, _peripheralResistanceAdjustment toFixed 2];
    for "_i" from 0 to (count _medicationCounts) - 1 step 2 do {
        _return pushBack format ["-%1: %2", _medicationCounts select _i, _medicationCounts select _i + 1];
    };
    _return pushBack "------- Medications Raw: -------";
    _return append _rawMedications;

    // Footer:
    _return pushBack "</t>";

    // Return:
    _return joinString "<br/>"
}, [40]] call EFUNC(common,watchVariable);

