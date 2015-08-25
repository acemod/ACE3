---
layout: wiki
title: Sitting Framework
description: Explains how to set-up sitting furniture with ACE3 sitting system.
group: framework
order: 5
parent: wiki
---

## 1. Adding sitting support to a chair

<div class="panel callout">
    <h5>Note:</h5>
    <p>Unfinished! What you see below will not work in ACE 3.2.1</p>
</div>

```c++
class CfgVehicles {
    class MyChair {
        ace_sitting_canSit = 1;  // Enable sitting (0-disabled, 1-enabled)
        ace_sitting_sitDirection = 180;  // Initial sitting direction (in degrees)
        ace_sitting_sitPosition[] = {0, -0.1, -0.45};  // Sitting position in model space
        ace_sitting_sitRotation = 10;  // Maximum rotation possible in degrees, left and right.
    };
};
```
