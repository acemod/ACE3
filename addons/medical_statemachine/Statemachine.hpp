// Manual transitions applied to this statemachine
//  - medical_fnc_handleRespawn:18
class ACE_Medical_StateMachine {
    list = "allUnits select {local _x}";
    skipNull = 1;

    class Default {
        onState = QUOTE(call FUNC(handleStateDefault));
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
        onState = QUOTE(call FUNC(handleStateInjured));
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
        onState = QUOTE(call FUNC(handleStateUnconscious));
        onStateEntered = QUOTE([ARR_2(_this,(true))] call EFUNC(medical,setUnconsciousStatemachine));
        class DeathAI {
            targetState = "Dead";
            condition = QUOTE(!isPlayer _this && {EGVAR(medical,unconsciousConditionAI)});
        };
        class WakeUp {
            targetState = "Injured";
            condition = QUOTE(_this call EFUNC(medical_status,hasStableVitals));
            events[] = {QGVAR(WakeUp)};
            onTransition = QUOTE([ARR_2(_this,(false))] call EFUNC(medical,setUnconsciousStatemachine));
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
        onStateEntered = QUOTE(call FUNC(enteredStateFatalInjury));
        class DeathAI {
            events[] = {QGVAR(FatalInjuryInstantTransition)};
            targetState = "Dead";
            condition = QUOTE(!isPlayer _this && {EGVAR(medical,fatalInjuryConditionAI)});
        };
        class SecondChance {
            events[] = {QGVAR(FatalInjuryInstantTransition)};
            targetState = "CardiacArrest";
            condition = QUOTE(EGVAR(medical,fatalInjuryCondition) > 0);
            onTransition = QUOTE(call FUNC(transitionSecondChance));
        };
        class Death {
            events[] = {QGVAR(FatalInjuryInstantTransition)};
            targetState = "Dead";
            condition = "true";
        };
    };
    class CardiacArrest {
        onStateEntered = QUOTE(call FUNC(enteredStateCardiacArrest));
        onStateLeaving = QUOTE(call FUNC(leftStateCardiacArrest));
        class DeathAI {
            targetState = "Dead";
            condition = QUOTE(!isPlayer _this && {EGVAR(medical,fatalInjuryConditionAI)});
        };
        class Timeout {
            targetState = "Dead";
            condition = QUOTE(call EFUNC(medical,conditionCardiacArrestTimer));
        };
        class Reanimation {
            targetState = "Unconscious";
            events[] = {QGVAR(CPRSucceeded)};
        };
        class Execution {
            targetState = "Dead";
            condition = QUOTE(call EFUNC(medical,conditionExecutionDeath));
            events[] = {QGVAR(FatalInjury)};
        };
    };
    class Dead {
        // TODO: this needs to be handled by a function instead of inline scripts
        // Probably also needs additional logic to deal with edge cases
        onStateEntered = "_this setDamage 1"; // killing a unit also exits the state machine for this unit
    };
};
