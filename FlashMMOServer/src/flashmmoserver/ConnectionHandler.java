package flashmmoserver;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;
import org.jboss.netty.buffer.ChannelBuffer;
import org.jboss.netty.channel.Channel;
import org.jboss.netty.channel.ChannelHandlerContext;
import org.jboss.netty.channel.ChannelStateEvent;
import org.jboss.netty.channel.ExceptionEvent;
import org.jboss.netty.channel.MessageEvent;
import org.jboss.netty.channel.SimpleChannelUpstreamHandler;

/**
 *
 * @author Knut
 */
public class ConnectionHandler extends SimpleChannelUpstreamHandler{
protected Character player;
public List<Channel> connections = new ArrayList<>();
protected final static String POLICY_REQUEST = "<policy-file-request/>";
protected final static String POLICY_RESPONSE = 
              "<?xml version=\"1.0\"?>"
            + "<cross-domain-policy>"
            + "<allow-access-from domain=\"*\" to-ports=\"*\" />"
            + "</cross-domain-policy>";
 
     private final AtomicLong transferredBytes = new AtomicLong();
  
     public long getTransferredBytes() {
         return transferredBytes.get();
      }
@Override
     public void messageReceived(
              ChannelHandlerContext ctx, MessageEvent e) {
          transferredBytes.addAndGet(((ChannelBuffer) e.getMessage()).readableBytes());
          HandleCommand(e.getChannel(),((ChannelBuffer) e.getMessage()).toString(Charset.defaultCharset()));
      }
    @Override
    public void channelDisconnected(ChannelHandlerContext ctx, ChannelStateEvent e) throws Exception {
        System.out.println("User disconnected: " + ctx.getChannel().getRemoteAddress().toString());
    }

    @Override
    public void channelConnected(ChannelHandlerContext ctx, ChannelStateEvent e) throws Exception {
        System.out.println("User connected: " + ctx.getChannel().getRemoteAddress().toString());
    connections.add(ctx.getChannel());
    }
      @Override
      public void exceptionCaught(ChannelHandlerContext ctx, ExceptionEvent e) {
          System.out.println("Unexpected exception from downstream. " + e.getCause());
          e.getChannel().close();
      }
    public boolean Send(Channel c, byte[] bytes){
        try{
        c.write(bytes);
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    public boolean Send(Channel c, String string){
        string = string + "u0000";
        return Send(c, string.getBytes());
    }
    private void HandleCommand(Channel c, String s){
        try{
        s = s.replace("  ", " ");
        System.out.println("Received " + s + " from " + c.getRemoteAddress().toString());
        final String command = s.substring(0, s.indexOf("///"));
        final String[] p = s.substring(s.indexOf("///"), s.length()).split("///");
    switch(command){
        case POLICY_REQUEST:
            Send(c, POLICY_RESPONSE);
            System.out.println("Sent policy file");
            break;
        case "login":
            String name = p[0];
            if(!Character.isAccount(name)){
                System.out.println("New Player connected: " + name);
            }
            System.out.println("Player connected: " + name);
            break;
        case "POS":
            for(Channel co: connections){
                //if (co == c) continue;
                //Send(co, s);
            }
            break;
    }
    }catch(Exception e){}
    }
    
}
