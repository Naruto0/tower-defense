package;

import flixel.FlxG;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.group.FlxContainer.FlxTypedContainer;

class Soldier extends FlxTypedContainer<FlxSprite>
{
    var direction: Int;
    var health: Int;
    var x: Float;
    var y: Float;
    var soldier: FlxSprite;
    var healthBar: FlxBar;

    public function new(x:Float,y:Float, direction:Int) {
        super();
        this.x = x;
        this.y = y;
        this.direction = direction;

        health = 100;
        soldier = new FlxSprite(x, y);
        var color:FlxColor = direction == 1 ? FlxColor.BLUE : FlxColor.RED;
        soldier.makeGraphic(16,16, color);

        healthBar = new FlxBar(x + 1, y - 8, 14, 4, this.health);
        add(soldier);
        add(healthBar);

    }
    override function update(elapsed:Float) {
        super.update(elapsed);
        x += (1 * direction);
        soldier.setPosition(x,y);
        healthBar.setPosition(x+1,y-8);
        if (health < 1)
            destroy();
    }
    public function fight(other:Soldier) {
        var chance: Int = FlxG.random.int(0,4);
        switch (chance)
        {
            case (0):
                health -=10;
                other.health -= 90;
            case (1):
                health -=30;
                other.health -= 60;
            case (2):
                health -= 50;
                other.health -= 50;
            case (3):
                health -=60;
                other.health -= 30;
            case _:
                health -= 90;
                other.health -= 10;
        }
    }
}