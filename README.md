# buildVer

This method dynamically generates a result like `1.0.5.541` from various `buildVersion` inputs such as `1.0.0.0`, `1.0.0`, `1.0`, or `1`, and then appends the `buildNumber` `0.5.541`, `5.541` or `0.0.5.541`  to the end of the `buildVersion`.

# Build Version Script
This script is used to normalize and sum versions. The `normalize_version` function normalizes the version by padding it with zeros to a specified length. The `sum_versions` function sums two versions and returns the result.

## Usage

```bash

./buildver.sh 1.0 0.5.541
./buildver.sh 1 5.541
./buildver.sh 1.0.0.0 0.5.541
./buildver.sh 1.0.0 5.541
./buildver.sh 1.0.0 0.5.541
./buildver.sh 1.0.5 541

```

This will output `1.0.5.541`.
