class ACE_Medical_StateMachine {
    class Default {
        onState = QUOTE(DFUNC(handleStateDefault));
        onStateEntered = "";
        onStateLeaving = "";
        class Injury {
            targetState = "Injured";
            events[] = {"TakenInjury"};
        };
        class CriticalInjuryOrVitals {
            targetState = "Unconscious";
            events[] = {"InjuryCritical", "CriticalVitals"};
        };
        class FatalInjuryOrVitals {
            targetState = "Dead";
            events[] = {"FatalVitals", "InjuryFatal"};
        };
    };
    class Injured {
        onState = QUOTE(DFUNC(handleStateInjured));
        onStateEntered = "";
        onStateLeaving = "";

        class FullHeal {
            targetState = "Default";
            events[] = {"FullHeal"};
        };
        class LastWoundTreated {
            targetState = "Default";
            events[] = {"LastWoundTreated"};
        };
        class CriticalInjuryOrVitals {
            targetState = "Unconscious";
            events[] = {"InjuryCritical", "CriticalVitals"};
        };
        class FatalInjuryOrVitals {
            targetState = "Dead";
            events[] = {"FatalVitals", "InjuryFatal"};
        };
    };
    class Unconscious {
        onState = QUOTE(DFUNC(handleStateUnconscious));
        onStateEntered = QUOTE(DFUNC(enteredUnconscious)); // set unconscious animation & state
        onStateLeaving = QUOTE(DFUNC(leavingUnconscious)); // leave unconscious animation & state
        class WakeUpFromKnockDown {
            targetState = "Injured";
            condition = QUOTE(_unit call FUNC(hasStableVitals));
            events[] = {"MinUnconsciousTimer"};
        };
        class WakeUpStable {
            targetState = "Injured";
            condition = "unitUnconsciousTimer >= MinUnconsciousTimer";
            events[] = {"VitalsWentStable"};
        };
        class FatalTransitions {
            targetState = "Dead";
            events[] = {"InjuryFatal", "FatalVitals", "UnconsciousTimerRanOut"};
        };
    };
    class Dead {
        onStateEntered = "(_this select 0) setDamage 1"; // killing a unit also exits the state machine for this unit
    };
    class Revive {
        onState = QUOTE(DFUNC(handleStateRevive));
        onStateEntered = QUOTE(DFUNC(enteredRevive)); // set unconscious animation & state
        onStateLeaving = QUOTE(DFUNC(leavingRevive)); // leave unconscious animation & state
        class FullHeal {
            targetState = "Default";
            events[] = {"fullyHealed"};
            onTransition = "";
        };
        class Revived {
            targetState = "Injured";
            events[] = {"Revived"};
            onTransition = "";
        };
        class TimerRanOut {
            targetState = "Dead";
            condition = "";
            events[] = {"ReviveTimer"};
            onTransition = "";
        };
        class FatalTransitions {
            targetState = "Dead";
            condition = QGVAR(killOnFatalDamageInRevive);
            events[] = {"FatalInjury"};
        };
    };
};
