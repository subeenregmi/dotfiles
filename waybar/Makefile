DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: run

run:
	pkill .waybar-wrapped; hyprctl dispatch exec "waybar --config $(DIR)/config --style $(DIR)/style.css"

manual:
	waybar --config $(DIR)/config --style $(DIR)/style.css
