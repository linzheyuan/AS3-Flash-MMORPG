package flashmmoserver;

import java.net.InetSocketAddress;
import java.util.concurrent.Executors;
import org.jboss.netty.bootstrap.ServerBootstrap;
import org.jboss.netty.channel.Channels;
import org.jboss.netty.channel.socket.nio.NioServerSocketChannelFactory;
import org.jboss.netty.channel.ChannelPipeline;
import org.jboss.netty.channel.ChannelPipelineFactory;

/**
 *
 * @author Knut
 */
public class FlashMMOServer {
    protected final static ConnectionHandler connectionHandler = new ConnectionHandler();
    public static void main(String[] args) {
        ServerBootstrap bootstrap = new ServerBootstrap(
                  new NioServerSocketChannelFactory(
                          Executors.newCachedThreadPool(),
                          Executors.newCachedThreadPool()));
        bootstrap.setPipelineFactory(new ChannelPipelineFactory() {
             public ChannelPipeline getPipeline() throws Exception {
                 ChannelPipeline pipeline = Channels.pipeline();
    //pipeline.addLast("deflater", new ZlibEncoder(ZlibWrapper.ZLIB, 9));
    //pipeline.addLast("inflater", new ZlibDecoder(ZlibWrapper.ZLIB));
    pipeline.addLast("handler", connectionHandler);
             return pipeline;
             }
         });
        new Thread(){
        public void run()
        {
            while(true){
            long lastReceive = 0;
            try{
            Thread.sleep(5000);
            System.out.println("Total bytes received: " + connectionHandler.getTransferredBytes() + " (" + (connectionHandler.getTransferredBytes() - lastReceive) / (System.currentTimeMillis() * 1000) + "bits/s)");
            lastReceive = connectionHandler.getTransferredBytes();
            }catch(Exception e){}
            }
        }
        }.start();
        bootstrap.bind(new InetSocketAddress(6666));
    }
}
