# packages
Generate RPMs using Docker and FPM. 

### Example
```bash
$ ./build elixir 1.7.2
```
Resulting RPM appears in `packages/` directory.

### Creating new packages
1. create a directory named after the package.
2. Add an `entrypoint.sh` that is responsible for downloading/compiling the package.
3. Add any ancillory scripts (e.g. RPM pre- post-install scripts) to the directory.
4. run `./build <package> <version>`
5. Resulting RPM will appear in `packages/`
