# convert starship.toml to nix programs.starship.settings
# Usage: python x.py starship.toml

import tomllib as toml
import sys

def toml_to_nix(d, indent=2):
    result = []
    for k, v in d.items():
        if isinstance(v, dict):
            result.append(f'{k} = {{')
            result.append(toml_to_nix(v, indent + 2))
            result.append(' ' * indent + '};')
        elif isinstance(v, list):
            list_items = [f'"{item}"' if isinstance(item, str) else str(item) for item in v]
            result.append(f'{k} = [ {" ".join(list_items)} ];')
        elif isinstance(v, str):
            result.append(f'{k} = "{v}";')
        elif isinstance(v, bool):
            result.append(f'{k} = {str(v).lower()};')
        else:
            result.append(f'{k} = {str(v)};')
    return '\n'.join(' ' * indent + line for line in result)

def convert_toml_to_nix(toml_file):
    with open(toml_file, 'rb') as f:
        data = toml.load(f)

    nix_config = toml_to_nix(data)

    nix_file = toml_file.replace('.toml', '.nix')
    with open(nix_file, 'w') as f:
        f.write('{\n  programs.starship.settings = {\n')
        f.write(nix_config)
        f.write('\n  };\n}\n')

    print(f'Converted {toml_file} to {nix_file}')

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python x.py starship.toml")
        sys.exit(1)

    convert_toml_to_nix(sys.argv[1])
