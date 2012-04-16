MapRotation
===========

Builds a new map rotation file for hl2-based games

Usage
-----

Usage: `map-rotation` [options]

The possible options are:

    -v, --verbose    print the maplist to STDOUT as well as to file
    --dump-config    print out current configuration and exit

To start building a configuration fie, run `map-rotation --dump-config >
map-rotation.yaml` and edit it. The config file is a YAML file that specifies
the tiers of maps and how many maps to select from each tier. It also has a
few configuration options for map-rotation itself, but those are all specified
when you dump the config.
