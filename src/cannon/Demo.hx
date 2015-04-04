package cannon;

/**
	Demo framework class. If you want to learn how to connect Cannon.js with Three.js, please look at the examples/ instead.
*/
@:native("CANNON.Demo")
extern class Demo {

	function new( options : Dynamic ) : Void;

	/**
		Add a scene to the demo app
	*/
	function addScene( title : String, initfunc : Void->Void ) : Void;

	/**
		Restarts the current scene
	*/
	function restartCurrentScene() : Void;

}
