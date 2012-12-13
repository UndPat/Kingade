/*
override public function create():void
{
	start = new FlxText(18, 100, 300, "- APERTE QUALQUER TECLA PARA COMEÇAR -");
	start.alignment = "center";
	start.shadow = 0xff550055;
	start.scrollFactor.x = 0;
	start.scrollFactor.y = 0;
	
	add(start);
	
}
override public function update():void
{
	super.update();
	
	if (FlxG.keys.any())
	{
		FlxG.fade(0xff000000, 2, changeState);
	}
}

private function changeState():void
{
	FlxG.switchState(new PlayState);
}
*/
package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.CenterSlideFX;
	import org.flixel.plugin.photonstorm.FX.FloodFillFX;

	public class MainMenuState extends FlxState
	{
		[Embed(source = '../assets/chapters/chapter 00.png')] private var mainMenuPNG:Class;
		[Embed(source = '../assets/desenhos/LOU70100.jpg')] private var lou70100PNG:Class;
		[Embed(source = '../assets/desenhos/LOU70101.jpg')] private var lou70101PNG:Class;
		[Embed(source = '../assets/desenhos/LOU70102.jpg')] private var lou70102PNG:Class;
		[Embed(source = '../assets/desenhos/LOU70103.jpg')] private var lou70103PNG:Class;
		[Embed(source = '../assets/desenhos/LOU70104.jpg')] private var lou70104PNG:Class;
		[Embed(source = '../assets/desenhos/LOU70105.jpg')] private var lou70105PNG:Class;
		[Embed(source = '../assets/desenhos/LOU70106.jpg')] private var lou70106PNG:Class;
		[Embed(source = '../assets/desenhos/LOU70107.jpg')] private var lou70107PNG:Class;
		[Embed(source = '../assets/desenhos/LOU70108.jpg')] private var lou70108PNG:Class;
		[Embed(source = '../assets/desenhos/LOU70109.jpg')] private var lou70109PNG:Class;
		[Embed(source = '../assets/desenhos/LOU70110.jpg')] private var lou70110PNG:Class;
		[Embed(source = '../assets/desenhos/LOU70111.jpg')] private var lou70111PNG:Class;
		[Embed(source = '../assets/desenhos/LOU70112.jpg')] private var lou70112PNG:Class;

		private static const	BACKGROUND_SPEED :Number = -100;

		private var background	:FlxGroup;
		private var title		:FlxSprite;
		private var backImg1	:FlxSprite;
		private var backImg2	:FlxSprite;
		private var start		:FlxText;
		private var reveal		:CenterSlideFX;
		private var floodfill	:FloodFillFX;
		private var btnPlay		:FlxButtonPlus;
		private var btnCredits	:FlxButtonPlus;
		private var drawings	:Array = new Array(
		lou70100PNG, lou70101PNG, lou70102PNG, lou70103PNG, lou70104PNG, lou70105PNG, lou70106PNG, lou70107PNG, lou70108PNG, lou70109PNG,
		lou70110PNG, lou70111PNG, lou70112PNG
		);
		private var currentDrawing :int;

		public function MainMenuState() {
		}

		override public function create():void {
			Lang.init();

			if (FlxG.getPlugin(FlxSpecialFX) == null){
				FlxG.addPlugin(new FlxSpecialFX);
			}

			FlxG.mouse.show();

			background				= new FlxGroup();
			currentDrawing 			= 0;

			backImg1				= new FlxSprite(0, 0, drawings[currentDrawing++]);
			backImg2				= new FlxSprite(640, 0, drawings[currentDrawing++]);
			backImg1.velocity.x 	= BACKGROUND_SPEED;
			backImg2.velocity.x 	= BACKGROUND_SPEED;

			background.add(backImg1);
			background.add(backImg2);

			reveal 			= FlxSpecialFX.centerSlide();
			floodfill 		= FlxSpecialFX.floodFill();

			var t:FlxSprite = new FlxSprite(0, 0, mainMenuPNG);

			title 					= floodfill.create(t, 0, 0, t.width, t.height, 0, 1);
			title.scrollFactor.x 	= 0;
			title.scrollFactor.y 	= 0;

			start 					= new FlxText(315, 250, 286, Lang.get("gameTitle"));
			start.alignment 		= "center";
			start.color 			= 0x00498A;
			start.shadow 			= 0x0000FF;
			start.size 				= 28;
			start.scrollFactor.x 	= 0;
			start.scrollFactor.y 	= 0;

			//FlxG.playMusic(Assets.musicMainMenu, 1);

			//floodfill.start();

			btnPlay = new FlxButtonPlus(400, 325, onClick, [ "play" ], Lang.get("menuPlay"), 140);
			btnPlay.updateInactiveButtonColors([ 0xffFF0080, 0xffFF80C0 ]);
			btnPlay.updateActiveButtonColors([ 0xffFFFF00, 0xffFF8000 ]);
			setScrollFactorButton(btnPlay, 0);

			btnCredits = new FlxButtonPlus(400, 360, onClick, [ "credits" ], Lang.get("menuCredits"), 140);
			btnCredits.updateInactiveButtonColors([ 0xffFF0080, 0xffFF80C0 ]);
			btnCredits.updateActiveButtonColors([ 0xffFFFF00, 0xffFF8000 ]);
			setScrollFactorButton(btnCredits, 0);

			add(background);
			add(title);
			add(start);
			add(btnPlay);
			add(btnCredits);
		}

		private function setScrollFactorButton(button :FlxButtonPlus, factor :Number) :void {
			button.buttonNormal.scrollFactor.x 		= factor;
			button.buttonNormal.scrollFactor.y 		= factor;

			button.buttonHighlight.scrollFactor.x 	= factor;
			button.buttonHighlight.scrollFactor.y 	= factor;

			button.textNormal.scrollFactor.x 		= factor;
			button.textNormal.scrollFactor.y 		= factor;

			button.textHighlight.scrollFactor.x 	= factor;
			button.textHighlight.scrollFactor.y 	= factor;
		}

		override public function update():void {
			super.update();

			if (FlxG.keys.any()) {
				endCurrentState(startPlayState);
			}

			currentDrawing = currentDrawing >= drawings.length ? 0 : currentDrawing;

			if (!backImg1.onScreen()) {
				background.remove(backImg1, true);
				backImg1.destroy();
				backImg1			= null;
				backImg1 			= new FlxSprite(FlxG.width, 0, drawings[currentDrawing++]);
				backImg1.velocity.x = BACKGROUND_SPEED;

				background.add(backImg1);
			}

			if (!backImg2.onScreen()) {
				background.remove(backImg2, true);
				backImg2.destroy();
				backImg2			= null;
				backImg2 			= new FlxSprite(FlxG.width, 0, drawings[currentDrawing++]);
				backImg2.velocity.x = BACKGROUND_SPEED;

				background.add(backImg2);
			}
		}

		private function endCurrentState(nextStateCallback :Function) :void {
			FlxG.fade(0xff000000, 2, nextStateCallback);
			//FlxG.music.fadeOut(2);
		}

		private function startPlayState():void {
			FlxG.switchState(new CinematicsState);
		}

		private function startCreditsState():void {
			FlxG.switchState(new CreditsState);
		}

		override public function destroy():void	{
			FlxSpecialFX.clear();			
			super.destroy();
		}

		private function onClick(text:String):void {
			endCurrentState(text == "play" ? startPlayState : startCreditsState);
		}

		private function mouseOver():void {
		}

		private function mouseOut():void {
		}
	}
}