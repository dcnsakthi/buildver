import sys

def normalize_version(version, length=4, pad_front=False):
    parts = version.split('.')
    if pad_front:
        while len(parts) < length:
            parts.insert(0, '0')
    else:
        while len(parts) < length:
            parts.append('0')
    return parts[:length]

def sum_versions(build_version, build_number):
    build_version_parts = normalize_version(build_version)
    build_number_parts = normalize_version(build_number, pad_front=True)
    
    result_parts = []
    for bv, bn in zip(build_version_parts, build_number_parts):
        result_parts.append(str(int(bv) + int(bn)))
    
    return '.'.join(result_parts)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python buildver.py <build_version> <build_number>")
        sys.exit(1)
    
    build_version = sys.argv[1]
    build_number = sys.argv[2]
    envfullbuildVersion = sum_versions(build_version, build_number)
    print(envfullbuildVersion)