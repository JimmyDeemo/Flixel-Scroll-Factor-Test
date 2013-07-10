package ;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		// Show the mouse (in case it hasn't been disabled)
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();
		#end
		
		var background:FlxSprite = new FlxSprite(0, 0, "assets/back.png");
		
		add(background);
		
		FlxG.camera.style = FlxCamera.STYLE_NO_DEAD_ZONE;
		FlxG.camera.setBounds(0, 0, background.width, background.height);
		
		super.create();
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		
		if (FlxG.keys.UP)
		{
			FlxG.camera.scroll.y -= 10;
		}
		
		if (FlxG.keys.DOWN)
		{
			FlxG.camera.scroll.y += 10;
		}
		
		if (FlxG.keys.LEFT)
		{
			FlxG.camera.scroll.x -= 10;
		}
		
		if (FlxG.keys.RIGHT)
		{
			FlxG.camera.scroll.x += 10;
		}
	}
}