#define COMPONENT medical
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_MEDICAL
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#define TREATMENT_AIRWAY(ITEM)         {[_this select 0,_this select 1,call FUNC(getSelectedBodyPart),ITEM,'airway'] call FUNC(handleTreatment)}
#define TREATMENT_ADVANCED(ITEM)     {[_this select 0,_this select 1,call FUNC(getSelectedBodyPart),ITEM,'advanced'] call FUNC(handleTreatment)}
#define TREATMENT_BANDAGE(ITEM)     {[_this select 0,_this select 1,call FUNC(getSelectedBodyPart),ITEM,'bandage'] call FUNC(handleTreatment)}
#define TREATMENT_MEDICATION(ITEM)     {[_this select 0,_this select 1,call FUNC(getSelectedBodyPart),ITEM,'medication'] call FUNC(handleTreatment)}
#define TREATMENT_OTHER(ITEM)         {[_this select 0,_this select 1,call FUNC(getSelectedBodyPart),ITEM,'other'] call FUNC(handleTreatment)}

#define ADD_TREATMENT_AIRWAY(TITLE,TOOLTIP,ITEM)         [TITLE,TOOLTIP,{[_this select 0,_this select 1,ITEM] call FUNC(hasEquipment)},TREATMENT_AIRWAY(ITEM),'airway'] call FUNC(addTreatmentOption)
#define ADD_TREATMENT_ADVANCED(TITLE,TOOLTIP,ITEM)         [TITLE,TOOLTIP,{[_this select 0,_this select 1,ITEM] call FUNC(hasEquipment)},TREATMENT_ADVANCED(ITEM),'advanced'] call FUNC(addTreatmentOption)
#define ADD_TREATMENT_BANDAGE(TITLE,TOOLTIP,ITEM)         [TITLE,TOOLTIP,{[_this select 0,_this select 1,ITEM] call FUNC(hasEquipment)},TREATMENT_BANDAGE(ITEM),'bandage'] call FUNC(addTreatmentOption)
#define ADD_TREATMENT_MEDICATION(TITLE,TOOLTIP,ITEM)     [TITLE,TOOLTIP,{[_this select 0,_this select 1,ITEM] call FUNC(hasEquipment)},TREATMENT_MEDICATION(ITEM),'medication'] call FUNC(addTreatmentOption)
#define ADD_TREATMENT_OTHER(TITLE,TOOLTIP,ITEM)         [TITLE,TOOLTIP,{[_this select 0,_this select 1,ITEM] call FUNC(hasEquipment)},TREATMENT_OTHER(ITEM),'other'] call FUNC(addTreatmentOption)
