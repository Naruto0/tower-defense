package;

import flixel.FlxG;
import flixel.graphics.tile.FlxGraphicsShader;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxState;

class PlayState extends FlxState
{
	var teamBlue: FlxTypedGroup<Soldier>;
	var teamRed: FlxTypedGroup<Soldier>;
	var timer: FlxTimer;

	override public function create()
	{
		super.create();
		teamBlue = new FlxTypedGroup<Soldier>();
		teamRed = new FlxTypedGroup<Soldier>();
		timer = new FlxTimer().start(1,spawnSoldiers,0);
		add(teamBlue);
		add(teamRed);

	}

	function spawnSoldiers(timer: FlxTimer) {
		var soldier1 = new Soldier(0, (FlxG.height / 2), 1);
		var soldier2 = new Soldier(FlxG.width - 16, (FlxG.height / 2), -1);
		teamBlue.add(soldier1);
		teamRed.add(soldier2);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.overlap(teamBlue, teamRed, handleContact);
	}

	function handleContact(blueSoldier:Soldier, redSoldier:Soldier) {
		blueSoldier.fight(redSoldier);
	}
}
