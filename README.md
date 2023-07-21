# Programmable Devices

This is a Factorio mod that exposes RCON console commands to let external programs read and manipulate constant combinators.

This mod is intended in the future to add custom programmable combinators and equipment modules that can integrate with external programs.

## Setup

1. Install the mod in your Factorio mods folder.

2. Run Factorio with RCON enabled. You can do this by hosting a multiplayer game, pressing Escape, holding Ctrl+Alt while pressing Settings, pressing "The rest", and setting "local-rcon-socket" to "127.0.0.1:25575" and "local-rcon-password" to a password of your choice. If instead you're hosting a multiplayer game on a headless server, use the `--rcon-port` and `--rcon-password` command line options.

3. Run a companion program that uses this mod's RCON commands as desired. (TODO create and recommend an official companion program or library.)
