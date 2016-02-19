// ----------------------------------------------------------------------------
#define DEBUG_MODE_FULL
#include "script_component.hpp"

#ifndef TEST_DEFINED_AND_OP
if (true) exitWith {};
#endif

// ----------------------------------------------------------------------------

LOG('Testing EventHandlers');

TEST_DEFINED(QFUNC(_handleNetEvent),"");
TEST_DEFINED(QFUNC(addEventHandler),"");
TEST_DEFINED(QFUNC(localEvent),"");
TEST_DEFINED(QFUNC(targetEvent),"");
TEST_DEFINED(QFUNC(globalEvent),"");
TEST_DEFINED(QFUNC(serverEvent),"");
TEST_DEFINED(QFUNC(removeAllEventHandlers),"");
TEST_DEFINED(QFUNC(removeEventHandler),"");

private _result = ["A", {}] call ace_common_fnc_addEventHandler;
private _expected = 0;
TEST_DEFINED_AND_OP(_result,==,_expected,"Adding first A EH");

_result = ["A", {GVAR(test_A2) = _this}] call ace_common_fnc_addEventHandler;
_expected = 1;
TEST_DEFINED_AND_OP(_result,==,_expected,"Adding second A EH");

_result = ["A", {GVAR(test_A3) = _this}] call ace_common_fnc_addEventHandler;
_expected = 2;
TEST_DEFINED_AND_OP(_result,==,_expected,"Adding third A EH");

GVAR(test_A2) = -1;
["A", 11] call FUNC(localEvent);
_expected = 11;
_result = GVAR(test_A2);
TEST_DEFINED_AND_OP(_result,==,_expected,"Test Local Event");

//Remove 2nd EH
["A", 1] call FUNC(removeEventHandler);

GVAR(test_A2) = -1;
GVAR(test_A3) = -1;
["A", 22] call FUNC(localEvent);
_expected = -1;
_result = GVAR(test_A2);
TEST_DEFINED_AND_OP(_result,==,_expected,"Test 2nd (removed) EH");
_expected = 22;
_result = GVAR(test_A3);
TEST_DEFINED_AND_OP(_result,==,_expected,"Test 3rd Event");

//Remove All EH:
["A"] call FUNC(removeAllEventHandlers);

GVAR(test_A3) = -1;
["A", 77] call FUNC(localEvent);
_expected = -1;
_result = GVAR(test_A3);
TEST_DEFINED_AND_OP(_result,==,_expected,"Test 3rd is removed after removeAll");

//Much harder to test network events
TRACE_2("testing network events",isServer,isDedicated);

["B", {GVAR(test_B) = _this}] call ace_common_fnc_addEventHandler;

GVAR(test_B) = -1;
["B", 33] call FUNC(globalEvent);
_expected = 33;
_result = GVAR(test_B);
TEST_DEFINED_AND_OP(_result,==,_expected,"Test globalEvent");

GVAR(test_B) = -1;
["B", 44] call FUNC(serverEvent);
_expected = if (isServer) then {44} else {-1};
_result = GVAR(test_B);
TEST_DEFINED_AND_OP(_result,==,_expected,"Test serverEvent");

