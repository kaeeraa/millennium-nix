{
  stdenv,
  fetchFromGitHub,
  cmake,
  python3,
  ninja,
  lib,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "millennium";
  version = "2.17.2";

  src = fetchFromGitHub {
    owner = "shdwmtr";
    repo = "millennium";
    rev = "v${finalAttrs.version}";

    fetchSubmodules = true;
    hash = "";
  };

  nativeBuildInputs = [
    cmake
    python3
    ninja
  ];

  meta = with lib; {
    homepage = "https://github.com/shdwmtr/millennium";
    description = "Millennium is an open-source low-code modding framework to create, manage and use themes/plugins for the desktop Steam Client without any low-level internal interaction or overhead.";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ kaeeraa ];
  };
})
