{
  lib,
  aiohttp,
  aresponses,
  buildPythonPackage,
  fetchFromGitHub,
  inflection,
  pyjwt,
  pytest-asyncio,
  pytestCheckHook,
  python-dateutil,
  pythonOlder,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-smarttub";
  version = "0.0.39";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "mdz";
    repo = "python-smarttub";
    tag = "v${version}";
    hash = "sha256-yZrBFUsablu67gfIsWBYc/0k8J5zU1mrWD8kzuNkT+U=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    inflection
    pyjwt
    python-dateutil
  ];

  nativeCheckInputs = [
    aresponses
    pytest-asyncio
    pytestCheckHook
  ];

  pythonImportsCheck = [ "smarttub" ];

  meta = with lib; {
    changelog = "https://github.com/mdz/python-smarttub/releases/tag/v${version}";
    description = "Python API for SmartTub enabled hot tubs";
    homepage = "https://github.com/mdz/python-smarttub";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
