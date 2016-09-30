{%- from "exim/map.jinja" import exim with context -%}

{%- set config = {
  'configtype': salt['pillar.get']('exim:config:configtype', 'local'),
  'other_hostnames': salt['pillar.get'](
      'exim:config:other_hostnames',
      salt['grains.get']('fqdn', '')),
  'local_interfaces': salt['pillar.get'](
      'exim:config:local_interfaces',
      salt['grains.get']('ip_interfaces:lo', '127.0.0.1')),
  'readhost': salt['pillar.get']('exim:config:readhost', ''),
  'relay_domains': salt['pillar.get']('exim:config:relay_domains', []),
  'minimaldns': salt['pillar.get']('exim:config:minimaldns', False),
  'relay_nets': salt['pillar.get']('exim:config:relay_nets', []),
  'smarthost': salt['pillar.get']('exim:config:smarthost', []),
  'use_split_config': salt['pillar.get']('exim:config:use_split_config', False),
  'hide_mailname': salt['pillar.get']('exim:config:hide_mailname', False),
  'mailname_in_oh': salt['pillar.get']('exim:config:mailname_in_oh', True),
  'localdelivery': salt['pillar.get']('exim:config:localdelivery', 'mail_spool'),
} -%}

include:
  - exim

exim-update-conf-conf:
  file.managed:
    - name: {{ exim.config_dir }}/{{ exim.update_conf }}
    - source: salt://exim/files/update-exim4.conf.conf.jinja
    - template: jinja
    - context:
        config: {{ config|json }}
    - watch_in:
      - module: exim-reload
