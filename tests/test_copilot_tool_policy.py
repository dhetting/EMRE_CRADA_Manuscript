import importlib.util
from pathlib import Path
import sys
import unittest


def _load_policy_module():
    module_path = Path(__file__).resolve().parents[1] / "scripts" / "copilot_tool_policy.py"
    spec = importlib.util.spec_from_file_location("copilot_tool_policy", module_path)
    if spec is None or spec.loader is None:
        raise RuntimeError("Failed to load copilot_tool_policy module")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


policy = _load_policy_module()


class CopilotToolPolicyPayloadAliasTests(unittest.TestCase):
    def test_extract_command_reads_tool_arguments_alias(self):
        payload = {"toolArguments": {"command": "pixi run test"}}
        self.assertEqual(policy.extract_command(payload), "pixi run test")

    def test_is_shell_tool_reads_name_alias(self):
        payload = {"name": "bash"}
        self.assertTrue(policy.is_shell_tool(payload))


if __name__ == "__main__":
    unittest.main()
