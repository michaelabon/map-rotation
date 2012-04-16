#!/usr/bin/env ruby

require "yaml"

CONFIG_FN = "map-rotation.yaml"
DEFAULT_TARGET = "maplist.txt"

USAGE = <<EOS
Usage: map-rotation [options]

The possible options are:

  -v, --verbose    print the maplist to STDOUT as well as to file
  --dump-config    print out current configuration and exit

To start building a configuration fie, run `map-rotation --dump-config >
map-rotation.yaml` and edit it. The config file is a YAML file that specifies
the tiers of maps and how many maps to select from each tier. It also has a
few configuration options for map-rotation itself, but those are all specified
when you dump the config.
EOS

if ARGV.delete("--help") || ARGV.delete("-h")
	puts USAGE
	exit
end

class MapRotation
  class << self
    attr_accessor :default_cfg
  end

	@default_cfg = {"tiers"=>[{"tier"=>1, "name"=>"Premier", "choose"=>3, "maps"=>["pl_goldrush", "cp_dustbowl", "pl_badwater"]}, {"tier"=>2, "name"=>"Lengthy Maps", "choose"=>1, "maps"=>["tc_hydro", "plr_hightower", "cp_freight_final1", "cp_fastlane", "cp_well", "cp_granary", "cp_coldfront"]}, {"tier"=>3, "name"=>"Payload", "choose"=>1, "maps"=>["pl_hoodoo_final", "plr_pipeline", "pl_upward", "pl_frontier_final", "pl_barnblitz", "plr_nightfall_final"]}, {"tier"=>4, "name"=>"KOTH", "choose"=>1, "maps"=>["koth_badlands", "koth_harvest_final", "koth_harvest_event", "koth_nucleus", "koth_sawmill", "koth_viaduct", "koth_lakeside_final"]}, {"tier"=>5, "name"=>"CP", "choose"=>1, "maps"=>["cp_gullywash_final1", "cp_gravelpit", "cp_badlands", "cp_gorge", "cp_steel", "cp_5gorge", "cp_degrootkeep", "cp_manor_event", "cp_mountainlab", "cp_yukon_final", "cp_egypt_final", "cp_junction_final"]}, {"tier"=>6, "name"=>"CTF", "choose"=>1, "maps"=>["ctf_doublecross", "ctf_turbine", "ctf_2fort", "ctf_well", "ctf_sawmill"]}, {"tier"=>7, "name"=>"Custom", "choose"=>1, "maps"=>["cp_crossroads_b5", "ctf_turbine_pro_b1", "cp_warmfront", "ctf_2fort_mario_b4", "cp_lwobtsud", "cp_tiplevarg", "pl_retawdab", "cp_warpath2", "cp_lazytown_e", "cp_lazytown_lazynite", "pl_halfacre", "ctf_hallofdeath", "pl_donkeykong_final", "ctf_mach4", "cp_busytown", "ctf_impact2", "cp_castle4", "cp_bighalls_b1", "cp_toy_fort_alt2", "cp_wolf"]}, {"tier"=>8, "name"=>"Arena", "choose"=>1, "maps"=>["arena_badlands", "arena_granary", "arena_lumberyard", "arena_ravine", "arena_well", "arena_offblast_final", "arena_sawmill", "arena_nucleus", "arena_watchtower"]}], "targetFile"=>"maplist.txt", "verbose"=>true}

  def run
		# Load config
		cfg = MapRotation.default_cfg.merge begin
			fn = CONFIG_FN
			if File.exists?(fn) && (h = YAML::load_file(fn))
				h
			else
				{}
			end
    end
		cfg["verbose"] = true if ARGV.delete("--verbose") || ARGV.delete("-v")
		cfg["targetFile"] ||= DEFAULT_TARGET

    if ARGV.delete("--dump-config")
			puts cfg.to_yaml
			exit 0
		end

		results = cfg["tiers"].map do |t|
			t["maps"].shuffle.take(t["choose"].to_i)
		end
		results.shuffle!
		File.open(cfg["targetFile"], 'w') do |f|
			results.each do |r|
				f.puts r
				puts r if cfg["verbose"]
			end
    end
    exit 0
	end
end

AUTHOR = "Mike Kenyon"

LICENSE = <<EOS
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
EOS

WARRANTY = <<EOS
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
EOS


