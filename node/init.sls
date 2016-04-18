{% from "node/map.jinja" import node with context %}
{% set filename = "node-v" + node["version"] + "-linux-x64.tar.xz" %}

node-get-tarball:
  file.managed:
    - name: /tmp/{{ filename }}
    - source: https://nodejs.org/dist/v{{ node["version"]}}/{{ filename }}
    - source_hash: md5={{ node["tar-md5"] }}

node-extract-tarball:
  cmd.run:
    - name: tar xf /tmp/{{ filename }}
    - cwd: /tmp
    - require:
      - file: node-get-tarball
    - watch:
      - file: node-get-tarball

node-move-files:
  cmd.run:
    - name: /usr/bin/rsync -ap ./ /usr/local/node
    - cwd: /tmp/node-v{{ node["version"] }}-linux-x64

node-doc-directory:
  file.directory:
    - name: /usr/local/node/share/docs
    - group: root
    - makedirs: True
    - mode: 755
    - user: root

node-make-bom:
  cmd.run:
    - name: tar tf /tmp/{{ filename }} > /usr/local/node/share/docs/files
    - cwd: /tmp
    - require:
      - file: node-get-tarball
    - watch:
      - file: node-get-tarball

node-link-node:
  file.symlink:
    - name: /usr/local/bin/node
    - target: /usr/local/node/bin/node

node-link-npm:
  file.symlink:
    - name: /usr/local/bin/npm
    - target: /usr/local/node/bin/npm

