#include "..\script_component.hpp"
/*
 * Authors: Ruthberg
 * Updates the range card data.
 *
 * Arguments:
 * 0: Zero range <NUMBER>
 * 1: Bore height <NUMBER>
 * 2: Ammo class <STRING>
 * 3: Magazine class <STRING>
 * 4: Weapon class <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [100, 3.81, "B_65x39_Caseless", "30Rnd_65x39_caseless_mag", "arifle_MXM_F"] call ace_rangecard_fnc_updateRangeCard
 *
 * Public: No
 */

disableSerialization;

params ["_zeroRange", "_boreHeight", "_ammoClass", "_magazineClass", "_weaponClass"];

// "" being in any of the classes should never happen
if ("" in [_ammoClass, _magazineClass, _weaponClass]) exitWith {
    if (GVAR(rangeCardOpened)) exitWith {};

    closeDialog 0;
};

{
    ctrlDelete _x;
} forEach GVAR(controls);

GVAR(controls) = [];

private _display = uiNamespace getVariable [QGVAR(display), displayNull];
private _control = controlNull;

for "_row" from 0 to 49 do {
    _control = (_display ctrlCreate ["RangeCard_RscText", 790000 + _row]);
    _control ctrlSetPosition [safeZoneX + 0.183, safeZoneY + 0.3765 + 0.02695 * _row, 0.062, 0.025];
    _control ctrlSetTextColor ([[0, 0, 0, 1], [1, 1, 1, 1]] select (_row in [0, 8, 18, 28, 38, 48]));
    _control ctrlCommit 0;
    _control ctrlSetText str (100 + _row * 50);
    GVAR(controls) pushBack _control;
};

lnbClear IDC_WIND_LEAD_CAPTION_LIST;
lnbClear IDC_TEMPERATURE_CAPTION_LIST_1;
lnbClear IDC_TEMPERATURE_CAPTION_LIST_2;

private _ammoConfig = _ammoClass call EFUNC(advanced_ballistics,readAmmoDataFromConfig);
private _weaponConfig = _weaponClass call EFUNC(advanced_ballistics,readWeaponDataFromConfig);

private _barrelTwist = _weaponConfig select 0;
private _barrelLength = _weaponConfig select 2;

private _airFriction = _ammoConfig select 0;
private _bc = (_ammoConfig select 6) select 0;
private _transonicStabilityCoef = _ammoConfig select 4;
private _dragModel = _ammoConfig select 5;
private _atmosphereModel = _ammoConfig select 8;

private _isABenabled = (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) && (_bc != 0);
private _useBarrelLengthInfluence = (
    _isABenabled &&
    {missionNamespace getVariable [QEGVAR(advanced_ballistics,barrelLengthInfluenceEnabled), false]}
);
private _useAmmoTemperatureInfluence = (
    _isABenabled &&
    {missionNamespace getVariable [QEGVAR(advanced_ballistics,ammoTemperatureEnabled), false]}
);

private _muzzleVelocity = 0;

if (_useBarrelLengthInfluence && _barrelLength > 0) then {
    _muzzleVelocity = [_barrelLength, _ammoConfig select 10, _ammoConfig select 11, 0] call EFUNC(advanced_ballistics,calculateBarrelLengthVelocityShift);
};

if (_muzzleVelocity == 0) then {
    private _initSpeedCoef = getNumber (configFile >> "CfgWeapons" >> _weaponClass >> "initSpeed");
    private _initSpeed = 0;

    if (_initSpeedCoef > 0) then {
        _initSpeed = _initSpeedCoef;
    } else {
        _initSpeed = getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "initSpeed");

        if (_initSpeedCoef < 0) then {
            _initSpeed = _initSpeed * -_initSpeedCoef;
        };
    };

    _muzzleVelocity = _initSpeed;
};

ctrlSetText [IDC_CAPTION_TEXT_1, format ["%1'' - %2 gr (%3)", round ((_ammoConfig select 1) * 39.3700787) / 1000, round ((_ammoConfig select 3) * 15.4323584), _ammoClass]];

if (_barrelLength > 0) then {
    if (_useBarrelLengthInfluence && _barrelTwist > 0) then {
        ctrlSetText [IDC_CAPTION_TEXT_3, format ["Barrel: %1'' 1:%2'' twist", round (2 * _barrelLength * 0.0393700787) / 2, round (_barrelTwist * 0.0393700787)]];
    } else {
        ctrlSetText [IDC_CAPTION_TEXT_3, format ["Barrel: %1''", round (2 * _barrelLength * 0.0393700787) / 2]];
    };
};

