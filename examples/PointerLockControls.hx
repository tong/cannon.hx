
import three.*;

@:native("PointerLockControls")
extern class PointerLockControls {
	var enabled : Bool;
	function new( camera : Camera, body : Dynamic ) : Void;
	function getObject() : Object3D;
	function update( delta : Float ) : Void;
}
