{% from "iojs/map.jinja" import iojs with context %}
{% set filename = "node-v" + iojs["version"] + "-linux-x64.tar.gz" %}

iojs-get-tarball:
  file.managed:
    - name: /tmp/{{ filename }}
    - source: https://nodejs.org/dist/v{{ iojs["version"]}}/{{ filename }}
    - source_hash: md5={{ iojs["tar-md5"] }}

iojs-extract-tarball:
  cmd.run:
    - name: tar xf /tmp/{{ filename }}
    - cwd: /tmp
    - require:
      - file: iojs-get-tarball
    - watch:
      - file: iojs-get-tarball

iojs-move-files:
  cmd.run:
    - name: /usr/bin/rsync -ap ./ /usr/local/node
    - cwd: /tmp/node-v{{ iojs["version"] }}-linux-x64

iojs-doc-directory:
  file.directory:
    - name: /usr/local/node/share/docs
    - group: root
    - makedirs: True
    - mode: 755
    - user: root

iojs-make-bom:
  cmd.run:
    - name: tar tf /tmp/{{ filename }} > /usr/local/node/share/docs/files
    - cwd: /tmp
    - require:
      - file: iojs-get-tarball
    - watch:
      - file: iojs-get-tarball

iojs-link-node:
  file.symlink:
    - name: /usr/local/bin/node
    - target: /usr/local/node/bin/node

iojs-link-npm:
  file.symlink:
    - name: /usr/local/bin/npm
    - target: /usr/local/node/bin/npm

