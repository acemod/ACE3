#include "..\script_component.hpp"

#define TVAR(varName) TRIPLES(ADDON,test,varName)
#define QTVAR(varName) QUOTE(TRIPLES(ADDON,test,varName))

// LinkIsGrim
// ["ace_arsenal_verifyLoadout"] call ace_common_fnc_runTests;

diag_log text format ["--- Running suite verifyLoadout --- "];

// Setup
private _fnc_beforeAll = {
    GVAR(virtualItemsFlat) = createHashMap;
    TVAR(loadoutVerified_EHID) = [QGVAR(loadoutVerified), {
        TVAR(raisedEvent_loadoutVerified) = true;
        TVAR(eventOK_loadoutVerified) = _this isEqualTypeAll [[], createHashMap, [], [], []];
    }] call CBA_fnc_addEventHandler;

    TVAR(loadoutVerified_EHID) != -1 && !isNil QGVAR(virtualItemsFlat)
};

private _fnc_beforeEach = {
    params ["_availableItems", "_expectedEvents"];
    _availableItems = _availableItems apply EFUNC(common,getConfigName);
    {
        GVAR(virtualItemsFlat) set [_x, nil];
    } forEach _availableItems;

    {
        missionNamespace setVariable [format [QTVAR(raisedEvent_%1), _x], false];
        missionNamespace setVariable [format [QTVAR(okEvent_%1), _x], false];
    } forEach _expectedEvents;

    true
};

private _fnc_afterAll = {
    GVAR(virtualItemsFlat) = nil;
    [QGVAR(loadoutVerified), TVAR(loadoutVerified_EHID)] call CBA_fnc_removeEventHandler;
};

private _fnc_afterEach = {
    params ["_availableItems", "_expectedEvents"];
    _availableItems = _availableItems apply EFUNC(common,getConfigName);
    {
        GVAR(virtualItemsFlat) deleteAt _x;
    } forEach _availableItems;

    private _eventsOk = true;
    {
        if !(
            missionNamespace getVariable format [QTVAR(raisedEvent_%1), _x] &&
            missionNamespace getVariable format [QTVAR(okEvent_%1), _x]
        ) then {
            _eventsOk = false;
            break;
        };
    } forEach _expectedEvents;

    {
        missionNamespace setVariable [format [QTVAR(raisedEvent_%1), _x], nil];
        missionNamespace setVariable [format [QTVAR(okEvent_%1), _x], nil];
    } forEach _expectedEvents;

    _eventsOk && GVAR(virtualItemsFlat) isEqualTo createHashMap
};

private _fnc_test = {
    params ["_inputLoadout", "_expectedLoadout"];

    private _outputLoadout = [_inputLoadout] call FUNC(verifyLoadout);

    _outputLoadout isEqualTo _expectedLoadout;
};

private _loadout_B_Soldier_F = [getUnitLoadout configFile >> "CfgVehicles" >> "B_Soldier_F", createHashMap];
private _items_B_Soldier_F = (flatten (_loadout_B_Soldier_F select 0)) select {_x isEqualType ""};

private _test_allItemsAvailable = ["All items available - expect no change",
    [ // test params
        _loadout_B_Soldier_F, // input loadout
        _loadout_B_Soldier_F // expected loadout
    ],
    [ // setup params (BeforeEach)
        _items_B_Soldier_F, // available items
        ["loadoutVerified"] // expected events
    ],
    [ // cleanup params (AfterEach)
        _items_B_Soldier_F, // available items
        ["loadoutVerified"] // expected events
    ]
];

private _tests = [
    _test_allItemsAvailable
];

private _failedTests = [];
private _passedTests = [];

private _setupOk = call _fnc_beforeAll;
if (!_setupOk) exitWith {
    diag_log text format ["--- Suite verifyLoadout failed at setup --- "];
    false
};

{
    params ["_testName", "_testParams", "_setupParams", "_cleanupParams"];

    private _testData = createHashMap;
    diag_log text format ["--- Setting up test - %1 --- ", _testName];
    private _beforeEachOk = _setupParams call _fnc_beforeEach;
    _testData set ["beforeEachOk", _beforeEachOk];

    diag_log text format ["--- Running test - %1 --- ", _testName];
    private _testOk = _testParams call _fnc_test;
    _testData set ["testOk", _testOk];

    diag_log text format ["--- Cleaning up test - %1 --- ", _testName];
    private _afterEachOk = _cleanupParams call _fnc_afterEach;
    _testData set ["afterEachOk", _afterEachOk];

    private _passed = _beforeEachOk && _testOk && _afterEachOk;
    ([_failedTests, _passedTests] select _passed) pushBack [_testName, _testData];
} forEach _tests;

{
    diag_log text format ["--- Test failed - %1 --- ", _x];
} forEach _failedTests;

private _cleanupOk = call _fnc_afterAll;
if (!_cleanupOk) exitWith {
    diag_log text format ["--- Suite verifyLoadout failed at cleanup --- "];
    false
};

if (_failedTests isNotEqualTo []) exitWith {
    diag_log text format ["--- Suite verifyLoadout failed - [%1/%2] tests passed --- ", count _passedTests, count _tests];
    false
};

diag_log text format ["--- Suite verifyLoadout passed - [%1/%2] tests passed --- ", count _passedTests, count _tests];
true
