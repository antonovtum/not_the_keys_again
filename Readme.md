
A template project with a Makefile that supports sub-directories.

The Makefile will automatically detect and compile new source files
when they are added to the "src" and "res" directories.

Project directories
  - src: Main program source files (.c, .h, .s) can go here
  - res: Program graphics and audio source files (.c, .h, .s) can go here
  - obj: Compiled ROM (.gb) and debug files go in this directory

== version 2.5, main changes ==
  - double jump bug removed
  - added a pass before memory assignment for final window adjustments
  - shingles can't spawn above racks
  - spikes can't spawn above awnings
  - slightly diferent hurt physics (still not fixed but will not fix)
  - new sfx for breaking bricks

== version 2.4, main changes ==
  - reworked collider mecanics so now they are interactable with the environment
  - new map struct storing the collider info of all windows plus their status
  - bricks now break
  - clothes spawn at racks and fall when interacted with
  - new weeds at hub

== version 2.2, main changes ==

  - fix collision code
  - fix player state machine
  
  - add discarded falling platform
  - destructible solid platforms
  - bouncy platform fix and flavor sfx

== version 2.1, main changes ==

  - further optimizations: reduced draw calls on new floor generation to 1
  - number of frames needed to populate next floor window graphics buffer: 4
  - number of memory calls per frame: 3 (new memory function to write rectangular areas)
  - further optimizations: instantiate_colliders code refactoring

== future planned changes ==

  - collision system overhaul: make collisions with types make different memory calls //DONE
  - player state overhaul: make player's finite state machine sturdier with pointers to code for exiting and treating states 
  - further optimizations

  - bird enemy
  - game over screen flavor
  - graphic improvements //DONE
  - music and sound overhaul
  - opening cinematic and title screen
