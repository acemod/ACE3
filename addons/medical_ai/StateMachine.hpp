class GVAR(stateMachine) {
    list = QUOTE(call EFUNC(common,getLocalUnits));
    skipNull = 1;

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
        onStateLeaving = QUOTE(_this setVariable [ARR_2(QUOTE(QGVAR(treatmentOverAt)),nil)]);

        class Initial {
            // Go back to initial state when done healing
            targetState = "Initial";
            condition = QUOTE( \
                !(call FUNC(isInjured)) \
                && {_this getVariable [ARR_2(QUOTE(QGVAR(treatmentOverAt)),CBA_missionTime)] <= CBA_missionTime} \
            );
        };
        class Injured {
            // Stop treating when it's no more safe
            targetState = "Injured";
            condition = QUOTE( \
                !(call FUNC(isSafe)) \
                && {_this getVariable [ARR_2(QUOTE(QGVAR(treatmentOverAt)),CBA_missionTime)] <= CBA_missionTime} \
            );
        };
    };

    class HealUnit {
        onState = QUOTE(call FUNC(healUnit));
        onStateLeaving = QUOTE(_this setVariable [ARR_2(QUOTE(QGVAR(treatmentOverAt)),nil)]);

        class Initial {
            // Go back to initial state when done healing or it's no more safe to treat
            targetState = "Initial";
            condition = QUOTE( \
                !((call FUNC(wasRequested)) && {call FUNC(isSafe)}) \
                && {_this getVariable [ARR_2(QUOTE(QGVAR(treatmentOverAt)),CBA_missionTime)] <= CBA_missionTime} \
            );
        };
        class Injured {
            // Treating yourself has priority
            targetState = "Injured";
            condition = QUOTE( \
                (call FUNC(isInjured)) \
                && {_this getVariable [ARR_2(QUOTE(QGVAR(treatmentOverAt)),CBA_missionTime)] <= CBA_missionTime} \
            );
        };
    };
};
