De Bellis Antiquitatis 2.2 for Tabletop Simulator
=================================================

Features: Setup
---------------

- Create tables with different environments, like grass fields, steppe or deserts.
- Automatically fix terrain to the table so it doesn't move.
- Automatic army creation based on the DBA lists. The models have been adapted and lists are easy to create using a scripting system.
- Spawned bases have a base ground theme depending on the table created. Furtheremore, lighter troops spawn in a loose formation, and there are variations between models and textures.
- The game will tell the options of the army so you don't have to doublecheck everything.
- There's a checkbox to enable deployment rulers which significantly help with the deployment.
- The armies, including bases, are color coded, to avoid confusions.
- The models have a specific minimal collider to avoid problem with pikes, calvary, etc.

Features: Gameplay
------------------

- Snapping system: When you drop a base close to another, they will snap, as long as they are close enough and the angle is correct. Snapping includes charging and even "close the door" manouver. It can be turned off for particular manouvers.
- Single movement: If you pick a base and move it, a small text will appear in the screen telling exactly in realtime how many paces you are moving. This includes all corners, so it's useful for rotations etc. Once dropped, the total will be shown in the log.
- Reset movement: When moving a single base, if snapping is active, and you move less than 10pieces, resets the abse to its original position, which can be useful to evaluate future movements.
- Group movement: Select multiple bases and with one click move all as a group forward! You can select how much to move with a slider.
- Preview movement: Using the slider, you also have a small gizmo in front of the troops that shows where the base will end after pressing move.
- Preview Bow/Artillery range: Like the movement, the range is also projected from the future movement position (which you can set position to check the current range).
- Show ZOC: Like the arty range, this is an option that can be toggled that shows how far the ZOC extends.
- Push back Column: Moves a column back, by the depth of the front element (if the element has more depth than width, only pushes back by its width).

Development
-----------

This was previously developed on a single file with a gist but since it grew, it's now using Atom's include. [More info here](http://blog.onelivesleft.com/2017/08/atom-tabletop-simulator-package.html).

The project is structured in the following way:

- main: The root, and the only lua script needed to import so atom can attach and upload correctly to the game. Doesn't contain functionality by itself.
- scripts/log: A simple script to centralize how the logs (printed to the console and to atom) are written.
- scripts/uievents: The script that controls the uievents
- scripts/utilities: A bunch of utilities since lua doesn't offer much, like vector operations, some algebra, rounding, string utilities, unit conversion etc etc.
- scripts/data_*: All the data to spawn troops, bases, and armies, and general settings.
- scripts/logic_*: All the game logic.
- dice/dice_base: All the code for the different dices
- dice/pip_blue-red: The code assigned to two dice objets, both should be D6 and they calculate the PIPs.
- ui/main.xml: The XML for the UI, which, AFAIK, cannot be #included into TTS through ATOM and needs to be copy/pasted. Can be used directly using include src tag.
- ui/ui_elements.txt: Since the UI is referenced by the Scripting window and must be imported in each game, this is a list to the elements with the corresponding url.

It's not required, but it's encouraged to put this repo with the name "dba22_tts" with main.ttslua inside and everything following the structure of the repo. That's only if you want to match the one uploaded in the repo. Otherwise, the only thing required is:

* In Global.-1.ttslua, put:

    #include dba22_tts/main

* In Global.-1.ttslua, put:

    <Include src="dba22_tts\ui\main.xml"/>

* Create two dice object, red and blue, and put this in each:

    #include dba22_tts/scripts/dice/pip_blue
    #include dba22_tts/scripts/dice/pip_red

TODO
----

The project is managed by a trello board:

https://trello.com/b/4XQ8tFlB/dba-tts

License
-------

See the LICENSE.md at the top directory.