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
        onStateEntered = QFUNC(enteredStateUnconscious);
        class DeathAI {
            targetState = "Dead";
            condition = QUOTE(!(_this getVariable [ARR_2(QQGVAR(AIUnconsciousness),GVAR(AIUnconsciousness))]) && {!isPlayer _this});
        };
        class WakeUp {
            targetState = "Injured";
            condition = QEFUNC(medical_status,hasStableVitals);
            events[] = {QEGVAR(medical,WakeUp)};
            onTransition = QUOTE([ARR_2(_this,false)] call EFUNC(medical_status,setUnconsciousState));
        };
        class FatalTransitions {
            targetState = "CardiacArrest";
            events[] = {QEGVAR(medical,FatalVitals), QEGVAR(medical,Bleedout)};
        };
        class FatalInjury {
            targetState = "FatalInjury";
            events[] = {QEGVAR(medical,FatalInjury)};
        };
        class DazedStart {
            targetState = "Dazed";
            condition = QUOTE([ARR_2(_this,true)]call FUNC(conditionDazedShift));
            onTransition = QUOTE([ARR_2(_this,false)] call EFUNC(medical_status,setUnconsciousState));
        };
    };
    class Dazed {
        onState = QUOTE(call FUNC(handleStateDazed));
        onStateEntered = QUOTE(call FUNC(enteredStateDazed));
        onStateLeaving = QUOTE(call FUNC(leftStateDazed));
        class FullHeal {
            targetState = "Default";
            events[] = {QEGVAR(medical,FullHeal)};
        };
        class WakeUp {
            targetState = "Injured";
            condition = QEFUNC(medical_status,hasStableVitals);
            events[] = {QEGVAR(medical,WakeUp)};
        };
        class DazedStop {
            targetState = "Unconscious";
            condition = QUOTE([ARR_2(_this,false)]call FUNC(conditionDazedShift));
        };
        class CriticalInjuryOrVitals {
            targetState = "Unconscious";
            events[] = {QEGVAR(medical,CriticalInjury), QEGVAR(medical,CriticalVitals), QEGVAR(medical,knockOut)};
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
        // Transition state for handling instant death from fatal injuries
        // This state raises the next transition in the same frame
        onStateEntered = QFUNC(enteredStateFatalInjury);
        class SecondChance {
            events[] = {QEGVAR(medical,FatalInjuryInstantTransition)};
            targetState = "CardiacArrest";
            condition = QFUNC(conditionSecondChance);
            onTransition = QFUNC(transitionSecondChance);
        };
        class Death {
            events[] = {QEGVAR(medical,FatalInjuryInstantTransition)};
            targetState = "Dead";
        };
    };
    class CardiacArrest {
        onState = QFUNC(handleStateCardiacArrest);
        onStateEntered = QFUNC(enteredStateCardiacArrest);
        onStateLeaving = QFUNC(leftStateCardiacArrest);
        class DeathAI {
            // If an AI unit reanimates, they will immediately die upon entering unconsciousness if AI Unconsciousness is disabled
            // As a result, we immediately kill the AI unit since cardiac arrest is effectively useless for it
            targetState = "Dead";
            condition = QUOTE(!GVAR(AIUnconsciousness) && {!isPlayer _this});
        };
        class Timeout {
            targetState = "Dead";
            condition = QFUNC(conditionCardiacArrestTimer);
        };
        class Reanimation {
            targetState = "Unconscious";
            events[] = {QEGVAR(medical,CPRSucceeded)};
        };
        class Execution {
            targetState = "Dead";
            condition = QFUNC(conditionExecutionDeath);
            events[] = {QEGVAR(medical,FatalInjury)};
        };
        class Bleedout {
            targetState = "Dead";
            condition = QUOTE((GVAR(cardiacArrestBleedoutEnabled))); // wrap to ensure cba uses this as code and not a direct variable
            events[] = {QEGVAR(medical,Bleedout)};
        };
    };
    class Dead {
        // When the unit is killed it's no longer handled by the statemachine
        onStateEntered = QFUNC(enteredStateDeath);
    };
};
