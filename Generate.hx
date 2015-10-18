
import sys.FileSystem;
import sys.io.File;
import haxe.Json;

using StringTools;

typedef ClassType = Dynamic; //TODO
typedef ClassItem = Dynamic; //TODO

class Generate {

	static function getType( type : String ) : String {
		if( type == null ) return 'Dynamic';
		if( type.startsWith( '{' ) ) type = type.substr(1);
		if( type.endsWith( '}' ) ) type = type.substr( 0, type.length-1 );
		type = type.substr( 0, 1 ).toUpperCase() + type.substr(1);
		return switch type {
		case 'Array': 'Array<Dynamic>';
		case 'Boolean': 'Bool';
		case 'Integer': 'Int';
		case 'Number': 'Float';
		case 'Object': 'Dynamic';
		case 'Function': 'Void->Void';
		case 'Mixed': 'Dynamic';
		default: type;
		}
	}

	static function getDoc( doc : String, indent = 0 ) {
		var indentStr = '';
		for( i in 0... indent ) indentStr += '\t';
		var str = '$indentStr/**\n';
		if( doc != null ) str += indentStr+'\t$doc\n';
		str += indentStr+'*/\n';
		return str;
		//return '/**\n\t$doc\n*/\n';
	}

	static function main() {

		var sourceFile = 'data.json';
		var targetDirectory = 'src/cannon';

		if( !FileSystem.exists( targetDirectory ) )
			FileSystem.createDirectory( targetDirectory );

		var api = Json.parse( File.getContent( sourceFile ) );
		var classes : Array<ClassType> = api.classes;
		var classitems : Array<ClassItem> = api.classitems;
		//var project = api.modules;
		//var modules = api.modules;
		//var files = api.files;
		//var warnings = api.warnings;

		for( clName in Reflect.fields( classes ) ) {

			//trace( "########################################################"+clName );

			var cl = Reflect.field( classes, clName );

			// Package
			var buf = new StringBuf();
			buf.add( 'package cannon;\n\n' );

			// Class documentation
			buf.add( getDoc( cl.description ) );

			// Class
			buf.add( '@:native("CANNON.$clName")\nextern class $clName ' );
			var clExtends = Reflect.field( cl, 'extends' );
			if( clExtends != null ) buf.add( 'extends $clExtends ' );
			buf.add( '{\n\n' );

			// Get class properties and methods
			var properties = new Array<Dynamic>();
			var methods = new Array<Dynamic>();
			for( item in classitems ) {
				if( Reflect.field( item, 'class' ) == clName ) {
					switch item.itemtype {
					case 'property': properties.push(item);
					case 'method': methods.push(item);
					}
				}
			}

			// Properties
			for( prop in properties ) {
				var str =  '';
				if( prop.description != null ) str += getDoc( prop.description, 1 );
				str += '\t';
				if( Reflect.field( prop, 'static' ) == 1 ) str += 'static ';
				str += 'var ${prop.name} : ${getType( prop.type )};';
				buf.add( str+'\n\n' );
			}

			// Constructor
			buf.add( '\tfunction new(' );
			if( cl.params != null ) {
				var clParams : Array<Dynamic> = cl.params;
				var params = new Array<String>();
				for( param in clParams ) {
					/*
					var paramType = switch param.type {
					case 'Object': 'Dynamic';
					case 'Number': 'Float';
					default: param.type;
					}
					*/
					//constructorsParams.push( param.name+' : '+getType( param.type ) );
//TODO
					//trace(param);
					//trace( getType( param.type ) );
					//trace(param);
					var paramsStr = '';
					if( param.optional != null && param.optional ) {
						//trace( cl.name+":"+param.name );
						paramsStr += '?';
					}
					//trace(param.optional);
					paramsStr += param.name+' : '+getType( param.type );
					//trace( StringTools.startsWith( param.name, '_' ) );
					//if( StringTools.startsWith( param.name, '_' ) ) trace("optional ");
					//params.push( param.name+' : '+getType( param.type ) );
					params.push( paramsStr );
				}
				if( params.length > 0 ) {
					buf.add( ' '+params.join(', ')+' ' );
				}
			}
			buf.add( ') : Void;\n\n' );

			// Methods
			for( meth in methods ) {

				var str =  '';
				if( meth.description != null ) str += getDoc( meth.description, 1 );
				str += '\t';

				if( Reflect.field( meth, 'static' ) == 1 ) str += 'static ' else {
					if( clExtends != null ) {
						//TODO check if super class has method (override)
						//trace("###### "+cl.name);

						for( superClassName in Reflect.fields( classes ) ) {
							if( superClassName == clExtends ) {
								//trace(superClassName);
								//getClass();
								var superMethods = new Array<Dynamic>();
								for( item in classitems ) {
									if( Reflect.field( item, 'class' ) == superClassName ) {
										if( item.itemtype == 'method' ) {
											//trace(item);
											if( item.name == meth.name ) {
												//trace("OVERRIDE "+meth.name);
												str += 'override ';
											}

										}
									}
								}
								break;
							}
						}
					}
				}

				str += 'function '+meth.name+'(';
				if( meth.params != null ) {
					var methParams = new Array<String>();
					var _methParams : Array<Dynamic> = meth.params;
					for( param in _methParams) {
						var type = (param.type == null) ? param.name : param.type;
						methParams.push( param.name+' : '+getType( type ) );
					}
					if( methParams.length > 0 ) {
						str += ' '+methParams.join(', ')+' ';
					}
				}
				str += ')';
				var returnType : String = null;
				var _returnType = Reflect.field( meth, 'return' );
				if( _returnType == null ) {
					returnType = 'Void';
				} else {
					if( _returnType.type != null ) returnType = _returnType.type;
					else returnType = _returnType.description;
				}
				str += ' : '+getType( returnType )+';';
				buf.add( '$str\n\n' );
			}


			buf.add( '}\n' );

			var file = File.write( targetDirectory+'/'+clName+'.hx' );
			file.writeString( buf.toString() );
			file.close();
		}
	}
}
