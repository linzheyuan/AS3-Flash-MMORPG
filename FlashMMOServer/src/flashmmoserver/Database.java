package flashmmoserver;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;



public class Database {
    private final String Name;
    private final int Columns;
    private List<Object[]> rows = new ArrayList<>();
    public Database(String Name, int Columns){
        this.Name = Name;
        this.Columns = Columns;
    }
    public String getName(){
        return Name;
    }
    public int getColumns(){
        return Columns;
    }
    public Collection<?extends Object[]> getRows(){
        return rows;
    }
    public Object[] getRowAt(int i){
        return rows.get(i);
    }
    public Object getElementAt(int x, int y){
        return rows.get(x)[y];
    }
    public void add(Object[] e){
        rows.add(e);
    }
    public void add(Object[] e, int i){
        rows.add(i, e);
    }
    public void addAll(Collection<?extends Object[]> e){
        rows.addAll(e);
    }
    public void remove(Object[] o){
        rows.remove(o);
    }
    public void remove(int i){
        rows.remove(i);
    }
}
