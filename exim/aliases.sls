{%- for name, targets in salt['pillar.get']('exim:aliases', {})|dictsort %}
exim-alias-{{ name }}:
{%- if not targets %}
  alias.absent:
    - name: {{ name }}
{%- else %}
  alias.present:
    - name: {{ name }}
    - target:
  {%- if targets is list %}
    {%- for target in targets %}
      - {{ target }}
    {%- endfor %}
  {%- else %}
        {{ targets }}
  {%- endif %}
{%- endif %}
{% endfor %}
