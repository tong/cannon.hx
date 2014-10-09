package cannon;

@:native("CANNON.Material")
extern class Material {
	static var idCounter : Int;
	var name : String;
	//var id : Int;
	function new( ?name : String ) : Void;
}
