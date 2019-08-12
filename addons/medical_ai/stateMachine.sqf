GVAR(stateMachine) = [{call EFUNC(common,getLocalUnits)}, true] call CBA_statemachine_fnc_create;

// Add states [statemachine, onState, onStateEntered, onStateLeaving, name]
[GVAR(stateMachine), {}, {}, {}, "Initial"] call CBA_statemachine_fnc_addState;

[GVAR(stateMachine), {
    #ifdef DEBUG_MODE_FULL
    systemChat format ["%1 is injured", _this];
    #endif
}, {}, {}, "Injured"] call CBA_statemachine_fnc_addState;

[GVAR(stateMachine), {
    #ifdef DEBUG_MODE_FULL
    systemChat format ["%1 is injured and safe", _this];
    #endif
}, {}, {}, "Safe"] call CBA_statemachine_fnc_addState;

[GVAR(stateMachine), LINKFUNC(healSelf), {}, {
    _this setVariable [QGVAR(treatmentOverAt), nil];
}, "HealSelf"] call CBA_statemachine_fnc_addState;

[GVAR(stateMachine), LINKFUNC(healUnit), {}, {
    _this setVariable [QGVAR(treatmentOverAt), nil];
}, "HealUnit"] call CBA_statemachine_fnc_addState;

// Add Transistions [statemachine, originalState, targetState, condition, onTransition, name]
[GVAR(stateMachine), "Initial", "Injured", LINKFUNC(isInjured), {}, "Injured"] call CBA_statemachine_fnc_addTransition;
[GVAR(stateMachine), "Initial", "HealUnit", {(call FUNC(isSafe)) && FUNC(wasRequested)}, {}, "HealUnit"] call CBA_statemachine_fnc_addTransition;

[GVAR(stateMachine), "Injured", "Safe", LINKFUNC(isSafe), {}, "InSafety"] call CBA_statemachine_fnc_addTransition;

[GVAR(stateMachine), "Safe", "HealSelf", LINKFUNC(canRequestMedic), LINKFUNC(requestMedic), "RequestMedic"] call CBA_statemachine_fnc_addTransition;
[GVAR(stateMachine), "Safe", "HealSelf", {true}, {}, "HealSelf"] call CBA_statemachine_fnc_addTransition;


[GVAR(stateMachine), "HealSelf", "Initial", { // Go back to initial state when done healing
    !(call FUNC(isInjured)) && {isNil {_this getVariable QGVAR(currentTreatment)}}
}, {
    #ifdef DEBUG_MODE_FULL
    systemChat format ["%1 finished healing themself", _this];
    #endif
}, "Initial"] call CBA_statemachine_fnc_addTransition;

[GVAR(stateMachine), "HealSelf", "Injured", { // Stop treating when it's no more safe
    !(call FUNC(isSafe)) && {isNil {_this getVariable QGVAR(currentTreatment)}}
}, {
    #ifdef DEBUG_MODE_FULL
    systemChat format ["%1 is no longer safe", _this];
    #endif
}, "Injured"] call CBA_statemachine_fnc_addTransition;


[GVAR(stateMachine), "HealUnit", "Initial", { // Go back to initial state when done healing or it's no more safe to treat
    !((call FUNC(wasRequested)) && FUNC(isSafe)) && {isNil {_this getVariable QGVAR(currentTreatment)}}
}, {
    #ifdef DEBUG_MODE_FULL
    systemChat format ["%1 finished healing someone", _this];
    #endif
}, "Initial"] call CBA_statemachine_fnc_addTransition;

[GVAR(stateMachine), "HealUnit", "Injured", { // Treating yourself has priority
    (call FUNC(isInjured)) && {isNil {_this getVariable QGVAR(currentTreatment)}}
}, {
    #ifdef DEBUG_MODE_FULL
    systemChat format ["%1 was injured while healing someone", _this];
    #endif
}, "Injured"] call CBA_statemachine_fnc_addTransition;
