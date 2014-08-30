
import three.*;

extern class PointerLockControls {
	var enabled : Bool;
	function new( camera : Camera, cannonBody : Dynamic ) : Void;
	function getObject() : Object3D;
	function update( delta : Float ) : Void;
}
