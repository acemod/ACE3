class ACE_Medical_AI_StateMachine {
    list = "allUnits select {(!isPlayer _x) && {local _x}}";

    class Initial {
        class Injured {
            targetState = "Injured";
            condition = QUOTE(call FUNC(isInjured));
        };
        class HealUnit {
            targetState = "HealUnit";
            condition = QUOTE((call FUNC(isSafe)) && {call FUNC(wasRequested)});
        };
    };

    class Injured {
        #ifdef DEBUG_MODE_FULL
            onState = "systemChat format [""%1 is injured"", _this]";
        #endif

        class InSafety {
            targetState = "Safe";
            condition = QUOTE(call FUNC(isSafe));
        };
    };

    class Safe {
        #ifdef DEBUG_MODE_FULL
            onState = "systemChat format [""%1 is injured, but safe"", _this]";
        #endif

        class RequestMedic {
            targetState = "HealSelf";
            condition = QUOTE(call FUNC(canRequestMedic));
            onTransition = QUOTE(call FUNC(requestMedic));
        };
        class HealSelf {
            targetState = "HealSelf";
            condition = "true";
        };
    };

    class HealSelf {
        onState = QUOTE(call FUNC(healSelf));
        onStateLeaving = QUOTE(_this setVariable [QGVAR(treatmentOverAt), nil]);

        class Initial {
            targetState = "Initial";
            condition = QUOTE(!(call FUNC(isInjured)));
        };
        class Injured {
            targetState = "Injured";
            condition = QUOTE(!(call FUNC(isSafe)));
        };
    };

    class HealUnit {
        onState = QUOTE(call FUNC(healUnit));

        class Initial {
            targetState = "Initial";
            condition = QUOTE(!(call FUNC(wasRequestedAsMedic || {call FUNC(isSafe)})));
        };
    };
};