lnbAddRow [IDC_WIND_LEAD_CAPTION_LIST, ["4mps Wind(MRADs)", "1mps LEAD(MRADs)"]];

if (_isABenabled) then {
    lnbAddRow [IDC_WIND_LEAD_CAPTION_LIST, ["Air/Ammo Temp", "Air/Ammo Temp"]];

    lnbAddRow [IDC_TEMPERATURE_CAPTION_LIST_1, ["-15°C", " -5°C", "  5°C", " 10°C", " 15°C", " 20°C", " 25°C", " 30°C", " 35°C"]];
    lnbAddRow [IDC_TEMPERATURE_CAPTION_LIST_2, ["-15°C", " 10°C", " 35°C", "-15°C", " 10°C", " 35°C"]];
};

ctrlSetText [IDC_ZERO_RANGE_TEXT, format ["%1m ZERO", round _zeroRange]];

if (_isABenabled) then {
    ctrlSetText [IDC_CAPTION_TEXT_2, format ["Drop Tables for B.P.: %1mb; Corrected for MVV at Air/Ammo Temperatures -15-35 °C", round (EGVAR(scopes,zeroReferenceBarometricPressure) * 100) / 100]];
    ctrlSetText [IDC_BAROMETRIC_PRESSURE_TEXT , format ["B.P.: %1mb", round (EGVAR(scopes,zeroReferenceBarometricPressure) * 100) / 100]];
} else {
    ctrlSetText [IDC_CAPTION_TEXT_2, ""];
    ctrlSetText [IDC_BAROMETRIC_PRESSURE_TEXT , ""];
};

(GVAR(rangeCardData) getOrDefaultCall [[_zeroRange, _boreHeight, _ammoClass, _weaponClass, _isABenabled, _useBarrelLengthInfluence, _useAmmoTemperatureInfluence], {
    private _scopeBaseAngle = if (!_isABenabled) then {
        parseNumber (("ace" callExtension ["ballistics:zero_vanilla", [_zeroRange, _muzzleVelocity, _airFriction, _boreHeight]]) select 0)
    } else {
        parseNumber (("ace" callExtension ["ballistics:zero_advanced", [_zeroRange, _muzzleVelocity, _boreHeight, EGVAR(scopes,zeroReferenceTemperature), EGVAR(scopes,zeroReferenceBarometricPressure), EGVAR(scopes,zeroReferenceHumidity), _bc, _dragModel, _atmosphereModel]]) select 0)
    };

    private _rangeCardDataMVs = ["", "", "", "", "", "", "", "", ""];
    private _rangeCardDataElevation = [[], [], [], [], [], [], [], [], []];
    private _rangeCardDataWindage = [[], [], [], [], [], [], [], [], []];
    private _rangeCardDataLead = [[], [], [], [], [], [], [], [], []];

    if (_useAmmoTemperatureInfluence) then {
        private _mvShift = 0;
        private _mv = 0;
        private _result = [];

        {
            _mvShift = [_ammoConfig select 9, _x] call EFUNC(advanced_ballistics,calculateAmmoTemperatureVelocityShift);
            _mv = _muzzleVelocity + _mvShift;

            _result = [
                _scopeBaseAngle,
                _boreHeight,
                _airFriction,
                _mv,
                _x,
                EGVAR(scopes,zeroReferenceBarometricPressure),
                EGVAR(scopes,zeroReferenceHumidity),
                200,
                4,
                1,
                RANGE_CARD_END_RANGE,
                _bc,
                _dragModel,
                _atmosphereModel,
                _transonicStabilityCoef,
                _isABenabled
            ] call FUNC(calculateRangeCard);

            _rangeCardDataMVs set [_forEachIndex, _result select 0];
            _rangeCardDataElevation set [_forEachIndex, _result select 1];
            _rangeCardDataWindage set [_forEachIndex, _result select 2];
            _rangeCardDataLead set [_forEachIndex, _result select 3];
        } forEach [-15, -5, 5, 10, 15, 20, 25, 30, 35];
    } else {
        private _result = [
            _scopeBaseAngle,
            _boreHeight,
            _airFriction,
            _muzzleVelocity,
            15,
            EGVAR(scopes,zeroReferenceBarometricPressure),
            EGVAR(scopes,zeroReferenceHumidity),
            200,
            4,
            1,
            RANGE_CARD_END_RANGE,
            _bc,
            _dragModel,
            _atmosphereModel,
            _transonicStabilityCoef,
            _isABenabled
        ] call FUNC(calculateRangeCard);

        _rangeCardDataMVs set [3, _result select 0];
        _rangeCardDataElevation set [3, _result select 1];
        _rangeCardDataWindage set [3, _result select 2];
        _rangeCardDataLead set [3, _result select 3];
    };

    private _lastValidRow = [];
    private _fillValueElevation = ["", "###"] select _isABenabled;
    private _fillValueWindageLead = ["", "##"] select _isABenabled;

    for "_i" from 0 to 9 do {
        _lastValidRow pushBack count (_rangeCardDataElevation select _i);

        (_rangeCardDataElevation select _i) resize [50, _fillValueElevation];
        (_rangeCardDataWindage select _i) resize [50, _fillValueWindageLead];
        (_rangeCardDataLead select _i) resize [50, _fillValueWindageLead];
    };

    [_rangeCardDataElevation, _rangeCardDataWindage, _rangeCardDataLead, _rangeCardDataMVs, _lastValidRow]
}, true]) params ["_rangeCardDataElevation", "_rangeCardDataWindage", "_rangeCardDataLead", "_rangeCardDataMVs", "_lastValidRow"];

