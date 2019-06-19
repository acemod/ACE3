// Manual transitions applied to this statemachine
//  - fnc_resetStateDefault on unit respawn
class ACE_Medical_StateMachine {
    list = QUOTE(call EFUNC(common,getLocalUnits));
    skipNull = 1;

    class Default {
        onState = QFUNC(handleStateDefault);
        class Injury {
            targetState = "Injured";
            events[] = {QEGVAR(medical,injured), QEGVAR(medical,LoweredVitals)};
        };
        class CriticalInjuryOrVitals {
            targetState = "Unconscious";
            events[] = {QEGVAR(medical,CriticalInjury), QEGVAR(medical,CriticalVitals), QEGVAR(medical,knockOut)};
        };
        class FatalVitals {
            targetState = "CardiacArrest";
            events[] = {QEGVAR(medical,FatalVitals), QEGVAR(medical,Bleedout)};
        };
        class FatalInjury {
            targetState = "FatalInjury";
            events[] = {QEGVAR(medical,FatalInjury)};
        };
    };
    class Injured {
        onState = QFUNC(handleStateInjured);
        class FullHeal {
            targetState = "Default";
            events[] = {QEGVAR(medical,FullHeal)};
        };
        class CriticalInjuryOrVitals {
            targetState = "Unconscious";
            events[] = {QEGVAR(medical,CriticalInjury), QEGVAR(medical,CriticalVitals), QEGVAR(medical,knockOut)};
        };
        class FatalVitals {
            targetState = "CardiacArrest";
            events[] = {QEGVAR(medical,FatalVitals), QEGVAR(medical,Bleedout)};
        };
        class FatalInjury {
            targetState = "FatalInjury";
            events[] = {QEGVAR(medical,FatalInjury)};
        };
    };
    class Unconscious {
        onState = QFUNC(handleStateUnconscious);
        onStateEntered = QUOTE([ARR_2(_this,(true))] call EFUNC(medical_status,setUnconscious));
        class DeathAI {
            targetState = "Dead";
            condition = QUOTE(!isPlayer _this && {GVAR(unconsciousConditionAI)});
            onTransition = QUOTE(_this setVariable [ARR_2(QQGVAR(deathReason),'Unconscious (AI)')];);
        };
        class WakeUp {
            targetState = "Injured";
            condition = QEFUNC(medical_status,hasStableVitals);
            events[] = {QEGVAR(medical,WakeUp)};
            onTransition = QUOTE([ARR_2(_this,(false))] call EFUNC(medical_status,setUnconscious));
        };
        class FatalTransitions {
            targetState = "CardiacArrest";
            events[] = {QEGVAR(medical,FatalVitals), QEGVAR(medical,Bleedout)};
        };
        class FatalInjury {
            targetState = "FatalInjury";
            events[] = {QEGVAR(medical,FatalInjury)};
        };
    };
    class FatalInjury {
        // Transition state for handling instant death
        // This state raises the next transition in the same frame
        onStateEntered = QFUNC(enteredStateFatalInjury);
        class DeathAI {
            events[] = {QEGVAR(medical,FatalInjuryInstantTransition)};
            targetState = "Dead";
            condition = QUOTE(!isPlayer _this && {GVAR(fatalInjuryConditionAI)});
            onTransition = QUOTE(_this setVariable [ARR_2(QQGVAR(deathReason),'Fatal Injury (AI)')];);
        };
        class SecondChance {
            events[] = {QEGVAR(medical,FatalInjuryInstantTransition)};
            targetState = "CardiacArrest";
            condition = QUOTE(GVAR(fatalInjuryCondition) > 0);
            onTransition = QFUNC(transitionSecondChance);
        };
        class Death {
            events[] = {QEGVAR(medical,FatalInjuryInstantTransition)};
            targetState = "Dead";
            condition = "true";
            onTransition = QUOTE(_this setVariable [ARR_2(QQGVAR(deathReason),'Fatal Injury')];);
        };
    };
    class CardiacArrest {
        onStateEntered = QFUNC(enteredStateCardiacArrest);
        onStateLeaving = QFUNC(leftStateCardiacArrest);
        class DeathAI {
            targetState = "Dead";
            condition = QUOTE(!isPlayer _this && {GVAR(fatalInjuryConditionAI)});
            onTransition = QUOTE(_this setVariable [ARR_2(QQGVAR(deathReason),'Cardiac Arrest (AI)')];);
        };
        class Timeout {
            targetState = "Dead";
            condition = QFUNC(conditionCardiacArrestTimer);
            onTransition = QUOTE(_this setVariable [ARR_2(QQGVAR(deathReason),'Cardiac Arrest (Brain Damage)')];);
        };
        class Reanimation {
            targetState = "Unconscious";
            events[] = {QEGVAR(medical,CPRSucceeded)};
        };
        class Execution {
            targetState = "Dead";
            condition = QFUNC(conditionExecutionDeath);
            events[] = {QEGVAR(medical,FatalInjury)};
            onTransition = QUOTE(_this setVariable [ARR_2(QQGVAR(deathReason),'Fatal Injury (Execution)')];);
        };
        class Bleedout {
            targetState = "Dead";
            events[] = {QEGVAR(medical,Bleedout)};
            onTransition = QUOTE(_this setVariable [ARR_2(QQGVAR(deathReason),'Bleedout')];);
        };
    };
    class Dead {
        // When the unit is killed it's no longer handled by the statemachine
        onStateEntered = QFUNC(enteredStateDeath);
    };
};
