
import js.Browser.document;
import js.Browser.window;
import three.*;

class App {

	static var TIMESTEP = 1/60;

	static var camera : PerspectiveCamera;
	static var scene : Scene;
	static var renderer : CanvasRenderer;
	static var mesh : Mesh;
	static var world : cannon.World;
	static var body : cannon.RigidBody;
	static var shape : cannon.Box;
	static var mass : Float;

	static function initCannon() {

		world = new cannon.World();
		world.gravity.set(0,0,0);
		world.broadphase = new cannon.NaiveBroadphase();
		world.solver.iterations = 10;

		shape = new cannon.Box(new cannon.Vec3(1,1,1));
		mass = 1;
		body = new cannon.RigidBody(mass,shape);
		body.angularVelocity.set(0,10,0);
		body.angularDamping = 0.5;
		world.add(body);
	}

	static function initThree() {
		
		scene = new Scene();
		
		camera = new PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 1, 100 );
		camera.position.z = 5;
		scene.add( camera );

		var geometry = new BoxGeometry( 2, 2, 2 );
		var material = new MeshBasicMaterial( { color: 0xff0000, wireframe: true } );
		mesh = new Mesh( geometry, material );
		scene.add( mesh );

		renderer = new CanvasRenderer();
		renderer.setSize( window.innerWidth, window.innerHeight );
		document.body.appendChild( renderer.domElement );
	}

	static function update() {

		window.requestAnimationFrame( untyped update );

		world.step( TIMESTEP );
		body.position.copy( untyped mesh.position );
		body.quaternion.copy( untyped mesh.quaternion );

		renderer.render( scene, camera );
	}

	static function main() {
		window.onload = function(_) {
			initCannon();
			initThree();
			update();
		}
	}

}