lnbAddRow [IDC_TEMPERATURE_CAPTION_LIST_1, _rangeCardDataMVs];

// Elevation columns
private _posX = 0;

for "_column" from 0 to 8 do {
    _posX = safeZoneX + 0.249 + _column * 0.055;

    for "_row" from 0 to 49 do {
        _control = _display ctrlCreate ["RangeCard_RscText", 90000 + _column * 100 + _row];
        _control ctrlSetPosition [_posX, safeZoneY + 0.3765 + 0.02695 * _row, 0.052, 0.025];
        _control ctrlCommit 0;
        _control ctrlSetText ((_rangeCardDataElevation select _column) select _row);
        _control ctrlSetTextColor [0, 0, 0, [1, 0.6] select (_row >= (_lastValidRow select _column))];
        GVAR(controls) pushBack _control;
    };
};

// Display these lead and wind columns only
private _leadWindColumnsIndices = [0, 3, 8];
private _leadWindColumnIndex = 0;
private _posX2 = 0;
private _posY = 0;
private _color = [];

// Wind and lead columns
for "_column" from 0 to 2 do {
    _leadWindColumnIndex = _leadWindColumnsIndices select _column;
    _posX = safeZoneX + 0.743 + _column * 0.049;
    _posX2 = _posX + 0.149;

    for "_row" from 0 to 49 do {
        _color = [0, 0, 0, [1, 0.6] select (_row >= (_lastValidRow select _leadWindColumnIndex))];
        _posY = safeZoneY + 0.3765 + 0.02695 * _row;

        _control = _display ctrlCreate ["RangeCard_RscText", 90000 + (9 + _column) * 100 + _row];
        _control ctrlSetPosition [_posX, _posY, 0.047, 0.025];
        _control ctrlCommit 0;
        _control ctrlSetText ((_rangeCardDataWindage select _leadWindColumnIndex) select _row);
        _control ctrlSetTextColor _color;
        GVAR(controls) pushBack _control;

        _control = _display ctrlCreate ["RangeCard_RscText", 90000 + (12 + _column) * 100 + _row];
        _control ctrlSetPosition [_posX2, _posY, 0.047, 0.025];
        _control ctrlCommit 0;
        _control ctrlSetText ((_rangeCardDataLead select _leadWindColumnIndex) select _row);
        _control ctrlSetTextColor _color;
        GVAR(controls) pushBack _control;
    };
};

ctrlSetText [IDC_FOOTNOTE_TEXT_1, "For best results keep ammunition at ambient air temperature. Tables calculated for the above listed barrel"];
ctrlSetText [IDC_FOOTNOTE_TEXT_2, format ["and load with optic mounted %1'' above line of bore.", round ((_boreHeight / 2.54) * 10) / 10]];
