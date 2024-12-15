#!/bin/bash

Current=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

Dependency=(
	"Biome"
	"Microsoft"
	"OXC"
	"Rolldown"
	"SWC"
	"Tauri"
	"Vercel"
)

for Dependency in "${Dependency[@]}"; do
	(
		Cache="$Current"/Cache

		Organization="$Cache"/Organization/"$Dependency".json
		SubDependency="$Cache"/Dependency/"$Dependency".json

		# "$Current"/Module/Dependency.sh \
		# 	"$Organization" \
		# 	"$SubDependency" \
		# 	"$Dependency"

		# "$Current"/Configure/Dependency.sh \
		# 	"$Organization" \
		# 	"$SubDependency" \
		# 	"$Dependency"

		# "$Current"/Setting/Dependency.sh \
		# 	"$Organization" \
		# 	"$SubDependency" \
		# 	"$Dependency"

		"$Current"/Save/Dependency.sh \
			"$Organization" \
			"$SubDependency" \
			"$Dependency"

		"$Current"/Switch/Branch.sh \
			"$Organization" \
			"$SubDependency" \
			"$Dependency" \
			"Previous"

		"$Current"/Reset/Dependency.sh \
			"$Organization" \
			"$SubDependency" \
			"$Dependency" \
			"Previous"

		"$Current"/Switch/Branch.sh \
			"$Organization" \
			"$SubDependency" \
			"$Dependency" \
			"Current"
	) &
done

\wait
