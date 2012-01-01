package flashmmoserver;

import java.util.List;

/**
 *
 * @author Knut
 */
public class Character {
    public final String Name;
    public Vector2 Position;
    public int Level;
    public int Experience;
    public int Health;
    public int Mana;
    public List<Skill> Skills;
    public List<Item> Items;
    
    public Character(String Name, Vector2 Position, int Level, int Experience, int Health, int Mana, List<Skill> Skills, List<Item> Items){
        this.Name = Name;
        this.Position = Position;
        this.Level = Level;
        this.Experience = Experience;
        this.Health = Health;
        this.Mana = Mana;
        this.Skills = Skills;
        this.Items = Items;
    }
    public static Character loadCharacter(String name)
    {
        return null;
    }
    public static Boolean isAccount(String name){
        return true;
    }
    public static Character newCharacter(String name){
        return null;
    }
}
