---
layout: wiki
title: Sitting framework
description:
group: framework
order: 5
parent: wiki
---

## 1. adding sitting support to a chair

```c++
class CfgVehicles {

    #define MACRO_SEAT_ACTION \  // better use a macro, nobody wants to type this two times or more, right ?
        class ACE_Actions { \
            class ACE_MainActions { \
                displayName = "$STR_ACE_Interaction_MainAction"; \
                selection = ""; \
                distance = 1.5; \
                condition = "true"; \
                class ACE_sitting_Sit { \
                    displayName = "$STR_ACE_Sitting_Sit"; \
                    condition = "_this call ace_sitting_fnc_canSit"; \
                    statement = "_this call ace_sitting_fnc_sit"; \
                    showDisabled = 0; \
                    priority = 0; \
                    icon = "z\ace\sitting\UI\sit_ca.paa"; \
                }; \
            }; \
        };

    class ThingX;  // base class for objects

    class yourChair: ThingX {  // your chair class
        XEH_ENABLED;  // enable XEH on that object class
        MACRO_SEAT_ACTION  // add the interaction
        ACE_sitting_canSit = 1;  // enable sitting
        ACE_sitting_sitDirection = 180;  // sitting direction in degrees
        ACE_sitting_sitPosition[] = {0, -0.1, -0.45};  // sitting position in a X Y Z plane
        ACE_sitting_sitRotation = 10;  // maximum rotation possible in degrees, left and right.
    };
};
```

- No escape possible here, you'll have to fiddle with the position direction and rotation to have a normal pose.
- For the sitRotation 10 is use for chairs with arms, 45 for the ones without.
