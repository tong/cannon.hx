package cannon;

private typedef ContactMaterialOptions = Dynamic;
/*
{
	friction: 0.3,
        restitution: 0.3,
        contactEquationStiffness: 1e7,
        contactEquationRelaxation: 3,
        frictionEquationStiffness: 1e7,
        frictionEquationRelaxation: 3
}
*/

@:native("CANNON.ContactMaterial")
extern class ContactMaterial {
	var id : Int;
	var materials : Array<Material>;
	var friction : Float;
	var restitution : Float;
	var contactEquationStiffness : Float;
	var contactEquationRelaxation : Float;
	var contactEquationRegularizationTime : Float;
	var frictionEquationStiffness : Float;
	var frictionEquationRegularizationTime : Float;
	function new( m1 : Material, m2 : Material, options : ContactMaterialOptions ) : Void;
}
