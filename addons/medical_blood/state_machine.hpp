class GVAR(stateMachine) {
    list = QUOTE(allUnits select {[_x] call FUNC(isBleeding)});
    skipNull = 1;
    class Bleeding {
        onState = QUOTE(call FUNC(onBleeding));
    };
};
