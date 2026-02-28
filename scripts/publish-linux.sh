#!/usr/bin/env bash
set -euo pipefail

RID="${1:-linux-x64}"
OUT_BASE="${2:-publish}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
PROJECT="${REPO_ROOT}/Wallhaven Downloader V2/Wallhaven Downloader V2.csproj"

if ! command -v dotnet >/dev/null 2>&1; then
  echo "dotnet SDK is required but was not found in PATH." >&2
  exit 1
fi

# A) Framework-dependent
DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet publish "${PROJECT}" -c Release -r "${RID}" --self-contained false -o "${REPO_ROOT}/${OUT_BASE}/${RID}/framework-dependent"

# B) Self-contained
DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet publish "${PROJECT}" -c Release -r "${RID}" --self-contained true -o "${REPO_ROOT}/${OUT_BASE}/${RID}/self-contained"

# C) Single-file self-contained
DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet publish "${PROJECT}" -c Release -r "${RID}" --self-contained true -p:PublishSingleFile=true -o "${REPO_ROOT}/${OUT_BASE}/${RID}/single-file"

echo "Linux publish outputs written under ${OUT_BASE}/${RID}/"
