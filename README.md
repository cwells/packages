Generate RPMs using Docker and [FPM](https://github.com/jordansissel/fpm). Basically you get a Docker image with FPM pre-installed and some helper scripts. You do the rest.

### Example
```bash
$ ./build elixir 1.7.2 centos:7
```
Resulting RPM appears in `packages/` directory.

### Defining new packages
1. Create a directory named after the package.
2. In this directory, create an `entrypoint.sh` that is responsible for downloading/compiling/building the package.
   - This script will receive `version` and `distro` as its arguments.
   - Packages should be output to `/packages` within the container.
3. Add any ancillary scripts (e.g. RPM pre/post-install scripts) to this directory.
   - These will be available inside the container under `/scripts`.
4. Run `./build <package> <version> <distro>` from the parent directory.
5. Resulting RPM will appear in `packages/` on the host filesystem.
