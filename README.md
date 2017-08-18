### Pre-requisites

**To get this package running, simply:**

- *install **[node](https://nodejs.org/).***
- *type node **``node`` under gnu bash to install node from the provided [tarball files](https://nodejs.org/dist/).***
- *then type  **``node.pm2`` to Install pm2 globally with npm***

The only current supported os is **Ubuntu 64 bits**.

<hr/>

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

<hr/>

## Testing

Testing is done with *[kitchen-salt](https://github.com/simonmcc/kitchen-salt).*

*To do so:*

- *Install it via bundler: **```bundle```***
- *then run test-kitchen with: **```kitchen converge```***

<hr/>

## Author

[Alfredo Palhares](https://github.com/masterkorp)

<img src="https://avatars2.githubusercontent.com/u/1326469?v=4&s=200" width="150"></img>
<img src="https://orig15.deviantart.net/5b95/f/2016/070/3/b/mit_license_logo_by_excaliburzero-d9ur2lg.png" width="150"></img>
