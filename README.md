DBA TTS
-------

An adaptation of De Bellis Antiquitatis for Tabletop Simulator. This was previously developed on a single file with a gist but since it grew, it's now using Atom's include. [More info here](http://blog.onelivesleft.com/2017/08/atom-tabletop-simulator-package.html).

The project is structured in the following way:

- main: The root, and the only lua script needed to import so atom can attach and upload correctly to the game. Doesn't contain functionality by itself.
- scripts/log: A simple script to centralize how the logs (printed to the console and to atom) are written.
- scripts/uievents: The script that controls the uievents
- scripts/utilities: A bunch of utilities since lua doesn't offer much, like vector operations, some algebra, rounding, string utilities, unit conversion etc etc.
- scripts/troop_data: All the data to spawn troops, bases, and armies.
- scripts/logic: All the game logic.
- dice/dice_base: All the code for the different dices
- dice/pip_blue-red: The code assigned to two dice objets, both should be D6 and they calculate the PIPs.
- ui/main.xml: The XML for the UI, which, AFAIK, cannot be #included into TTS through ATOM and needs to be copy/pasted. Can be used directly using <include src="">
- ui/ui_elements.txt: Since the UI is referenced by the Scripting window and must be imported in each game, this is a list to the elements with the corresponding url.

This is still a WIP.