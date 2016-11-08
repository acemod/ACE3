class ACE_Medical_StateMachine {
    class Default {
        onState = QUOTE(DFUNC(handleStateDefault));
        class Injury {
            targetState = "Injured";
            events[] = {QGVAR(TakenInjury)};
        };
        class CriticalInjuryOrVitals {
            targetState = "Unconscious";
            events[] = {QGVAR(InjuryCritical), QGVAR(CriticalVitals)};
        };
        class FatalInjury {
            targetState = "FatalInjury";
            events[] = {QGVAR(InjuryFatal)};
        };
    };
    class Injured {
        onState = QUOTE(DFUNC(handleStateInjured));
        class FullHeal {
            targetState = "Default";
            events[] = {QGVAR(FullHeal)};
        };
        class LastWoundTreated {
            targetState = "Default";
            events[] = {QGVAR(LastWoundTreated)};
        };
        class CriticalInjuryOrVitals {
            targetState = "Unconscious";
            events[] = {QGVAR(InjuryCritical), QGVAR(CriticalVitals)};
        };
        class FatalVitals {
            targetState = "CardiacArrest";
            events[] = {QGVAR(FatalVitals)};
        };
        class FatalInjury {
            targetState = "FatalInjury";
            events[] = {QGVAR(InjuryFatal)};
        };
    };
    class Unconscious {
        onState = QUOTE(DFUNC(handleStateUnconscious));
        onStateEntered = QUOTE(DFUNC(enteredUnconsciousState));
        onStateLeaving = "_this setVariable ['ACE_isUnconscious', false, true];";
        class WakeUpFromKnockDown {
            targetState = "Injured";
            condition = QUOTE(_this call FUNC(hasStableVitals));
            events[] = {QGVAR(MinUnconsciousTimer)};
        };
        class WakeUpStable {
            targetState = "Injured";
            condition = "unitUnconsciousTimer >= MinUnconsciousTimer";
            events[] = {QGVAR(VitalsWentStable)};
        };
        class FatalTransitions {
            targetState = "CardiacArrest";
            events[] = {QGVAR(FatalVitals), QGVAR(UnconsciousTimerRanOut)};
        };
        class FatalInjury {
            targetState = "FatalInjury";
            events[] = {QGVAR(InjuryFatal)};
        };
    };
    class FatalInjury {
        // Transition state for handling instant death
        // This state raises the next transition in the same frame
        onStateEntered = QUOTE(DFUNC(enteredStateFatalInjury));
        class InstantDeathPrevented {
            events[] = {QGVAR(FatalInjuryInstantTransition)};
            targetState = "CardiacArrest";
            condition = QUOTE(!GVAR(enableInstantDeath));
            onTransition = QUOTE(DFUNC(transitionInstantDeathPrevented));
        };
        class InstantDeath {
            events[] = {QGVAR(FatalInjuryInstantTransition)};
            targetState = "Dead";
            condition = "true";
        };
    };
    class CardiacArrest {
        onStateEntered = QUOTE(DFUNC(enteredStateCardiacArrest));
        onStateLeaving = '_this setVariable [QGVAR(cardiacArrestStart), nil]';
        class Death {
            targetState = "Dead";
            condition = QUOTE(DFUNC(conditionCardiacArrestDeath));
        };
        class Reanimated {
            targetState = "Unconscious";
            events[] = {QGVAR(CPRSucceeded)};
        };
        class Execution {
            targetState = "Dead";
            condition = QUOTE(DFUNC(conditionExecutionDeath));
            events[] = {QGVAR(InjuryFatal)};
        };
    };
    class Dead {
        onStateEntered = "_this setDamage 1"; // killing a unit also exits the state machine for this unit
    };
};
