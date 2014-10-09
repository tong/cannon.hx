package cannon;

@:native("CANNON.RaycastResult")
extern class RaycastResult {
	function new() : Void;
	function reset() : Void;
	function set(
		rayFromWorld : Dynamic,
		rayToWorld : Dynamic,
		hitNormalWorld : Dynamic,
		hitPointWorld : Dynamic,
		shape : Dynamic,
		body : Dynamic,
		distance : Dynamic ) : Void;
}
