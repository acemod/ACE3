---
layout: wiki
title: Carry and Drag System
description:
group: framework
order: 5
parent: wiki
---

## 1. Config Values

```
class CfgVehicles {
    class MyVehicle {
        

        ace_dragging_canDrag = 1; // can this object be dragged?; 1 yes, 0 no (0 default)
        ace_dragging_dragPosition[] = {0,1.2,0} // Offset of the model from the body while dragging, comparable to the offset in attachTo (It's the same actually)
        ace_dragging_dragDirection = 0;  // how much degrees is the model rotatated after dragging it (a global setDir after attachTo)

        ace_dragging_canCarry = 1; // can this object be carried?; 1 yes, 0 no (0 default)
        ace_dragging_carryPosition[] = {0,1.2,0}; // Same as drag, but for carrying objects
        ace_dragging_carryDirection = 0; // Same as drag, but for carrying objects

    };
};
```

