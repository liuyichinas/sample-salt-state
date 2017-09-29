{% set version =  pillar['common.jdk']['version']%}
{% set package =  pillar['common.jdk']['package']%}
{% set repopath = pillar['common.jdk']['repo_path'] %}

common.formula.jdk fetch java source:
  archive.extracted:
    - name: /usr/lib
    - archive_format: tar
    - options: v
    - source: salt://tmp/{{ version }}/{{ package }}
    - user: root
    - group: root
    - if_missing: /usr/lib/jdk{{ version }}

common.formula.jdk set local config jdk:
  cmd.run:
    - name: update-alternatives --install /usr/bin/java java /usr/lib/jdk{{ version }}/bin/java 1
    - unless: java -version


