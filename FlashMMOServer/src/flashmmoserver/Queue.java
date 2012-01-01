package flashmmoserver;

import java.util.Collection;
import java.util.Vector;

/**
 *
 * @author Knut
 */

 public class Queue extends Vector {
  Queue() {
  super();
  }
 
 public void put(Object o) {
  addElement(o);
  }
 public void putAll(Collection<? extends Object> e){
     addAll(e);
 }

  public Object get() {
  if (isEmpty()) return null;
    Object o = firstElement();
    removeElement(o);
    return o;
  }

  public Object peek() {
  if (isEmpty()) return null;
    return firstElement();
    }
}
