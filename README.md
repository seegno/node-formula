# io.js

Installs [io.js](https://iojs.org/).

## Available States

#### ``iojs``

Installs iojs from the provided [tarball files](https://iojs.org/dist/).

## Platforms

Right now only Ubuntu 64 bits is supported.

## Usage

 * Bootstrap your machine with [salt-bootstrap](https://github.com/seegno/iojs-formula).
 * Set your pillar data with the version and the md5sum of the file:
```yaml
iojs:
  version: 1.1.0
  tar-md5: b80c3d95a44bbd31e0b39503470832d0
```
 * Add the state to your machine highstate or call it directly ``salt "my-machine-name" state.sls iojs``

```bash
$ salt "my-machine-name" cmd.run "node --version"
v1.1.0
```

## Testing

Testing is done with [kitchen-salt](https://github.com/simonmcc/kitchen-salt).

Install it via bundler:

```
bundle
```

Then run test-kitchen with:

```
kitchen converge
```

## Author

[Alfredo Palhares](https://github.com/masterkorp)
