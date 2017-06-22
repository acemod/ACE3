{% if include.component == "headless" %}
`acex_main`
{% endif %}

{% if include.component == "sitting" %}
`acex_main`, `ace_interaction`
{% endif %}

{% if include.component == "viewrestriction" %}
`acex_main`
{% endif %}

