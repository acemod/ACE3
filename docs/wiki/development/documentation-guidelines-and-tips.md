---
layout: wiki
title: Documentation guidelines and tips
group: development
parent: wiki
order: 19
---

## 1. Documentation Guidelines

- A line between each entry like above.
    - This is especially necessary for the kramdown markup syntax. Kramdown needs a line break between each block level element (paragraphs, lists, codeblocks, etc ...)
- Use `ACE3` instead of `ACE 3`.
- Remove each entry that is not used.
- Don't forget to say what you're going to work on in #documentation in slack or [this topic](https://github.com/acemod/ACE3/issues/1166)
- Keybinds in ``` <kbd>keyboard tags</kbd>  ```
- Keywords in ``` `backticks`  ```
- Capitals at the start of a sentence and `.`at the end.
- Verify everything in game

### 1.1 Tips

- Use [http://dillinger.io/](http://dillinger.io/) to keep your sanity
- [Markdown cheat sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

### 1.2 Feature Template

```
---
layout: wiki
title: Component
description: Description of the feature.
group: feature
category: interaction
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview

### 1.1 Sub-feature 1

Short description of sub-feature 1.

### 1.2 Sub-feature 2

Short description of sub-feature 2.

## 2. Usage

### 2.1 Thing n°1

- Step 1.
- Step 2.
- Step 3.

### 2.2 Thing n°2

- Step 1.
- Step 2.
- Step 3.

## 3. Dependencies

{% raw %}{% include dependencies_list.md component="blank" %}{% endraw %}

## 4. Guides

Information about other guides and pages about this feature.
```

### 1.3 Framework Template

```
---
layout: wiki
title: Component Framework
description: Description of the framework.
group: framework
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Config Values

Config API.

## 2. Events

Table of public events.

## 3. Scripting

Public functions.
```
