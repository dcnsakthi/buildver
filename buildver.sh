#!/bin/bash

normalize_version() {
    local version=$1
    local length=${2:-4}
    local pad_front=${3:-false}
    IFS='.' read -r -a parts <<< "$version"
    
    if [ "$pad_front" = true ]; then
        while [ ${#parts[@]} -lt $length ]; do
            parts=(0 "${parts[@]}")
        done
    else
        while [ ${#parts[@]} -lt $length ]; do
            parts+=("0")
        done
    fi
    
    echo "${parts[@]:0:$length}"
}

sum_versions() {
    local build_version=$1
    local build_number=$2
    
    IFS=' ' read -r -a build_version_parts <<< "$(normalize_version "$build_version")"
    IFS=' ' read -r -a build_number_parts <<< "$(normalize_version "$build_number" 4 true)"
    
    local result_parts=()
    for i in "${!build_version_parts[@]}"; do
        result_parts+=($((${build_version_parts[$i]} + ${build_number_parts[$i]})))
    done
    
    echo "${result_parts[*]}" | tr ' ' '.'
}

# Usage
build_version=$1
build_number=$2
envfullbuildVersion=$(sum_versions "$build_version" "$build_number")
echo "$envfullbuildVersion" 
# Expected Output: 1.0.5.541
