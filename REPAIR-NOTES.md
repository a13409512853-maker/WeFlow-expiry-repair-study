# WeFlow 5.1.0 compatible repair test build

This project is provided strictly for study, research and reference. Actual
use, including use with real accounts or chat records, is prohibited by this
project's stated policy. Platform security systems may flag third-party tools
as abnormal activity and impose account restrictions; the attached screenshots
do not establish a particular technical detection or a definite cause.

This is an unofficial experimental build based on the mjkyleo/weflow source
snapshot, with the Windows x64 native component matching the user's 5.1.0
installer. The source snapshot's package version is 5.0.0; it must not be
represented as an official 5.1.0 source release.

The original `resources/wcdb/win32/x64/wcdb_api.dll` SHA-256 was
`6397760da70de8062829fbe6a2ec01cf0616d6f2b334e6fe54873898f38f7ad7`.
The patched file SHA-256 is
`74c96063fe619a84c9ab665c7d7d4fcf4ea1def866ea5197b407983a858bf175`.
Two date constants in this exact Windows x64 DLL were extended to 2037.
No other architecture or DLL version is covered. The native DLL remains a
precompiled binary; its original implementation source is not included.

The test build uses a separate app identifier and user-data folder,
`%APPDATA%\WeFlow-Repair-Test`, and disables automatic updates. The executable
is still named `WeFlow.exe` because initialization checks its host context.
`installer-repair.nsh` omits the original installer's online runtime download;
the Windows runtime DLLs included in the repository are packaged with it.

Offline Windows Sandbox tests: installer exit 0; process running after launch;
separate user-data folder created; database worker initialized, opened a new
synthetic empty database, executed a literal SELECT query with the expected
result, and closed it. A separate original-application worker test repeated
initialization, open, query and close in a second process successfully.
An empty test database has no chat tables; no real WeChat database, messages,
media, export, upgrade, uninstall, or tray-exit/restart workflow was tested.
The installer and modified DLL have no publisher digital signature.

Do not test this project with actual accounts or data. This is not a guarantee
of complete functionality or data safety.

To build on Windows x64, install the lockfile dependencies using npm and run
`npm run build -- --win nsis --x64 --publish never`. No credentials are
included. Build artifacts and node_modules are excluded from this source pack.
