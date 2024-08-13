---
layout: wiki
title: Dependencies
description: This page details each component and its dependencies.
group: development
parent: wiki
order: 0
---

This page details each component and the addons it requires.

## 1. Removing a component

Any component you wish to remove must also remove any component which depends on it.

**Example:**

To remove `ace_ai` you must also remove `ace_zeus`.

Because `ace_zeus` is being removed you must also remove any components that require `ace_zeus` which in this case would be `ace_intelitems`.

## 2. Dependencies

{% assign pages_by_title = site.pages | sort_natural: "title" %}
{% for page in pages_by_title %}
    {%- if page.group == 'feature' and page.component -%}
        {%- unless page.version.removed -%}
            ### {{ page.title }}
            
            {% capture component %}{{ page.component }}{% endcapture %}
            {% include dependencies_list.md component=component %}

            {%- if page.core_component -%}
                _Note: This module is required by nearly all other modules. Do NOT remove it!_
            {% endif %}
        {% endunless %}
    {% endif %}
{% endfor %}
