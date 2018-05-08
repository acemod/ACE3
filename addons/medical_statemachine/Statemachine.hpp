// Manual transitions applied to this statemachine
//  - medical_fnc_handleRespawn:18
class ACE_Medical_StateMachine {
    list = "allUnits select {local _x}";
    skipNull = 1;

    class Default {
        onState = QFUNC(handleStateDefault);
        class Injury {
            targetState = "Injured";
            events[] = {QGVAR(Injury)};
        };
        class CriticalInjuryOrVitals {
            targetState = "Unconscious";
            events[] = {QGVAR(CriticalInjury), QGVAR(CriticalVitals), QGVAR(knockOut)};
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
    class Injured {
        onState = QFUNC(handleStateInjured);
        class FullHeal {
            targetState = "Default";
            events[] = {QGVAR(FullHeal)};
        };
        class CriticalInjuryOrVitals {
            targetState = "Unconscious";
            events[] = {QGVAR(CriticalInjury), QGVAR(CriticalVitals), QGVAR(knockOut)};
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
        onState = QFUNC(handleStateUnconscious);
        onStateEntered = QUOTE([ARR_2(_this,(true))] call FUNC(setUnconsciousStatemachine));
        class DeathAI {
            targetState = "Dead";
            condition = QUOTE(!isPlayer _this && {GVAR(unconsciousConditionAI)});
        };
        class WakeUp {
            targetState = "Injured";
            condition = QUOTE(_this call EFUNC(medical_status,hasStableVitals));
            events[] = {QGVAR(WakeUp)};
            onTransition = QUOTE([ARR_2(_this,(false))] call FUNC(setUnconsciousStatemachine));
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
        onStateEntered = QFUNC(enteredStateFatalInjury);
        class DeathAI {
            events[] = {QGVAR(FatalInjuryInstantTransition)};
            targetState = "Dead";
            condition = QUOTE(!isPlayer _this && {GVAR(fatalInjuryConditionAI)});
        };
        class SecondChance {
            events[] = {QGVAR(FatalInjuryInstantTransition)};
            targetState = "CardiacArrest";
            condition = QUOTE(GVAR(fatalInjuryCondition) > 0);
            onTransition = QFUNC(transitionSecondChance);
        };
        class Death {
            events[] = {QGVAR(FatalInjuryInstantTransition)};
            targetState = "Dead";
            condition = "true";
        };
    };
    class CardiacArrest {
        onStateEntered = QFUNC(enteredStateCardiacArrest);
        onStateLeaving = QFUNC(leftStateCardiacArrest);
        class DeathAI {
            targetState = "Dead";
            condition = QUOTE(!isPlayer _this && {GVAR(fatalInjuryConditionAI)});
        };
        class Timeout {
            targetState = "Dead";
            condition = QEFUNC(medical,conditionCardiacArrestTimer);
        };
        class Reanimation {
            targetState = "Unconscious";
            events[] = {QGVAR(CPRSucceeded)};
        };
        class Execution {
            targetState = "Dead";
            condition = QEFUNC(medical,conditionExecutionDeath);
            events[] = {QGVAR(FatalInjury)};
        };
    };
    class Dead {
        onStateEntered = "_this setDamage 1"; // killing a unit also exits the state machine for this unit
    };
};
