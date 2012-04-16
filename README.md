MapRotation
===========

Builds a new map rotation file for hl2-based games

Installation
------------

    gem install map-rotation

Usage
-----

Usage: `map-rotation` [options]

The possible options are:

    -v, --verbose    print the maplist to STDOUT as well as to file
    --dump-config    print out current configuration and exit


Configuration
-------------

To start building a configuration fie, run `map-rotation --dump-config >
map-rotation.yaml` and edit it. The config file is a YAML file that specifies
the tiers of maps and how many maps to select from each tier. It also has a
few configuration options for map-rotation itself, but those are all specified
when you dump the config.

A sample config:

    ---
    - tiers:
      - choose: 2
        maps:
          - pl_goldrush
          - cp_dustbowl
          - pl_badwater
      - choose: 1
        maps:
        - tc_hydro
        - plr_hightower
    - verbose: true
	- targetFile: /path/to/desired/mapcycle.txt

This will make a map list with three maps: two from the first tier and
one from the second. The `verbose` key will make map-rotation print out
the map list to STDOUT in addition to writing it to a file.
