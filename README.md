Generate RPMs using Docker and [FPM](https://github.com/jordansissel/fpm). Basically you get a Docker image with FPM pre-installed and some helper scripts. You do the rest.

### Example
```bash
$ ./build julia 1.0.0:1 centos:7

{:timestamp=>"2018-08-31T00:45:52.937327+0000", :message=>"Created package", :path=>"/packages/julia-1.0.0-1.centos7.x86_64.rpm"}

```
Resulting RPM appears in `packages/` directory.

### Defining new packages
1. Create a directory named after the package.
2. In this directory, create an executable `entrypoint` script that is responsible for downloading/compiling/building the package.
   - This script's environment will contain the following variables (in addition to whatever is set in `.env`):
     - `$PACKAGE_VERSION`
     - `$PACKAGE_ITERATION`
     - `$PACKAGE_DISTRO`
     - `$PACKAGE_MAINTAINER`  # optionally set in .env
     - `$PACKAGE_VENDOR`      # optionally set in .env
   - Packages generated by script should be output to `/packages` within the container.
3. In this directory, create a `Dockerfile` for each distribution (e.g. `Dockerfile.centos7`).
4. Add any ancillary scripts (e.g. RPM pre/post-install scripts) to this directory.
   - These will be available inside the container under `/scripts`.
4. Run `./build <package> <version>:<iteration> <distro>:<version>` from the parent directory.
5. Resulting RPM will appear in `packages/` on the host filesystem.
