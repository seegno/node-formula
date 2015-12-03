# node

Installs [node](https://nodejs.org/).

## Available States

#### ``node``

Installs node from the provided [tarball files](https://nodejs.org/dist/).

###  ``node.pm2``

Install pm2 globally with npm

## Platforms

Right now only Ubuntu 64 bits is supported.

## Usage

 * Bootstrap your machine with [salt-bootstrap](https://github.com/saltstack/salt-bootstrap).
 * Set your pillar data with the version and the md5sum of the file:
```yaml
node:
  version: 4.2.2
  tar-md5: d15578f9497cfc470876035be6817b44
  pm2:
    version: 0.15.10
```
 * Add the state to your machine highstate or call it directly ``salt "my-machine-name" state.sls node``

```bash
$ salt "my-machine-name" cmd.run "node --version"
v4.2.2
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
