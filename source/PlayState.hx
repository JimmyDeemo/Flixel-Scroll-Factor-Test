package ;

import flixel.addons.display.FlxExtendedSprite;
import flixel.addons.plugin.FlxMouseControl;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var debugTextCurrentSelection:FlxText = null;
	var debugTextXY:FlxText = null;
	var debugTextScrollFactor:FlxText = null;
	var debugTextDragXY:FlxText = null;
	var debugTextMouseXY:FlxText = null;
	var debugTextMouseScreenXY:FlxText = null;
	var debugTextMouseCameraScrollXY:FlxText = null;
	
	var groupZeroZero:FlxGroup = null;
	
	var textZeroZero:FlxText = null;
	
	var scrollSpriteZeroZero:FlxExtendedSprite = null;
	var scrollSpriteZeroOne:FlxExtendedSprite = null;
	var scrollSpriteOneOne:FlxExtendedSprite = null;
	var scrollSpriteOneZero:FlxExtendedSprite = null;
	var scrollSpritePoint5Point5:FlxExtendedSprite = null;
	var scrollSpritePoint3Point3:FlxExtendedSprite = null;
	var scrollSpritePoint7Point7:FlxExtendedSprite = null;
	
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
		
		FlxG.plugins.add( new FlxMouseControl() );
		
		var background:FlxSprite = new FlxSprite(0, 0, "assets/back.png");
		
		add(background);
		
		groupZeroZero = new FlxGroup();
		scrollSpriteZeroZero = new FlxExtendedSprite(540, 380);
		scrollSpriteZeroZero.makeGraphic( 50, 50, 0xFFFF0000 );
		scrollSpriteZeroZero.scrollFactor = new FlxPoint(0, 0);
		scrollSpriteZeroZero.enableMouseDrag();
		textZeroZero = new FlxText(scrollSpriteZeroZero.x, scrollSpriteZeroZero.y, 50, "0", 12, true, true);
		textZeroZero.scrollFactor = new FlxPoint(0, 0);
		groupZeroZero.add(scrollSpriteZeroZero);
		groupZeroZero.add(textZeroZero);
		add(groupZeroZero);
		
		scrollSpriteZeroOne = new FlxExtendedSprite(540, 380);
		scrollSpriteZeroOne.makeGraphic( 50, 50, 0xFFFF4444 );
		scrollSpriteZeroOne.scrollFactor = new FlxPoint(0, 1);
		scrollSpriteZeroOne.enableMouseDrag();
		add(scrollSpriteZeroOne);
		
		scrollSpriteOneOne = new FlxExtendedSprite(540, 380);
		scrollSpriteOneOne.makeGraphic( 50, 50, 0xFF00FF00 );
		scrollSpriteOneOne.scrollFactor = new FlxPoint(1, 1);
		scrollSpriteOneOne.enableMouseDrag();
		add(scrollSpriteOneOne);
		
		scrollSpriteOneZero = new FlxExtendedSprite(540, 380);
		scrollSpriteOneZero.makeGraphic( 50, 50, 0xFF44FF44 );
		scrollSpriteOneZero.scrollFactor = new FlxPoint(1, 0);
		scrollSpriteOneZero.enableMouseDrag();
		add(scrollSpriteOneZero);
		
		scrollSpritePoint5Point5 = new FlxExtendedSprite(540, 380);
		scrollSpritePoint5Point5.makeGraphic( 50, 50, 0xFFFFFF00 );
		scrollSpritePoint5Point5.scrollFactor = new FlxPoint(0.5, 0.5);
		scrollSpritePoint5Point5.enableMouseDrag();
		add(scrollSpritePoint5Point5);
		
		scrollSpritePoint3Point3 = new FlxExtendedSprite(540, 380);
		scrollSpritePoint3Point3.makeGraphic( 50, 50, 0xFFFFFF44 );
		scrollSpritePoint3Point3.scrollFactor = new FlxPoint(0.3, 0.3);
		scrollSpritePoint3Point3.enableMouseDrag();
		add(scrollSpritePoint3Point3);
		
		scrollSpritePoint7Point7 = new FlxExtendedSprite(540, 380);
		scrollSpritePoint7Point7.makeGraphic( 50, 50, 0xFFFFFF99 );
		scrollSpritePoint7Point7.scrollFactor = new FlxPoint(0.7, 0.7);
		scrollSpritePoint7Point7.enableMouseDrag();
		add(scrollSpritePoint7Point7);
		
		debugTextCurrentSelection = new FlxText(0, 0, 300, "debugTextCurrentSelection", 12);
		debugTextCurrentSelection.scrollFactor = new FlxPoint();
		add(debugTextCurrentSelection);
		debugTextXY = new FlxText(0, 20, 300, "debugTextXY", 12);
		debugTextXY.scrollFactor = new FlxPoint();
		add(debugTextXY);
		debugTextScrollFactor = new FlxText(0, 40, 300, "debugTextScrollFactor", 12);
		debugTextScrollFactor.scrollFactor = new FlxPoint();
		add(debugTextScrollFactor);
		debugTextDragXY = new FlxText(0, 60, 300, "debugTextDragXY", 12);
		debugTextDragXY.scrollFactor = new FlxPoint();
		add(debugTextDragXY);
		debugTextMouseXY = new FlxText(0, 80, 300, "debugTextMouseXY", 12);
		debugTextMouseXY.scrollFactor = new FlxPoint();
		add(debugTextMouseXY);
		debugTextMouseScreenXY = new FlxText(0, 100, 300, "debugTextMouseScreenXY", 12);
		debugTextMouseScreenXY.scrollFactor = new FlxPoint();
		add(debugTextMouseScreenXY);
		debugTextMouseCameraScrollXY = new FlxText(0, 120, 300, "debugTextMouseCameraScrollXY", 12);
		debugTextMouseCameraScrollXY.scrollFactor = new FlxPoint();
		add(debugTextMouseCameraScrollXY);
		
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
			FlxG.camera.scroll.y -= 5;
		}
		
		if (FlxG.keys.DOWN)
		{
			FlxG.camera.scroll.y += 5;
		}
		
		if (FlxG.keys.LEFT)
		{
			FlxG.camera.scroll.x -= 5;
		}
		
		if (FlxG.keys.RIGHT)
		{
			FlxG.camera.scroll.x += 5;
		}
	}
}