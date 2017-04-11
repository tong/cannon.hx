
@:native("PointerLockControls")
extern class PointerLockControls {
	var enabled : Bool;
	function new( camera : three.cameras.Camera, body : Dynamic ) : Void;
	function getObject() : three.core.Object3D;
	function update( delta : Float ) : Void;
}
