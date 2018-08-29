# packages
Generate RPMs using Docker and FPM.

### Example
```bash
$ ./build elixir 1.7.2
```
Resulting RPM appears in `packages/` directory.

### Defining new packages
1. Create a directory named after the package.
2. Add an `entrypoint.sh` that is responsible for downloading/compiling the package. This script will receive one argument: the version.
3. Add any ancillary scripts (e.g. RPM pre/post-install scripts) to the directory. These will be available inside the container under `/scripts`.
4. Run `./build <package> <version>`
5. Resulting RPM will appear in `packages/`
