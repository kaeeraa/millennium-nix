{
  stdenv,
  fetchFromGitHub,
  cmake,
  python3,
  ninja,
  lib,
  clang,
  glibc,
  autoPatchelfHook,
  zlib,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "millennium";
  version = "2.17.2";

  src = fetchFromGitHub {
    owner = "shdwmtr";
    repo = "millennium";
    rev = "v${finalAttrs.version}";

    fetchSubmodules = true;
    hash = "sha256-Cn84DPxFSGHdx47u3kGh0hDxaQoS5dX1YOMy3VyH+e4=";
  };

  env.NIX_CFLAGS_COMPILE = "-march=x86-64-v3";
  NIX_LDFLAGS = "--hash-style=both";

  cmakeFlags = [
    "-GNinja"
    "-DCMAKE_BUILD_TYPE=Debug"
  ];

  nativeBuildInputs = [
    cmake
    python3
    ninja
    clang
    autoPatchelfHook
  ];

  buildInputs = [
    glibc
    zlib
    stdenv.cc
  ];

  meta = with lib; {
    homepage = "https://github.com/shdwmtr/millennium";
    description = "Millennium is an open-source low-code modding framework to create, manage and use themes/plugins for the desktop Steam Client without any low-level internal interaction or overhead.";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ kaeeraa ];
  };
})
