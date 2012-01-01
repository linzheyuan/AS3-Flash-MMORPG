package flashmmorpg 
{
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.net.XMLSocket;
	import flash.utils.ByteArray;
	/**
	 * ...
	 * @author Knut
	 */
	public class Server 
	{

		public static const Host:String = "127.0.0.1";
		public static const Port:int = 6666;
		
		public static const Sock:XMLSocket = new XMLSocket();
		
		private static var bytes:ByteArray = new ByteArray();
		public function Connect():void
		{
			Sock.addEventListener(Event.CONNECT, this.onConnection);
			Sock.addEventListener(ProgressEvent.SOCKET_DATA, this.onData);
			Sock.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
			Sock.addEventListener(IOErrorEvent.IO_ERROR, this.onDisconnect);
			Sock.connect(Host, Port);
		}
		private function onSecurityError(e:Event):void
		{
			trace("Error receiving certificate");
		}
		private function onDisconnect(e:Event):void
		{
			trace("Disconnected");
		}
		private function onConnection(e:Event):void
		{
			trace("Connected to server");
			
		}
		private function onData(e:DataEvent):void
		{
			trace("Received ", e.data);
			var command:String = e.data.substring(0, e.data.indexOf("///"));
			var params:Array = e.data.substring(e.data.indexOf("///"), e.data.length).split("///");
		}
		public function Send(string:String):void {
			//string += "\r\n";
			//bytes.clear();
			//bytes.writeObject(string);
			//bytes.compress();
			//bytes.position = 0;
			//Sock.writeBytes(bytes);
			//Sock.flush();
			Sock.send(string);
			trace("Sending: " + string + " size: " + string.length);
		}
		private function handleInput(data:String):void
		{
			
		}
	}

}