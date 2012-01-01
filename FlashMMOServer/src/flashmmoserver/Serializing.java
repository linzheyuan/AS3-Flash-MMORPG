package flashmmoserver;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Collection;

/**
 *
 * @author Knut
 */
public class Serializing {
    public static boolean Serialize(String name, Collection<? extends Object> e){
        return Serialize(new File(name), e);
    }
    public static boolean Serialize(File file, Collection<? extends Object> e){
        Queue tempQueue = new Queue();
        tempQueue.putAll(e);
        try {
      FileOutputStream fout = new FileOutputStream(file);
      ObjectOutputStream oos = new ObjectOutputStream(fout);
      oos.writeObject(tempQueue);
      oos.close();
      return true;
      } catch(Exception ex){
          return false;
      }
    }
    public static Queue Unserialize(String file){
        return Unserialize(new File(file));
    }
    public static Queue Unserialize(File file){
        try{
        return Unserialize(new FileInputStream(file));
        } catch(Exception e){
            return null;
        }
    }
    public static Queue Unserialize(FileInputStream stream){
        Queue tempQueue = new Queue();
        try{
        ObjectInputStream ois = new ObjectInputStream(stream);
        tempQueue = (Queue) ois.readObject();
        ois.close();
        return tempQueue;
        } catch(Exception e){
        return null;
        }
    }
}
