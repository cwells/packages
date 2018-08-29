# packages
Generate RPMs using Docker and FPM. Basically you get a Docker image with FPM pre-installed and some helper scripts. You do the rest.

### Example
```bash
$ ./build elixir 1.7.2
```
Resulting RPM appears in `packages/` directory.

### Defining new packages
1. Create a directory named after the package.
2. Add an `entrypoint.sh` that is responsible for downloading/compiling/building the package to this directory. 
   - This script will receive `version` as its sole argument.
   - Packages should be output to `/packages`.
3. Add any ancillary scripts (e.g. RPM pre/post-install scripts) to this directory. 
   - These will be available inside the container under `/scripts`.
4. Run `./build <package> <version>` from the parent directory.
5. Resulting RPM will appear in `packages/`
