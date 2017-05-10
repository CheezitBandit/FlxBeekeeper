# CSC 303 Final Project Proposal

Jess Geiger

## Beehive

Beehive is a new game that I will be making for this submission, based on one of the four game-types from the Tron arcade machine. A player-controlled beekeeper must reach the beehive without being stung (or at least, not too many times!).

The beekeeper will be spawned at a starting position on the map. The hive will be on the opposite side of the map, and near it will spawn a different number of bees based on the difficulty. The bees will move randomly around the map.If they come within a certain distance of the beekeeper, they will "notice" the beekeeper and attempt to sting. The beekeeper must evade the bees, which can be helped by a certain number of flowers that the beekeeper has in their inventory. When thrown, the flowers attract bees towards them and away from the beekeeper.

* Win condition - the beekeeper must reach the honeycomb in the center of the beehive.
* Lose condition - the beekeeper is stung a certain number of times (will figured out what's best during play testing)

The player will control the beekeeper through the use of the keyboard. Arrow keys will control direction, and the space bar will be used to throw flowers.

**Features:**

* Beekeeper - controlled by the player through use of keyboard. Has the ability to move in directions and use distraction.
* Bees - enemies with random movement and randomized spawning, within certain distance of hive. Ability to sting the beekeeper by coming in contact. Will approach beekeeper or flower when either is within a certain distance of the bee.
* Flower - an item which can be thrown by the beekeeper to distract the bees. The beekeeper will start with a certain number of flowers, and one or two more will be available for collection on the map.
* Beehive - a circular area on the map around which the bees will spawn.
* Honeycomb - the object within the beehive which marks the finishing point for the beekeeper.
* Health bar - the beekeeper can only be stung a certain number of times. This must be tracked in a health bar visible to the player.
* Flower count - the amount of flowers in the beekeeper's inventory must also be displayed to the player at all times.
* Difficulty - a choice available in a menu, which pauses the game when brought up. This will essentially be a variablewhich determines how many bees spawn, how many stings it takes to kill the beekeeper, how quickly the bees move, and how many flowers spawn on the map.

https://cheezitbandit.github.io/FlxBeekeeper/