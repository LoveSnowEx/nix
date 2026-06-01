{ llm-agents }:
[
  (import ./zimfw.nix)
  (import ./llm-agents.nix { inherit llm-agents; })
]
