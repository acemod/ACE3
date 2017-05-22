class ACE_Medical_StateMachine {
    list = "allUnits select {local _x}";
    skipNull = 1;

    class Default {
        onState = QUOTE(DFUNC(handleStateDefault));
        class Injury {
            targetState = "Injured";
            events[] = {QGVAR(Injury)};
        };
        class CriticalInjuryOrVitals {
            targetState = "Unconscious";
            events[] = {QGVAR(CriticalInjury), QGVAR(CriticalVitals)};
        };
        class FatalInjury {
            targetState = "FatalInjury";
            events[] = {QGVAR(FatalInjury)};
        };
    };
    class Injured {
        onState = QUOTE(DFUNC(handleStateInjured));
        class FullHeal {
            targetState = "Default";
            events[] = {QGVAR(FullHeal)};
        };
        class CriticalInjuryOrVitals {
            targetState = "Unconscious";
            events[] = {QGVAR(CriticalInjury), QGVAR(CriticalVitals)};
        };
        class FatalVitals {
            targetState = "CardiacArrest";
            events[] = {QGVAR(FatalVitals)};
        };
        class FatalInjury {
            targetState = "FatalInjury";
            events[] = {QGVAR(FatalInjury)};
        };
    };
    class Unconscious {
        onState = QUOTE(DFUNC(handleStateUnconscious));
        onStateEntered = QUOTE([ARR_2(_this,(true))] call FUNC(setUnconscious));
        class WakeUp {
            targetState = "Injured";
            condition = QUOTE(_this call FUNC(hasStableVitals));
            events[] = {QGVAR(WakeUp)};
            onTransition = QUOTE([ARR_2(_this,(false))] call FUNC(setUnconscious));
        };
        class FatalTransitions {
            targetState = "CardiacArrest";
            events[] = {QGVAR(FatalVitals)};
        };
        class FatalInjury {
            targetState = "FatalInjury";
            events[] = {QGVAR(FatalInjury)};
        };
    };
    class FatalInjury {
        // Transition state for handling instant death
        // This state raises the next transition in the same frame
        onStateEntered = QUOTE(DFUNC(enteredStateFatalInjury));
        class SecondChance {
            events[] = {QGVAR(FatalInjuryInstantTransition)};
            targetState = "CardiacArrest";
            condition = QUOTE(DFUNC(conditionFromFatalToCardiac));
            onTransition = QUOTE(DFUNC(transitionSecondChance));
        };
        class SecondChanceAI {
            events[] = {QGVAR(FatalInjuryInstantTransition)};
            targetState = "CardiacArrest";
            //conditionFromFatalToCardiac
            condition = QUOTE(DFUNC(conditionFromFatalToCardiac));
            onTransition = QUOTE(DFUNC(transitionSecondChance));
        };
        class Death {
            events[] = {QGVAR(FatalInjuryInstantTransition)};
            targetState = "Dead";
            condition = "true";
        };
    };
    class CardiacArrest {
        onStateEntered = QUOTE(DFUNC(enteredStateCardiacArrest));
        onStateLeaving = QUOTE(DFUNC(leftStateCardiacArrest));
        class Timeout {
            targetState = "Dead";
            condition = QUOTE(DFUNC(conditionCardiacArrestTimer));
        };
        class Reanimation {
            targetState = "Unconscious";
            events[] = {QGVAR(CPRSucceeded)};
        };
        class Execution {
            targetState = "Dead";
            condition = QUOTE(DFUNC(conditionExecutionDeath));
            events[] = {QGVAR(FatalInjury)};
        };
    };
    class Dead {
        onStateEntered = "_this setDamage 1"; // killing a unit also exits the state machine for this unit
    };
};
