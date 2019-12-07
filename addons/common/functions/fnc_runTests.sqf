#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Run test functions.
 *
 * Arguments:
 * 0: Specific test to run (default is to run all) <STRING> (default: #all)
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_common_fnc_runTests
 * ["fcs"] call ace_common_fnc_runTests
 *
 * Public: Yes
 */

params [["_specificTest", "#all", [""]]];

private _startTime = diag_tickTime;
private _fails = [];
private _total = 0;

INFO_1("ace_common_fnc_runTests starting for [%1]", _specificTest);

{
    private _testName = configName _x;
    if ((_specificTest == "#all") || {_specificTest == _testName}) then {
        _total = _total + 1;
        private _testFile = getText _x;
        diag_log text format ["----- Starting Testing %1 [%2] -----", _testName, _testFile];
        private _return = ([nil] apply (compile preProcessFileLineNumbers _testFile)) select 0;
        if ((isNil "_return") || {!(_return isEqualTo true)}) then {
            systemChat format ["Test [%1] Failed", _testName];
            diag_log text format ["----- Finished Testing %1 [Failed] -----", _testName];
            _fails pushBack _testName;
        } else {
            diag_log text format ["----- Finished Testing %1 [Passed] -----", _testName];
        };
    };
} forEach (configProperties [configFile >> "ACE_Tests"]);

INFO_1("ace_common_fnc_runTests finished in %1 ms", (1000 * (diag_tickTime - _startTime)) toFixed 1);
INFO_2("[%1 / %2] Tests Passed", (_total - (count _fails)), _total);
if (!(_fails isEqualTo [])) then {
    INFO_1("Failed: %1", _fails);
};
