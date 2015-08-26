/*
 * Author: ?
 * ?
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */


[{
    if (isNull (findDisplay 46)) exitWith {};
    if (time < 1) exitWith {};
    findDisplay 46 displayAddEventHandler ["MouseZChanged", FUNC(handleScrollWheel)];
    [false] call FUNC(disableUserInput);
}, 0, []] CBA_fnc_addPerFrameHandler;
